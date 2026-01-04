import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../data/locations_models.dart';
import '../state/locations_state.dart';

/// Settings: Locations management screen.
///
/// Displays a list of company locations with CRUD operations.
class SettingsLocationsScreen extends StatefulWidget {
  const SettingsLocationsScreen({super.key});

  @override
  State<SettingsLocationsScreen> createState() =>
      _SettingsLocationsScreenState();
}

class _SettingsLocationsScreenState extends State<SettingsLocationsScreen> {
  late final LocationsState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<LocationsState>();
    _state.fetchLocations();
  }

  void _onAddLocation() {
    _showLocationDialog(null);
  }

  void _onEditLocation(Location location) {
    _showLocationDialog(location);
  }

  Future<void> _onDeleteLocation(Location location) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Location'),
        content: Text('Are you sure you want to delete "${location.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: SemanticColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    final result = await _state.deleteLocation(location.id);
    if (!mounted) return;

    result.when(
      ok: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${location.name} deleted')),
        );
      },
      error: (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete: ${e.message}'),
            backgroundColor: SemanticColors.error,
          ),
        );
      },
    );
  }

  void _showLocationDialog(Location? location) {
    final isEditing = location != null;
    final nameController = TextEditingController(text: location?.name ?? '');
    final addressController =
        TextEditingController(text: location?.address ?? '');
    final cityController = TextEditingController(text: location?.city ?? '');
    final stateController = TextEditingController(text: location?.state ?? '');
    final zipController = TextEditingController(text: location?.zipCode ?? '');
    final countryController =
        TextEditingController(text: location?.country ?? 'USA');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? 'Edit Location' : 'Add Location'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name *',
                  hintText: 'e.g., Main Office',
                ),
                autofocus: true,
              ),
              const SizedBox(height: SemanticSpacing.formGap),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  hintText: '123 Main St',
                ),
              ),
              const SizedBox(height: SemanticSpacing.formGap),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: cityController,
                      decoration: const InputDecoration(labelText: 'City'),
                    ),
                  ),
                  const SizedBox(width: SemanticSpacing.normal),
                  Expanded(
                    child: TextField(
                      controller: stateController,
                      decoration: const InputDecoration(labelText: 'State'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SemanticSpacing.formGap),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: zipController,
                      decoration: const InputDecoration(labelText: 'ZIP Code'),
                    ),
                  ),
                  const SizedBox(width: SemanticSpacing.normal),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: countryController,
                      decoration: const InputDecoration(labelText: 'Country'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = nameController.text.trim();
              if (name.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Name is required')),
                );
                return;
              }

              Navigator.pop(context);

              if (isEditing) {
                final updated = location.copyWith(
                  name: name,
                  address: addressController.text.trim(),
                  city: cityController.text.trim(),
                  state: stateController.text.trim(),
                  zipCode: zipController.text.trim(),
                  country: countryController.text.trim(),
                );
                await _state.updateLocation(updated);
              } else {
                await _state.createLocation(
                  name: name,
                  address: addressController.text.trim(),
                  city: cityController.text.trim(),
                  state: stateController.text.trim(),
                  zipCode: zipController.text.trim(),
                  country: countryController.text.trim(),
                );
              }
            },
            child: Text(isEditing ? 'Save' : 'Create'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Manage Locations',
            subtitle: 'Add and manage company locations.',
            actions: [
              AppButton(
                label: 'Add Location',
                onPressed: _onAddLocation,
                isFullWidth: false,
                icon: const Icon(Icons.add, size: 18, color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: Watch((context) {
              if (_state.isLoading.value && _state.locations.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_state.error.value != null &&
                  _state.locations.value.isEmpty) {
                return _buildErrorView();
              }

              if (_state.locations.value.isEmpty) {
                return _buildEmptyState();
              }

              return _buildLocationsList();
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: SemanticColors.error),
          const SizedBox(height: SemanticSpacing.normal),
          Text('Failed to load locations', style: Semantic.cardTitle),
          const SizedBox(height: SemanticSpacing.tight),
          Text(
            _state.error.value?.message ?? 'Unknown error',
            style: Semantic.bodySecondary,
          ),
          const SizedBox(height: SemanticSpacing.section),
          AppButton(
            label: 'Retry',
            onPressed: () => _state.fetchLocations(),
            isFullWidth: false,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_off, size: 64, color: AppColors.textTertiary),
          const SizedBox(height: SemanticSpacing.section),
          Text('No locations', style: Semantic.cardTitle),
          const SizedBox(height: SemanticSpacing.tight),
          Text(
            'Add your first location to get started.',
            style: Semantic.bodySecondary,
          ),
          const SizedBox(height: SemanticSpacing.section),
          AppButton(
            label: 'Add Location',
            onPressed: _onAddLocation,
            isFullWidth: false,
            icon: const Icon(Icons.add, size: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationsList() {
    return Watch((context) {
      final locations = _state.locations.value;

      return ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return _buildLocationCard(location);
        },
      );
    });
  }

  Widget _buildLocationCard(Location location) {
    return Container(
      margin: const EdgeInsets.only(bottom: SemanticSpacing.relaxed),
      decoration: BoxDecoration(
        color: SemanticColors.bgCard,
        border: Border.all(color: SemanticColors.border),
        borderRadius: BorderRadius.circular(SemanticRadius.card),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: SemanticSpacing.cardPadding,
          vertical: SemanticSpacing.normal,
        ),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: SemanticColors.bgSecondary,
            borderRadius: BorderRadius.circular(SemanticRadius.normal),
          ),
          child: const Icon(Icons.location_on, color: AppColors.textSecondary),
        ),
        title: Text(location.name, style: Semantic.formLabel),
        subtitle: location.hasAddress
            ? Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  location.formattedAddress,
                  style: Semantic.caption,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => _onEditLocation(location),
              icon: const Icon(Icons.edit_outlined),
              tooltip: 'Edit',
            ),
            IconButton(
              onPressed: () => _onDeleteLocation(location),
              icon: const Icon(Icons.delete_outline),
              color: SemanticColors.error,
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }
}
