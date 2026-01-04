import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../data/warranty_coverage_client.dart';
import '../data/warranty_models.dart';

/// Drawer for resolving warranty expiration with an action record.
class ResolveWarrantyDrawer extends StatefulWidget {
  final WarrantyCoverage coverage;
  final String assetId;
  final List<WarrantyCoverageHistory> existingHistory;
  final VoidCallback onSaved;
  final VoidCallback onClose;

  const ResolveWarrantyDrawer({
    required this.coverage,
    required this.assetId,
    this.existingHistory = const [],
    required this.onSaved,
    required this.onClose,
    super.key,
  });

  @override
  State<ResolveWarrantyDrawer> createState() => _ResolveWarrantyDrawerState();
}

class _ResolveWarrantyDrawerState extends State<ResolveWarrantyDrawer> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _warrantyClient = getIt<WarrantyCoverageClient>();

  bool _isLoading = false;
  bool _isEditing = false;
  WarrantyHistoryType? _selectedType;
  WarrantyCoverageHistory? _mostRecentHistory;

  @override
  void initState() {
    super.initState();

    // Get the most recent history entry for this coverage
    if (widget.existingHistory.isNotEmpty) {
      final filtered = widget.existingHistory
          .where((h) => h.coverageId == widget.coverage.id)
          .toList();
      filtered.sort((a, b) => b.date.compareTo(a.date));
      if (filtered.isNotEmpty) {
        _mostRecentHistory = filtered.first;
        _selectedType = _mostRecentHistory!.type;
        _descriptionController.text = _mostRecentHistory!.description ?? '';
      }
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  bool get _isViewMode =>
      _mostRecentHistory != null && !_isEditing;

  Future<void> _saveResolution() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an action'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Call API to save warranty coverage history
      await _warrantyClient.addCoverageHistory(
        coverageId: widget.coverage.id,
        type: _selectedType!,
        description: _descriptionController.text.trim(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Resolution saved successfully'),
            backgroundColor: AppColors.success,
          ),
        );
        widget.onSaved();
        widget.onClose();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving resolution: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      color: AppColors.white,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.borderPrimary),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: widget.onClose,
                  icon: const Icon(Icons.close, size: 20),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.bgSecondary,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Resolve Warranty Expiration',
                  style: AppTextStyles.textLGSemibold,
                ),
              ],
            ),
          ),

          // Form
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose the most accurate resolution. We'll attach your response to the asset for future reference.",
                        style: AppTextStyles.textMD,
                      ),
                      const SizedBox(height: 24),

                      // Action dropdown
                      Text('Action', style: AppTextStyles.textSMMedium),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<WarrantyHistoryType>(
                        initialValue: _selectedType,
                        decoration: InputDecoration(
                          hintText: 'Choose an option...',
                          filled: _isViewMode,
                          fillColor:
                              _isViewMode ? AppColors.bgSecondary : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        items: WarrantyHistoryType.values.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type.displayName),
                          );
                        }).toList(),
                        onChanged: _isViewMode
                            ? null
                            : (value) {
                                setState(() => _selectedType = value);
                              },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an action';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),

                      // Description field
                      Text('Description', style: AppTextStyles.textSMMedium),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 7,
                        enabled: !_isViewMode,
                        decoration: InputDecoration(
                          hintText: 'Add notes',
                          filled: _isViewMode,
                          fillColor:
                              _isViewMode ? AppColors.bgSecondary : null,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: _isViewMode
                            ? null
                            : (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please add a description';
                                }
                                return null;
                              },
                      ),

                      // Show history dates if available
                      if (_mostRecentHistory != null) ...[
                        const SizedBox(height: 24),
                        Text(
                          'Completion Date',
                          style: AppTextStyles.textSMMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Completed: ${DateFormatter.formatFriendlyDate(dateTime: _mostRecentHistory!.date)}',
                          style: AppTextStyles.textMD,
                        ),

                        // Show edit history
                        if (widget.existingHistory.length > 1) ...[
                          const SizedBox(height: 8),
                          ...widget.existingHistory
                              .where((h) =>
                                  h.coverageId == widget.coverage.id &&
                                  h.id != _mostRecentHistory!.id)
                              .take(3)
                              .map((history) => Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      'Edited: ${DateFormatter.formatFriendlyDate(dateTime: history.date)}',
                                      style: AppTextStyles.textSM.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  )),
                        ],
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Actions
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.borderPrimary),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.onClose,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 48),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : _isViewMode
                            ? () => setState(() => _isEditing = true)
                            : _saveResolution,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 48),
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.white,
                            ),
                          )
                        : Text(_isViewMode ? 'Edit' : 'Save'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
