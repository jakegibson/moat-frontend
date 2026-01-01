import 'package:flutter/material.dart';

class CommentInput extends StatefulWidget {
  final void Function(String content) onSubmit;
  final bool isLoading;

  const CommentInput({
    required this.onSubmit,
    this.isLoading = false,
    super.key,
  });

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _hasContent = false;

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
    super.dispose();
  }

  void _onTextChanged() {
    final hasContent = _controller.text.trim().isNotEmpty;
    if (hasContent != _hasContent) {
      setState(() => _hasContent = hasContent);
    }
  }

  void _handleSubmit() {
    final content = _controller.text.trim();
    if (content.isEmpty || widget.isLoading) return;

    widget.onSubmit(content);
    _controller.clear();
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              maxLines: 4,
              minLines: 1,
              enabled: !widget.isLoading,
              decoration: InputDecoration(
                hintText: 'Add a comment...',
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
          const SizedBox(width: 12),
          IconButton.filled(
            onPressed: _hasContent && !widget.isLoading ? _handleSubmit : null,
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
    );
  }
}
