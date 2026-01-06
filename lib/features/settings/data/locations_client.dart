import 'package:injectable/injectable.dart';

import '../../../core/transport/organization_service_client.dart';
import '../../../gen/moat/v1/organization.pb.dart' as org;
import 'locations_models.dart';

/// Client for location-related API calls.
///
/// Uses OrganizationServiceClient for real backend API calls.
@lazySingleton
class LocationsClient {
  final OrganizationServiceClient _orgClient;

  LocationsClient(this._orgClient);

  /// List all locations for the company.
  Future<List<Location>> listLocations() async {
    final response = await _orgClient.listLocations(org.ListLocationsRequest());
    return response.locations.map(_locationFromProto).toList();
  }

  /// Get a single location by ID.
  Future<Location> getLocation(String id) async {
    final response = await _orgClient.getLocation(
      org.GetLocationRequest(locationId: id),
    );
    return _locationFromProto(response);
  }

  /// Create a new location.
  Future<Location> createLocation({
    required String name,
    String? description,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) async {
    final response = await _orgClient.createLocation(org.CreateLocationRequest(
      name: name,
      description: description ?? '',
      address: address ?? '',
      city: city ?? '',
      state: state ?? '',
      zipCode: zipCode ?? '',
      country: country ?? '',
    ));
    return _locationFromProto(response);
  }

  /// Update an existing location.
  Future<Location> updateLocation(Location location) async {
    final response = await _orgClient.updateLocation(org.UpdateLocationRequest(
      locationId: location.id,
      name: location.name,
      description: location.description,
      address: location.address,
      city: location.city,
      state: location.state,
      zipCode: location.zipCode,
      country: location.country,
    ));
    return _locationFromProto(response);
  }

  /// Delete a location.
  Future<void> deleteLocation(String id) async {
    await _orgClient.deleteLocation(org.DeleteLocationRequest(locationId: id));
  }

  /// Convert protobuf Location to local Location model.
  Location _locationFromProto(org.Location proto) {
    return Location(
      id: proto.id,
      name: proto.name,
      description: proto.description.isEmpty ? null : proto.description,
      address: proto.address.isEmpty ? null : proto.address,
      city: proto.city.isEmpty ? null : proto.city,
      state: proto.state.isEmpty ? null : proto.state,
      zipCode: proto.zipCode.isEmpty ? null : proto.zipCode,
      country: proto.country.isEmpty ? null : proto.country,
      createdAt: proto.hasCreatedAt() ? proto.createdAt.toDateTime() : null,
      updatedAt: proto.hasUpdatedAt() ? proto.updatedAt.toDateTime() : null,
    );
  }
}
