import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../settings/state/locations_state.dart';
import '../data/assets_models.dart';

/// Dialog for creating or editing an asset.
class AssetDialog extends StatefulWidget {
  final Asset? asset;
  final LocationsState locationsState;

  const AssetDialog({
    this.asset,
    required this.locationsState,
    super.key,
  });

  @override
  State<AssetDialog> createState() => _AssetDialogState();
}

class _AssetDialogState extends State<AssetDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _descController;
  late final TextEditingController _manufacturerController;
  late final TextEditingController _modelController;
  late final TextEditingController _serialController;

  String? _selectedLocationId;
  String? _selectedLocationName;
  String _selectedStatus = AssetStatus.active;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final asset = widget.asset;

    _nameController = TextEditingController(text: asset?.name ?? '');
    _descController = TextEditingController(text: asset?.notes ?? '');
    _manufacturerController =
        TextEditingController(text: asset?.manufacturer ?? '');
    _modelController = TextEditingController(text: asset?.modelNumber ?? '');
    _serialController = TextEditingController(text: asset?.serialNumber ?? '');

    _selectedLocationId = asset?.locationId;
    _selectedLocationName = asset?.locationName;
    _selectedStatus = asset?.status ?? AssetStatus.active;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _manufacturerController.dispose();
    _modelController.dispose();
    _serialController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final result = Asset(
      id: widget.asset?.id ?? '',
      companyId: widget.asset?.companyId ?? 'company-001',
      name: _nameController.text.trim(),
      status: _selectedStatus,
      notes: _descController.text.trim().isEmpty
          ? null
          : _descController.text.trim(),
      locationId: _selectedLocationId,
      locationName: _selectedLocationName,
      manufacturer: _manufacturerController.text.trim().isEmpty
          ? null
          : _manufacturerController.text.trim(),
      modelNumber:
          _modelController.text.trim().isEmpty ? null : _modelController.text.trim(),
      serialNumber: _serialController.text.trim().isEmpty
          ? null
          : _serialController.text.trim(),
      createdAt: widget.asset?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.asset != null;

    return AlertDialog(
      title: Text(isEditing ? 'Edit Asset' : 'Create Asset'),
      content: SizedBox(
        width: 450,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Asset Name *',
                    hintText: 'e.g., HVAC Unit - Main Building',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Description
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Optional description',
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),

                // Location dropdown
                Watch((context) {
                  final locations = widget.locationsState.locations.value;
                  final isLoading = widget.locationsState.isLoading.value;

                  return DropdownButtonFormField<String>(
                    value: _selectedLocationId,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      suffixIcon: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              ),
                            )
                          : null,
                    ),
                    items: [
                      const DropdownMenuItem(
                        value: null,
                        child: Text('No location'),
                      ),
                      ...locations.map(
                        (loc) => DropdownMenuItem(
                          value: loc.id,
                          child: Text(loc.name),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedLocationId = value;
                        _selectedLocationName = value != null
                            ? locations.firstWhere((l) => l.id == value).name
                            : null;
                      });
                    },
                  );
                }),
                const SizedBox(height: 16),

                // Status dropdown
                DropdownButtonFormField<String>(
                  value: _selectedStatus,
                  decoration: const InputDecoration(
                    labelText: 'Status',
                  ),
                  items: AssetStatus.all
                      .map((status) => DropdownMenuItem(
                            value: status,
                            child: Text(AssetStatus.displayName(status)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _selectedStatus = value);
                    }
                  },
                ),
                const SizedBox(height: 24),

                // Equipment details section
                Text(
                  'Equipment Details',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 12),

                // Manufacturer
                TextFormField(
                  controller: _manufacturerController,
                  decoration: const InputDecoration(
                    labelText: 'Manufacturer',
                    hintText: 'e.g., Carrier, Trane',
                  ),
                ),
                const SizedBox(height: 16),

                // Model
                TextFormField(
                  controller: _modelController,
                  decoration: const InputDecoration(
                    labelText: 'Model',
                    hintText: 'e.g., XR15',
                  ),
                ),
                const SizedBox(height: 16),

                // Serial Number
                TextFormField(
                  controller: _serialController,
                  decoration: const InputDecoration(
                    labelText: 'Serial Number',
                    hintText: 'e.g., SN-12345',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text(isEditing ? 'Save' : 'Create'),
        ),
      ],
    );
  }
}
