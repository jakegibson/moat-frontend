import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../data/locations_client.dart';
import '../data/locations_models.dart';

/// State management for locations list and operations.
///
/// Uses Signals for reactive state updates.
@lazySingleton
class LocationsState {
  final LocationsClient _client;

  LocationsState(this._client);

  // ==========================================================================
  // Core State
  // ==========================================================================

  final locations = signal<List<Location>>([]);
  final isLoading = signal(false);
  final error = signal<AppError?>(null);
  final selectedLocation = signal<Location?>(null);

  // ==========================================================================
  // Computed Values
  // ==========================================================================

  late final locationCount = computed(() => locations.value.length);

  // ==========================================================================
  // Operations
  // ==========================================================================

  /// Fetch all locations.
  Future<void> fetchLocations() async {
    isLoading.value = true;
    error.value = null;

    final result = await _client.listLocations().toResult();

    result.when(
      ok: (data) => locations.value = data,
      error: (e) => error.value = e,
    );

    isLoading.value = false;
  }

  /// Select a location for viewing/editing.
  void selectLocation(Location? location) {
    selectedLocation.value = location;
  }

  /// Create a new location.
  Future<Result<Location>> createLocation({
    required String name,
    String? description,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) async {
    final result = await _client
        .createLocation(
          name: name,
          description: description,
          address: address,
          city: city,
          state: state,
          zipCode: zipCode,
          country: country,
        )
        .toResult();

    result.when(
      ok: (location) {
        locations.value = [location, ...locations.value];
      },
      error: (e) => error.value = e,
    );

    return result;
  }

  /// Update an existing location.
  Future<Result<Location>> updateLocation(Location location) async {
    // Optimistic update
    final previousLocations = locations.value;
    locations.value =
        locations.value.map((l) => l.id == location.id ? location : l).toList();

    final result = await _client.updateLocation(location).toResult();

    result.when(
      ok: (updated) {
        locations.value =
            locations.value.map((l) => l.id == updated.id ? updated : l).toList();
        if (selectedLocation.value?.id == updated.id) {
          selectedLocation.value = updated;
        }
      },
      error: (e) {
        // Rollback on error
        locations.value = previousLocations;
        error.value = e;
      },
    );

    return result;
  }

  /// Delete a location.
  Future<Result<void>> deleteLocation(String locationId) async {
    // Optimistic update
    final previousLocations = locations.value;
    locations.value = locations.value.where((l) => l.id != locationId).toList();

    final result = await _client.deleteLocation(locationId).toResult();

    result.when(
      ok: (_) {
        if (selectedLocation.value?.id == locationId) {
          selectedLocation.value = null;
        }
      },
      error: (e) {
        // Rollback on error
        locations.value = previousLocations;
        error.value = e;
      },
    );

    return result;
  }
}
