import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common_widgets/drawer_shell.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../state/assets_state.dart';

/// Edit Asset Drawer - slides from right side to edit asset fields.
class EditAssetDrawer extends StatefulWidget {
  final Asset asset;
  final VoidCallback onClose;
  final VoidCallback? onSaved;

  const EditAssetDrawer({
    required this.asset,
    required this.onClose,
    this.onSaved,
    super.key,
  });

  @override
  State<EditAssetDrawer> createState() => _EditAssetDrawerState();
}

class _EditAssetDrawerState extends State<EditAssetDrawer> {
  final _assetsState = getIt<AssetsState>();
  late Asset _editedAsset;
  bool _isLoading = false;
  String? _error;

  // Track which field is being edited
  String? _editingField;

  // Controllers for text fields
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _manufacturerController = TextEditingController();
  final _modelController = TextEditingController();
  final _serialController = TextEditingController();
  final _floorLocationController = TextEditingController();
  final _serviceAreaController = TextEditingController();
  final _internalIdController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _editedAsset = widget.asset;
    _initControllers();
  }

  void _initControllers() {
    _nameController.text = _editedAsset.name;
    _priceController.text =
        _editedAsset.priceValue?.toStringAsFixed(2) ?? '';
    _manufacturerController.text = _editedAsset.manufacturer ?? '';
    _modelController.text = _editedAsset.modelNumber ?? '';
    _serialController.text = _editedAsset.serialNumber ?? '';
    _floorLocationController.text = _editedAsset.floorLocation ?? '';
    _serviceAreaController.text = _editedAsset.serviceArea ?? '';
    _internalIdController.text = _editedAsset.internalId ?? '';
    _notesController.text = _editedAsset.notes ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _manufacturerController.dispose();
    _modelController.dispose();
    _serialController.dispose();
    _floorLocationController.dispose();
    _serviceAreaController.dispose();
    _internalIdController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _saveField(String fieldName, dynamic value) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    // Create updated asset based on field
    Asset updated;
    switch (fieldName) {
      case 'name':
        updated = _editedAsset.copyWith(name: value as String);
        break;
      case 'priceValue':
        updated = _editedAsset.copyWith(priceValue: value as double?);
        break;
      case 'manufacturer':
        updated = _editedAsset.copyWith(manufacturer: value as String?);
        break;
      case 'modelNumber':
        updated = _editedAsset.copyWith(modelNumber: value as String?);
        break;
      case 'serialNumber':
        updated = _editedAsset.copyWith(serialNumber: value as String?);
        break;
      case 'floorLocation':
        updated = _editedAsset.copyWith(floorLocation: value as String?);
        break;
      case 'serviceArea':
        updated = _editedAsset.copyWith(serviceArea: value as String?);
        break;
      case 'internalId':
        updated = _editedAsset.copyWith(internalId: value as String?);
        break;
      case 'notes':
        updated = _editedAsset.copyWith(notes: value as String?);
        break;
      case 'purchaseDate':
        updated = _editedAsset.copyWith(purchaseDate: value as DateTime?);
        break;
      case 'warrantyStartDate':
        updated = _editedAsset.copyWith(warrantyStartDate: value as DateTime?);
        break;
      case 'substantialCompletionDate':
        updated =
            _editedAsset.copyWith(substantialCompletionDate: value as DateTime?);
        break;
      case 'status':
        updated = _editedAsset.copyWith(status: value as String);
        break;
      default:
        updated = _editedAsset;
    }

    final result = await _assetsState.updateAsset(updated);

    result.when(
      ok: (asset) {
        setState(() {
          _editedAsset = asset;
          _editingField = null;
          _isLoading = false;
        });
        _initControllers();
        widget.onSaved?.call();
      },
      error: (e) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: _editingField != null
          ? _buildEditForm(_editingField!)
          : _buildFieldList(),
    );
  }

  Widget _buildFieldList() {
    return DrawerShell(
      key: const ValueKey('list'),
      title: 'Edit Asset',
      onClose: widget.onClose,
      width: 500,
      scrollableBody: true,
      bodyPadding: EdgeInsets.all(AppSizes.spacing2XL),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Error banner
          if (_error != null) ...[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppSizes.spacingLG),
              decoration: BoxDecoration(
                color: AppColors.utilityError500.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: AppColors.utilityError500, size: 18),
                  SizedBox(width: AppSizes.spacingMD),
                  Expanded(
                    child: Text(
                      _error!,
                      style: AppTextStyles.textSM.copyWith(color: AppColors.utilityError500),
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() => _error = null),
                    icon: const Icon(Icons.close, size: 16),
                    iconSize: 16,
                    color: AppColors.utilityError500,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.spacingXL),
          ],
          // Details Section
          _buildSectionHeader('Details'),
          SizedBox(height: AppSizes.spacingLG),
          _buildFieldRow(
            label: 'Asset Name',
            value: _editedAsset.name,
            fieldName: 'name',
            isRequired: true,
          ),
          _buildFieldRow(
            label: 'Asset Value',
            value: _editedAsset.priceValue != null
                ? '\$${_editedAsset.priceValue!.toStringAsFixed(2)}'
                : null,
            fieldName: 'priceValue',
          ),
          _buildFieldRow(
            label: 'Manufacturer',
            value: _editedAsset.manufacturer,
            fieldName: 'manufacturer',
          ),
          _buildFieldRow(
            label: 'Model #',
            value: _editedAsset.modelNumber,
            fieldName: 'modelNumber',
          ),
          _buildFieldRow(
            label: 'Serial #',
            value: _editedAsset.serialNumber,
            fieldName: 'serialNumber',
          ),

          SizedBox(height: AppSizes.spacing3XL),

          // Location Section
          _buildSectionHeader('Location'),
          SizedBox(height: AppSizes.spacingLG),
          _buildFieldRow(
            label: 'Site Location',
            value: _editedAsset.locationName,
            fieldName: 'locationId',
            isEditable: false, // Location requires dropdown
          ),
          _buildFieldRow(
            label: 'Floor Location',
            value: _editedAsset.floorLocation,
            fieldName: 'floorLocation',
          ),
          _buildFieldRow(
            label: 'Service Area',
            value: _editedAsset.serviceArea,
            fieldName: 'serviceArea',
          ),

          SizedBox(height: AppSizes.spacing3XL),

          // Dates Section
          _buildSectionHeader('Dates'),
          SizedBox(height: AppSizes.spacingLG),
          _buildDateFieldRow(
            label: 'Purchase Date',
            value: _editedAsset.purchaseDate,
            fieldName: 'purchaseDate',
          ),
          _buildDateFieldRow(
            label: 'Warranty Start',
            value: _editedAsset.warrantyStartDate,
            fieldName: 'warrantyStartDate',
          ),
          _buildDateFieldRow(
            label: 'Substantial Completion',
            value: _editedAsset.substantialCompletionDate,
            fieldName: 'substantialCompletionDate',
          ),

          SizedBox(height: AppSizes.spacing3XL),

          // Internal ID Section
          _buildSectionHeader('Internal ID'),
          SizedBox(height: AppSizes.spacingLG),
          _buildFieldRow(
            label: 'Internal ID',
            value: _editedAsset.internalId,
            fieldName: 'internalId',
          ),

          SizedBox(height: AppSizes.spacing3XL),

          // Notes Section
          _buildSectionHeader('Notes'),
          SizedBox(height: AppSizes.spacingLG),
          _buildFieldRow(
            label: 'Notes',
            value: _editedAsset.notes,
            fieldName: 'notes',
            isMultiline: true,
          ),

          SizedBox(height: AppSizes.spacing3XL),

          // Status Section
          _buildSectionHeader('Status'),
          SizedBox(height: AppSizes.spacingLG),
          _buildStatusSelector(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTextStyles.textMDMedium.copyWith(
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildFieldRow({
    required String label,
    required String? value,
    required String fieldName,
    bool isRequired = false,
    bool isEditable = true,
    bool isMultiline = false,
  }) {
    return InkWell(
      onTap: isEditable
          ? () => setState(() => _editingField = fieldName)
          : null,
      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.spacingLG,
          horizontal: AppSizes.spacingXS,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.borderPrimary),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Text(label, style: AppTextStyles.textSMSecondary),
                  if (isRequired)
                    Text(
                      ' *',
                      style:
                          AppTextStyles.textSM.copyWith(color: AppColors.utilityError500),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      value?.isEmpty ?? true ? 'Add' : value!,
                      style: value?.isNotEmpty ?? false
                          ? AppTextStyles.textSM
                          : AppTextStyles.textSM
                              .copyWith(color: AppColors.primary),
                      maxLines: isMultiline ? 2 : 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  if (isEditable) ...[
                    SizedBox(width: AppSizes.spacingMD),
                    Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: AppColors.textTertiary,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateFieldRow({
    required String label,
    required DateTime? value,
    required String fieldName,
  }) {
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: value ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          await _saveField(fieldName, picked);
        }
      },
      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.spacingLG,
          horizontal: AppSizes.spacingXS,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.borderPrimary),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(label, style: AppTextStyles.textSMSecondary),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    value != null
                        ? DateFormatter.formatFriendlyDate(dateTime: value)
                        : 'Select',
                    style: value != null
                        ? AppTextStyles.textSM
                        : AppTextStyles.textSM
                            .copyWith(color: AppColors.primary),
                  ),
                  SizedBox(width: AppSizes.spacingMD),
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: AppColors.textTertiary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusSelector() {
    return Wrap(
      spacing: AppSizes.spacingMD,
      runSpacing: AppSizes.spacingMD,
      children: AssetStatus.all.map((status) {
        final isSelected = _editedAsset.status == status;
        return ChoiceChip(
          label: Text(AssetStatus.displayName(status)),
          selected: isSelected,
          onSelected: (selected) {
            if (selected && !_isLoading) {
              _saveField('status', status);
            }
          },
          selectedColor: AppColors.primary.withValues(alpha: 0.2),
          labelStyle: AppTextStyles.textSM.copyWith(
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEditForm(String fieldName) {
    String label;
    TextEditingController controller;
    String? Function(String?)? validator;
    TextInputType keyboardType = TextInputType.text;
    List<TextInputFormatter>? inputFormatters;
    int maxLines = 1;

    switch (fieldName) {
      case 'name':
        label = 'Asset Name';
        controller = _nameController;
        validator = (v) {
          if (v == null || v.isEmpty) return 'Name is required';
          if (v.length < 3) return 'Name must be at least 3 characters';
          return null;
        };
        break;
      case 'priceValue':
        label = 'Asset Value';
        controller = _priceController;
        keyboardType = const TextInputType.numberWithOptions(decimal: true);
        inputFormatters = [
          FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
        ];
        break;
      case 'manufacturer':
        label = 'Manufacturer';
        controller = _manufacturerController;
        break;
      case 'modelNumber':
        label = 'Model #';
        controller = _modelController;
        break;
      case 'serialNumber':
        label = 'Serial #';
        controller = _serialController;
        break;
      case 'floorLocation':
        label = 'Floor Location';
        controller = _floorLocationController;
        break;
      case 'serviceArea':
        label = 'Service Area';
        controller = _serviceAreaController;
        break;
      case 'internalId':
        label = 'Internal ID';
        controller = _internalIdController;
        break;
      case 'notes':
        label = 'Notes';
        controller = _notesController;
        maxLines = 3;
        break;
      default:
        return const SizedBox.shrink();
    }

    return DrawerShell(
      key: ValueKey('edit_$fieldName'),
      title: label,
      width: 500,
      onClose: () => setState(() => _editingField = null),
      scrollableBody: false,
      bodyPadding: EdgeInsets.all(AppSizes.spacing2XL),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Error banner
          if (_error != null) ...[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppSizes.spacingLG),
              decoration: BoxDecoration(
                color: AppColors.utilityError500.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
              ),
              child: Text(
                _error!,
                style: AppTextStyles.textSM.copyWith(color: AppColors.utilityError500),
              ),
            ),
            SizedBox(height: AppSizes.spacingXL),
          ],
          TextFormField(
            controller: controller,
            autofocus: true,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            maxLines: maxLines,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: AppTextStyles.textSMSecondary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                borderSide: BorderSide(color: AppColors.borderPrimary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                borderSide: BorderSide(color: AppColors.primary),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppSizes.spacingXL,
                vertical: AppSizes.spacingLG + 2,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
      footer: DrawerShellActions(
        cancelText: 'Cancel',
        submitText: 'Save',
        isSubmitting: _isLoading,
        onCancel: () {
          _initControllers();
          setState(() => _editingField = null);
        },
        onSubmit: () {
          // Validate if needed
          if (validator != null) {
            final error = validator(controller.text);
            if (error != null) {
              setState(() => _error = error);
              return;
            }
          }
          // Parse value based on field type
          dynamic value;
          if (fieldName == 'priceValue') {
            value = controller.text.isEmpty
                ? null
                : double.tryParse(controller.text);
          } else {
            value = controller.text.isEmpty ? null : controller.text;
          }
          _saveField(fieldName, value);
        },
      ),
    );
  }
}
