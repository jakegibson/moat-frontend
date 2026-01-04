import 'package:injectable/injectable.dart';
import 'locations_models.dart';

/// Client for location-related API calls.
///
/// Currently returns mock data until proto clients are generated.
@lazySingleton
class LocationsClient {
  LocationsClient();

  // Internal mock data - remove when using real API
  static final _mockLocations = <Location>[
    Location(
      id: 'loc-001',
      name: 'Main Building',
      address: '123 Main St',
      city: 'San Francisco',
      state: 'CA',
      zipCode: '94102',
      country: 'USA',
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      updatedAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    Location(
      id: 'loc-002',
      name: 'Warehouse',
      address: '456 Industrial Blvd',
      city: 'Oakland',
      state: 'CA',
      zipCode: '94607',
      country: 'USA',
      createdAt: DateTime.now().subtract(const Duration(days: 200)),
      updatedAt: DateTime.now().subtract(const Duration(days: 14)),
    ),
    Location(
      id: 'loc-003',
      name: 'Parking Lot',
      address: '789 Parking Way',
      city: 'San Francisco',
      state: 'CA',
      zipCode: '94103',
      country: 'USA',
      createdAt: DateTime.now().subtract(const Duration(days: 100)),
      updatedAt: DateTime.now().subtract(const Duration(days: 7)),
    ),
    Location(
      id: 'loc-004',
      name: 'Remote Office',
      address: '321 Tech Park',
      city: 'Austin',
      state: 'TX',
      zipCode: '78701',
      country: 'USA',
      createdAt: DateTime.now().subtract(const Duration(days: 50)),
      updatedAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  /// List all locations for the company.
  Future<List<Location>> listLocations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_mockLocations);
  }

  /// Get a single location by ID.
  Future<Location> getLocation(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final location = _mockLocations.where((l) => l.id == id).firstOrNull;
    if (location == null) {
      throw Exception('Location not found: $id');
    }
    return location;
  }

  /// Create a new location.
  Future<Location> createLocation({
    required String name,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final newLocation = Location(
      id: 'loc-${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      address: address,
      city: city,
      state: state,
      zipCode: zipCode,
      country: country,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    _mockLocations.insert(0, newLocation);
    return newLocation;
  }

  /// Update an existing location.
  Future<Location> updateLocation(Location location) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final index = _mockLocations.indexWhere((l) => l.id == location.id);
    if (index == -1) {
      throw Exception('Location not found: ${location.id}');
    }

    final updated = location.copyWith(updatedAt: DateTime.now());
    _mockLocations[index] = updated;
    return updated;
  }

  /// Delete a location.
  Future<void> deleteLocation(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final index = _mockLocations.indexWhere((l) => l.id == id);
    if (index == -1) {
      throw Exception('Location not found: $id');
    }

    _mockLocations.removeAt(index);
  }
}
