import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../data/assets_client.dart';
import '../data/assets_models.dart';

export '../data/assets_models.dart' show Asset, AssetStatus, PaginatedAssets;

/// Assets state management using signals
@lazySingleton
class AssetsState {
  final AssetsClient _client;

  AssetsState(this._client);

  // Core state
  final assets = signal<List<Asset>>([]);
  final isLoading = signal(false);
  final error = signal<AppError?>(null);

  // Pagination
  final total = signal(0);
  final limit = signal(25);
  final offset = signal(0);

  // Sorting
  final sortBy = signal<String?>(null);
  final sortDesc = signal(false);
  final sortColumnIndex = signal<int?>(null);

  // Filters
  final statusFilter = signal<List<String>>([]);
  final searchQuery = signal('');
  final locationFilter = signal<String?>(null);
  final divisionFilter = signal<String?>(null);

  // Selected asset for detail view
  final selectedAsset = signal<Asset?>(null);

  // Computed values
  late final assetCount = computed(() => assets.value.length);
  late final totalCount = computed(() => total.value);
  late final currentPage = computed(() => (offset.value / limit.value).floor() + 1);
  late final totalPages = computed(() => (total.value / limit.value).ceil());
  late final hasNextPage = computed(() => currentPage.value < totalPages.value);
  late final hasPreviousPage = computed(() => currentPage.value > 1);

  late final activeAssets = computed(
    () => assets.value.where((a) => a.status == AssetStatus.active).toList(),
  );

  late final hasFilters = computed(
    () =>
        statusFilter.value.isNotEmpty ||
        searchQuery.value.isNotEmpty ||
        locationFilter.value != null ||
        divisionFilter.value != null,
  );

  late final hasAssetTypes = computed(
    () => assets.value.any((a) => a.divisionOfConstruction != null),
  );

  /// Fetch assets with current filters
  Future<void> fetchAssets({bool refresh = false}) async {
    if (isLoading.value && !refresh) return;

    if (refresh) {
      offset.value = 0;
    }

    isLoading.value = true;
    error.value = null;

    final result = await _client
        .listAssets(
          limit: limit.value,
          offset: offset.value,
          statuses: statusFilter.value.isEmpty ? null : statusFilter.value,
          search: searchQuery.value.isEmpty ? null : searchQuery.value,
          locationId: locationFilter.value,
          divisionCode: divisionFilter.value,
          sortBy: sortBy.value,
          sortDesc: sortDesc.value,
        )
        .toResult();

    result.when(
      ok: (paginated) {
        batch(() {
          assets.value = paginated.items;
          total.value = paginated.total;
        });
      },
      error: (e) {
        error.value = e;
      },
    );

    isLoading.value = false;
  }

  /// Change page
  Future<void> changePage(int page) async {
    if (page < 1 || page > totalPages.value) return;
    offset.value = (page - 1) * limit.value;
    await fetchAssets();
  }

  /// Sort on a field
  Future<void> sortOnField({
    required String fieldName,
    required int columnIndex,
    required bool ascending,
  }) async {
    batch(() {
      sortBy.value = fieldName;
      sortDesc.value = !ascending;
      sortColumnIndex.value = columnIndex;
      offset.value = 0;
    });
    await fetchAssets();
  }

  /// Apply search
  Future<void> applySearch(String search) async {
    batch(() {
      searchQuery.value = search;
      offset.value = 0;
    });
    await fetchAssets();
  }

  /// Apply filters and refresh
  void applyFilters({
    List<String>? statuses,
    String? search,
    String? locationId,
    String? division,
  }) {
    batch(() {
      if (statuses != null) statusFilter.value = statuses;
      if (search != null) searchQuery.value = search;
      if (locationId != null) locationFilter.value = locationId;
      if (division != null) divisionFilter.value = division;
      offset.value = 0;
    });
    fetchAssets();
  }

  /// Clear all filters
  void clearFilters() {
    batch(() {
      statusFilter.value = [];
      searchQuery.value = '';
      locationFilter.value = null;
      divisionFilter.value = null;
      offset.value = 0;
    });
    fetchAssets();
  }

  /// Get a single asset by ID
  Future<void> fetchAsset(String id) async {
    isLoading.value = true;
    error.value = null;

    final result = await _client.getAsset(id).toResult();

    result.when(
      ok: (asset) {
        selectedAsset.value = asset;
      },
      error: (e) {
        error.value = e;
      },
    );

    isLoading.value = false;
  }

  /// Create a new asset
  Future<Result<Asset>> createAsset({
    required String name,
    required String locationId,
    String? technicalName,
    String? notes,
    String? divisionOfConstruction,
    String? manufacturer,
    String? serialNumber,
    String? modelNumber,
    double? priceValue,
    DateTime? purchaseDate,
    DateTime? warrantyStartDate,
    int? warrantyDurationMonths,
  }) async {
    isLoading.value = true;

    final result = await _client
        .createAsset(
          name: name,
          locationId: locationId,
          technicalName: technicalName,
          notes: notes,
          divisionOfConstruction: divisionOfConstruction,
          manufacturer: manufacturer,
          serialNumber: serialNumber,
          modelNumber: modelNumber,
          priceValue: priceValue,
          purchaseDate: purchaseDate,
          warrantyStartDate: warrantyStartDate,
          warrantyDurationMonths: warrantyDurationMonths,
        )
        .toResult();

    result.when(
      ok: (asset) {
        // Refresh list to show new asset
        fetchAssets(refresh: true);
      },
      error: (e) {
        error.value = e;
      },
    );

    isLoading.value = false;
    return result;
  }

  /// Update an existing asset (optimistic update)
  Future<Result<Asset>> updateAsset(Asset updated) async {
    final previousAssets = assets.value;

    // Optimistic update
    assets.value =
        assets.value.map((a) => a.id == updated.id ? updated : a).toList();

    if (selectedAsset.value?.id == updated.id) {
      selectedAsset.value = updated;
    }

    final result = await _client.updateAsset(updated).toResult();

    result.when(
      ok: (asset) {
        // Update with server response
        assets.value =
            assets.value.map((a) => a.id == asset.id ? asset : a).toList();
        if (selectedAsset.value?.id == asset.id) {
          selectedAsset.value = asset;
        }
      },
      error: (e) {
        // Rollback on error
        assets.value = previousAssets;
        error.value = e;
      },
    );

    return result;
  }

  /// Delete an asset (optimistic update)
  Future<Result<void>> deleteAsset(String id) async {
    final previousAssets = assets.value;

    // Optimistic remove
    assets.value = assets.value.where((a) => a.id != id).toList();

    final result = await _client.deleteAsset(id).toResult();

    result.when(
      ok: (_) {
        if (selectedAsset.value?.id == id) {
          selectedAsset.value = null;
        }
        total.value = total.value - 1;
      },
      error: (e) {
        // Rollback on error
        assets.value = previousAssets;
        error.value = e;
      },
    );

    return result;
  }
}
