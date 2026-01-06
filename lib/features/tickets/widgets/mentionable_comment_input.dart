import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../data/task_models.dart';

/// A comment input widget with @mention support.
class MentionableCommentInput extends StatefulWidget {
  final void Function(String content, List<String> mentionedMemberIds) onSubmit;
  final List<AssignableMember> availableMembers;
  final bool isLoading;

  const MentionableCommentInput({
    required this.onSubmit,
    required this.availableMembers,
    this.isLoading = false,
    super.key,
  });

  @override
  State<MentionableCommentInput> createState() =>
      _MentionableCommentInputState();
}

class _MentionableCommentInputState extends State<MentionableCommentInput> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _hasContent = false;
  bool _showMentionPicker = false;
  String _mentionQuery = '';
  int _mentionStartIndex = -1;
  final List<String> _mentionedMemberIds = [];
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _focusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _onTextChanged() {
    final hasContent = _controller.text.trim().isNotEmpty;
    if (hasContent != _hasContent) {
      setState(() => _hasContent = hasContent);
    }

    _checkForMention();
  }

  void _checkForMention() {
    final text = _controller.text;
    final cursorPos = _controller.selection.baseOffset;

    if (cursorPos <= 0) {
      _hideMentionPicker();
      return;
    }

    // Find the @ symbol before the cursor
    int atIndex = -1;
    for (int i = cursorPos - 1; i >= 0; i--) {
      if (text[i] == '@') {
        atIndex = i;
        break;
      }
      if (text[i] == ' ' || text[i] == '\n') {
        break;
      }
    }

    if (atIndex >= 0) {
      final query = text.substring(atIndex + 1, cursorPos);
      // Only show picker if query is valid (no spaces after @)
      if (!query.contains(' ') && !query.contains('\n')) {
        _mentionStartIndex = atIndex;
        _mentionQuery = query.toLowerCase();
        _showMentionPickerOverlay();
        return;
      }
    }

    _hideMentionPicker();
  }

  void _showMentionPickerOverlay() {
    if (_showMentionPicker) {
      _overlayEntry?.markNeedsBuild();
      return;
    }

    setState(() => _showMentionPicker = true);

    _overlayEntry = OverlayEntry(
      builder: (context) => _MentionPickerOverlay(
        layerLink: _layerLink,
        members: _getFilteredMembers(),
        query: _mentionQuery,
        onSelect: _insertMention,
        onDismiss: _hideMentionPicker,
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideMentionPicker() {
    if (!_showMentionPicker) return;
    setState(() => _showMentionPicker = false);
    _removeOverlay();
    _mentionStartIndex = -1;
    _mentionQuery = '';
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  List<AssignableMember> _getFilteredMembers() {
    if (_mentionQuery.isEmpty) {
      return widget.availableMembers.take(5).toList();
    }

    return widget.availableMembers.where((member) {
      final fullName = member.fullName.toLowerCase();
      final email = member.email.toLowerCase();
      return fullName.contains(_mentionQuery) || email.contains(_mentionQuery);
    }).take(5).toList();
  }

  void _insertMention(AssignableMember member) {
    final text = _controller.text;
    final cursorPos = _controller.selection.baseOffset;

    // Replace @query with @name
    final beforeMention = text.substring(0, _mentionStartIndex);
    final afterMention = text.substring(cursorPos);
    final mentionText = '@${member.fullName} ';

    _controller.text = beforeMention + mentionText + afterMention;
    _controller.selection = TextSelection.collapsed(
      offset: _mentionStartIndex + mentionText.length,
    );

    // Track mentioned member
    if (!_mentionedMemberIds.contains(member.id)) {
      _mentionedMemberIds.add(member.id);
    }

    _hideMentionPicker();
    _focusNode.requestFocus();
  }

  void _handleSubmit() {
    final content = _controller.text.trim();
    if (content.isEmpty || widget.isLoading) return;

    widget.onSubmit(content, List.from(_mentionedMemberIds));
    _controller.clear();
    _mentionedMemberIds.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_mentionedMemberIds.isNotEmpty) ...[
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: _mentionedMemberIds.map((id) {
                final member = widget.availableMembers
                    .firstWhere((m) => m.id == id, orElse: () => AssignableMember(
                      id: id,
                      firstName: '',
                      lastName: '',
                      email: '',
                    ));
                return Chip(
                  label: Text(member.fullName.isNotEmpty ? member.fullName : 'Unknown'),
                  deleteIcon: const Icon(Icons.close, size: 16),
                  onDeleted: () {
                    setState(() => _mentionedMemberIds.remove(id));
                  },
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: CompositedTransformTarget(
                  link: _layerLink,
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    maxLines: 4,
                    minLines: 1,
                    enabled: !widget.isLoading,
                    decoration: InputDecoration(
                      hintText: 'Add a comment... (use @ to mention)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                    onSubmitted: (_) => _handleSubmit(),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                onPressed:
                    _hasContent && !widget.isLoading ? _handleSubmit : null,
                icon: widget.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MentionPickerOverlay extends StatelessWidget {
  final LayerLink layerLink;
  final List<AssignableMember> members;
  final String query;
  final void Function(AssignableMember) onSelect;
  final VoidCallback onDismiss;

  const _MentionPickerOverlay({
    required this.layerLink,
    required this.members,
    required this.query,
    required this.onSelect,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    if (members.isEmpty) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        // Tap outside to dismiss
        Positioned.fill(
          child: GestureDetector(
            onTap: onDismiss,
            behavior: HitTestBehavior.opaque,
            child: Container(color: AppColors.transparent),
          ),
        ),
        // Picker positioned above the text field
        CompositedTransformFollower(
          link: layerLink,
          targetAnchor: Alignment.topLeft,
          followerAnchor: Alignment.bottomLeft,
          offset: const Offset(0, -4),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 200,
                maxWidth: 280,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 4),
                itemCount: members.length,
                itemBuilder: (context, index) {
                  final member = members[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 16,
                      child: Text(
                        member.firstName.isNotEmpty
                            ? member.firstName[0].toUpperCase()
                            : '?',
                      ),
                    ),
                    title: Text(
                      member.fullName,
                      style: AppTextStyles.body,
                    ),
                    subtitle: Text(
                      member.email,
                      style: AppTextStyles.bodySmall,
                    ),
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    onTap: () => onSelect(member),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
