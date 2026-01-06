import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../gen/moat/v1/analytics.pb.dart' as pb;
import '../state/explore_state.dart';

/// Dialog for saving a query to the library or dashboard.
class SaveQueryDialog extends StatefulWidget {
  final ExploreState state;

  const SaveQueryDialog({
    super.key,
    required this.state,
  });

  /// Shows the dialog and returns true if saved successfully.
  static Future<bool> show(BuildContext context, ExploreState state) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => SaveQueryDialog(state: state),
    );
    return result ?? false;
  }

  @override
  State<SaveQueryDialog> createState() => _SaveQueryDialogState();
}

class _SaveQueryDialogState extends State<SaveQueryDialog> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _addToDashboard = false;
  String? _selectedDashboardId;
  bool _createNewDashboard = false;
  final _newDashboardNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-populate with NL question if available
    final nlQuestion = widget.state.nlQuestion.value;
    if (nlQuestion.isNotEmpty) {
      _nameController.text = nlQuestion.length > 50
          ? '${nlQuestion.substring(0, 50)}...'
          : nlQuestion;
    }

    // Load dashboards
    widget.state.loadDashboards();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _newDashboardNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLG),
      ),
      child: Container(
        width: 480,
        padding: const EdgeInsets.all(AppSizes.spacingXL),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.utilityBlue50,
                      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    ),
                    child: const Icon(
                      Icons.save_outlined,
                      size: 20,
                      color: AppColors.utilityBlue700,
                    ),
                  ),
                  const SizedBox(width: AppSizes.spacingMD),
                  const Text('Save Query', style: AppTextStyles.textLGSemibold),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: () => Navigator.pop(context, false),
                    color: AppColors.textTertiary,
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.spacingXL),

              // Name field
              Text('Name', style: AppTextStyles.textSMSemibold),
              const SizedBox(height: AppSizes.spacingSM),
              TextFormField(
                controller: _nameController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'e.g., Monthly asset count by type',
                  hintStyle: AppTextStyles.textSM.copyWith(
                    color: AppColors.textTertiary,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    borderSide: const BorderSide(color: AppColors.borderPrimary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    borderSide: const BorderSide(color: AppColors.borderPrimary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    borderSide: const BorderSide(
                      color: AppColors.blueLight700,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spacingMD,
                    vertical: AppSizes.spacingSM,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSizes.spacingLG),

              // Description field
              Text('Description', style: AppTextStyles.textSMSemibold),
              const SizedBox(height: AppSizes.spacingSM),
              TextFormField(
                controller: _descriptionController,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Optional description...',
                  hintStyle: AppTextStyles.textSM.copyWith(
                    color: AppColors.textTertiary,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    borderSide: const BorderSide(color: AppColors.borderPrimary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    borderSide: const BorderSide(color: AppColors.borderPrimary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    borderSide: const BorderSide(
                      color: AppColors.blueLight700,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spacingMD,
                    vertical: AppSizes.spacingSM,
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.spacingLG),

              // Add to dashboard option
              const Divider(),
              const SizedBox(height: AppSizes.spacingMD),

              CheckboxListTile(
                value: _addToDashboard,
                onChanged: (value) {
                  setState(() {
                    _addToDashboard = value ?? false;
                    if (!_addToDashboard) {
                      _selectedDashboardId = null;
                      _createNewDashboard = false;
                    }
                  });
                },
                title: const Text('Add to dashboard', style: AppTextStyles.textSMSemibold),
                subtitle: Text(
                  'Pin this query to a dashboard for quick access',
                  style: AppTextStyles.textXS.copyWith(color: AppColors.textTertiary),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                activeColor: AppColors.blueLight700,
              ),

              // Dashboard selection
              if (_addToDashboard) ...[
                const SizedBox(height: AppSizes.spacingMD),
                _buildDashboardSelector(),
              ],

              const SizedBox(height: AppSizes.spacingXL),

              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(
                      'Cancel',
                      style: AppTextStyles.textSM.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSizes.spacingMD),
                  Watch((context) {
                    final isSaving = widget.state.isSaving.value;
                    return ElevatedButton(
                      onPressed: isSaving ? null : _save,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueLight700,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spacingXL,
                          vertical: AppSizes.spacingSM,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                        ),
                      ),
                      child: isSaving
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.white,
                                ),
                              ),
                            )
                          : const Text('Save'),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardSelector() {
    return Watch((context) {
      final dashboards = widget.state.dashboards.value;
      final isLoading = widget.state.isLoadingDashboards.value;

      if (isLoading) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.spacingMD),
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Existing dashboards
          if (dashboards.isNotEmpty) ...[
            Text(
              'Select dashboard',
              style: AppTextStyles.textXS.copyWith(color: AppColors.textTertiary),
            ),
            const SizedBox(height: AppSizes.spacingSM),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderPrimary),
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
              ),
              child: Column(
                children: [
                  for (final dashboard in dashboards)
                    _buildDashboardOption(dashboard),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spacingMD),
          ],

          // Create new dashboard option
          if (!_createNewDashboard)
            TextButton.icon(
              onPressed: () => setState(() => _createNewDashboard = true),
              icon: const Icon(Icons.add, size: 18),
              label: Text(
                dashboards.isEmpty ? 'Create a dashboard' : 'Create new dashboard',
                style: AppTextStyles.textSM.copyWith(
                  color: AppColors.blueLight700,
                ),
              ),
            )
          else ...[
            Text(
              'New dashboard name',
              style: AppTextStyles.textXS.copyWith(color: AppColors.textTertiary),
            ),
            const SizedBox(height: AppSizes.spacingSM),
            TextFormField(
              controller: _newDashboardNameController,
              decoration: InputDecoration(
                hintText: 'e.g., Asset Analytics',
                hintStyle: AppTextStyles.textSM.copyWith(
                  color: AppColors.textTertiary,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                  borderSide: const BorderSide(color: AppColors.borderPrimary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                  borderSide: const BorderSide(color: AppColors.borderPrimary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                  borderSide: const BorderSide(
                    color: AppColors.blueLight700,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spacingMD,
                  vertical: AppSizes.spacingSM,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close, size: 18),
                  onPressed: () => setState(() {
                    _createNewDashboard = false;
                    _newDashboardNameController.clear();
                  }),
                ),
              ),
            ),
          ],
        ],
      );
    });
  }

  Widget _buildDashboardOption(pb.Dashboard dashboard) {
    final isSelected = _selectedDashboardId == dashboard.id;

    return InkWell(
      onTap: () => setState(() {
        _selectedDashboardId = isSelected ? null : dashboard.id;
        _createNewDashboard = false;
      }),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.spacingMD),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.utilityBlue50 : null,
          border: Border(
            bottom: BorderSide(
              color: AppColors.borderSecondary,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.dashboard_outlined,
              size: 20,
              color: isSelected ? AppColors.blueLight700 : AppColors.textTertiary,
            ),
            const SizedBox(width: AppSizes.spacingMD),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dashboard.name,
                    style: AppTextStyles.textSM.copyWith(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                  if (dashboard.description.isNotEmpty)
                    Text(
                      dashboard.description,
                      style: AppTextStyles.textXS.copyWith(
                        color: AppColors.textTertiary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            if (dashboard.isDefault)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spacingSM,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.utilityBlue50,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSM),
                ),
                child: Text(
                  'Default',
                  style: AppTextStyles.textXS.copyWith(
                    color: AppColors.utilityBlue700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    String? dashboardId;

    // Create new dashboard if needed
    if (_addToDashboard && _createNewDashboard) {
      final dashboardName = _newDashboardNameController.text.trim();
      if (dashboardName.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a dashboard name')),
        );
        return;
      }

      final dashboard = await widget.state.createDashboard(name: dashboardName);
      if (dashboard == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to create dashboard: ${widget.state.error.value}'),
              backgroundColor: AppColors.utilityError500,
            ),
          );
        }
        return;
      }
      dashboardId = dashboard.id;
    } else if (_addToDashboard && _selectedDashboardId != null) {
      dashboardId = _selectedDashboardId;
    }

    // Save the query
    final savedQuery = await widget.state.saveCurrentQuery(
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      dashboardId: dashboardId,
    );

    if (!mounted) return;

    if (savedQuery != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: AppColors.white, size: 18),
              const SizedBox(width: AppSizes.spacingSM),
              Text(dashboardId != null
                  ? 'Query saved and added to dashboard'
                  : 'Query saved successfully'),
            ],
          ),
          backgroundColor: AppColors.utilityGreen500,
        ),
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save: ${widget.state.error.value}'),
          backgroundColor: AppColors.utilityError500,
        ),
      );
    }
  }
}
