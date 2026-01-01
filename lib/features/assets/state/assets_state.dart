import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../data/assets_client.dart';

// TODO: Import generated proto types
// import '../../../gen/proto/moat/v1/assets.pb.dart';

/// Placeholder Asset type until protos are generated
class Asset {
  final String id;
  final String companyId;
  final String name;
  final String status;
  final String? locationId;
  final String? locationName;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Asset({
    required this.id,
    required this.companyId,
    required this.name,
    required this.status,
    this.locationId,
    this.locationName,
    required this.createdAt,
    required this.updatedAt,
  });
}

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
  final currentPage = signal(1);
  final hasMore = signal(true);
  static const _pageSize = 20;

  // Filters
  final statusFilter = signal<List<String>>([]);
  final searchQuery = signal('');

  // Selected asset for detail view
  final selectedAsset = signal<Asset?>(null);

  // Computed values
  late final assetCount = computed(() => assets.value.length);

  late final activeAssets = computed(
    () => assets.value.where((a) => a.status == 'active').toList(),
  );

  late final hasFilters = computed(
    () => statusFilter.value.isNotEmpty || searchQuery.value.isNotEmpty,
  );

  /// Fetch assets with current filters
  Future<void> fetchAssets({bool refresh = false}) async {
    if (isLoading.value && !refresh) return;

    if (refresh) {
      batch(() {
        currentPage.value = 1;
        hasMore.value = true;
      });
    }

    isLoading.value = true;
    error.value = null;

    final result = await _client
        .listAssets(
          page: currentPage.value,
          pageSize: _pageSize,
          statuses: statusFilter.value,
          search: searchQuery.value.isEmpty ? null : searchQuery.value,
        )
        .toResult();

    result.when(
      ok: (fetchedAssets) {
        batch(() {
          if (refresh || currentPage.value == 1) {
            assets.value = fetchedAssets;
          } else {
            assets.value = [...assets.value, ...fetchedAssets];
          }
          hasMore.value = fetchedAssets.length >= _pageSize;
          currentPage.value++;
        });
      },
      error: (e) {
        error.value = e;
      },
    );

    isLoading.value = false;
  }

  /// Load next page
  Future<void> loadMore() async {
    if (!hasMore.value || isLoading.value) return;
    await fetchAssets();
  }

  /// Apply filters and refresh
  void applyFilters({
    List<String>? statuses,
    String? search,
  }) {
    batch(() {
      if (statuses != null) statusFilter.value = statuses;
      if (search != null) searchQuery.value = search;
    });
    fetchAssets(refresh: true);
  }

  /// Clear all filters
  void clearFilters() {
    batch(() {
      statusFilter.value = [];
      searchQuery.value = '';
    });
    fetchAssets(refresh: true);
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
    String? locationId,
  }) async {
    isLoading.value = true;

    final result = await _client
        .createAsset(
          name: name,
          locationId: locationId,
        )
        .toResult();

    result.when(
      ok: (asset) {
        // Add to beginning of list
        assets.value = [asset, ...assets.value];
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
    assets.value = assets.value.map((a) => a.id == updated.id ? updated : a).toList();

    if (selectedAsset.value?.id == updated.id) {
      selectedAsset.value = updated;
    }

    final result = await _client.updateAsset(updated).toResult();

    result.when(
      ok: (asset) {
        // Update with server response
        assets.value = assets.value.map((a) => a.id == asset.id ? asset : a).toList();
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
