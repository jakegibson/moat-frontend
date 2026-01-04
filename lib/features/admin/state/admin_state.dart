import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../data/admin_client.dart';
import '../data/admin_models.dart';

/// State management for admin features.
///
/// Uses Signals for reactive state updates.
@lazySingleton
class AdminState {
  final AdminClient _client;

  AdminState(this._client);

  // ===========================================================================
  // Company Settings State
  // ===========================================================================

  final companySettings = signal<CompanySettings?>(null);
  final isLoadingSettings = signal(false);
  final settingsError = signal<AppError?>(null);

  Future<void> fetchCompanySettings({bool refresh = false}) async {
    if (isLoadingSettings.value && !refresh) return;
    if (companySettings.value != null && !refresh) return;

    isLoadingSettings.value = true;
    settingsError.value = null;

    final result = await _client.getCompanySettings().toResult();

    batch(() {
      result.when(
        ok: (data) => companySettings.value = data,
        error: (e) => settingsError.value = e,
      );
      isLoadingSettings.value = false;
    });
  }

  Future<Result<CompanySettings>> updateCompanySettings(
    CompanySettings settings,
  ) async {
    final previous = companySettings.value;
    companySettings.value = settings;

    final result = await _client.updateCompanySettings(settings).toResult();

    result.when(
      ok: (data) => companySettings.value = data,
      error: (e) {
        companySettings.value = previous;
        settingsError.value = e;
      },
    );

    return result;
  }

  // ===========================================================================
  // SSO Domains State
  // ===========================================================================

  final ssoDomains = signal<List<SSODomain>>([]);
  final isLoadingSSO = signal(false);
  final ssoError = signal<AppError?>(null);

  Future<void> fetchSSODomains({bool refresh = false}) async {
    if (isLoadingSSO.value && !refresh) return;

    isLoadingSSO.value = true;
    ssoError.value = null;

    final result = await _client.listSSODomains().toResult();

    batch(() {
      result.when(
        ok: (data) => ssoDomains.value = data,
        error: (e) => ssoError.value = e,
      );
      isLoadingSSO.value = false;
    });
  }

  Future<Result<SSODomain>> createSSODomain({
    required String domain,
    required SSOProvider provider,
  }) async {
    final result = await _client
        .createSSODomain(domain: domain, provider: provider)
        .toResult();

    result.when(
      ok: (data) => ssoDomains.value = [...ssoDomains.value, data],
      error: (e) => ssoError.value = e,
    );

    return result;
  }

  Future<Result<SSODomain>> updateSSODomain(SSODomain domain) async {
    final previous = ssoDomains.value;
    ssoDomains.value =
        ssoDomains.value.map((d) => d.id == domain.id ? domain : d).toList();

    final result = await _client.updateSSODomain(domain).toResult();

    result.when(
      ok: (data) => ssoDomains.value =
          ssoDomains.value.map((d) => d.id == domain.id ? data : d).toList(),
      error: (e) {
        ssoDomains.value = previous;
        ssoError.value = e;
      },
    );

    return result;
  }

  Future<Result<void>> deleteSSODomain(String id) async {
    final previous = ssoDomains.value;
    ssoDomains.value = ssoDomains.value.where((d) => d.id != id).toList();

    final result = await _client.deleteSSODomain(id).toResult();

    result.when(
      ok: (_) {},
      error: (e) {
        ssoDomains.value = previous;
        ssoError.value = e;
      },
    );

    return result;
  }

  Future<Result<SSODomain>> verifySSODomain(String id) async {
    final result = await _client.verifySSODomain(id).toResult();

    result.when(
      ok: (data) => ssoDomains.value =
          ssoDomains.value.map((d) => d.id == id ? data : d).toList(),
      error: (e) => ssoError.value = e,
    );

    return result;
  }

  // ===========================================================================
  // Workflows State
  // ===========================================================================

  final workflows = signal<List<Workflow>>([]);
  final isLoadingWorkflows = signal(false);
  final workflowsError = signal<AppError?>(null);

  late final activeWorkflows =
      computed(() => workflows.value.where((w) => w.isActive).toList());

  Future<void> fetchWorkflows({bool refresh = false}) async {
    if (isLoadingWorkflows.value && !refresh) return;

    isLoadingWorkflows.value = true;
    workflowsError.value = null;

    final result = await _client.listWorkflows().toResult();

    batch(() {
      result.when(
        ok: (data) => workflows.value = data,
        error: (e) => workflowsError.value = e,
      );
      isLoadingWorkflows.value = false;
    });
  }

  Future<Result<Workflow>> createWorkflow(Workflow workflow) async {
    final result = await _client.createWorkflow(workflow).toResult();

    result.when(
      ok: (data) => workflows.value = [...workflows.value, data],
      error: (e) => workflowsError.value = e,
    );

    return result;
  }

  Future<Result<Workflow>> updateWorkflow(Workflow workflow) async {
    final previous = workflows.value;
    workflows.value = workflows.value
        .map((w) => w.id == workflow.id ? workflow : w)
        .toList();

    final result = await _client.updateWorkflow(workflow).toResult();

    result.when(
      ok: (data) => workflows.value =
          workflows.value.map((w) => w.id == workflow.id ? data : w).toList(),
      error: (e) {
        workflows.value = previous;
        workflowsError.value = e;
      },
    );

    return result;
  }

  Future<Result<void>> deleteWorkflow(String id) async {
    final previous = workflows.value;
    workflows.value = workflows.value.where((w) => w.id != id).toList();

    final result = await _client.deleteWorkflow(id).toResult();

    result.when(
      ok: (_) {},
      error: (e) {
        workflows.value = previous;
        workflowsError.value = e;
      },
    );

    return result;
  }

  Future<Result<Workflow>> toggleWorkflowActive(String id) async {
    final previous = workflows.value;
    workflows.value = workflows.value
        .map((w) => w.id == id ? w.copyWith(isActive: !w.isActive) : w)
        .toList();

    final result = await _client.toggleWorkflowActive(id).toResult();

    result.when(
      ok: (data) =>
          workflows.value = workflows.value.map((w) => w.id == id ? data : w).toList(),
      error: (e) {
        workflows.value = previous;
        workflowsError.value = e;
      },
    );

    return result;
  }

  // ===========================================================================
  // AI Prompts State
  // ===========================================================================

  final prompts = signal<List<AIPrompt>>([]);
  final isLoadingPrompts = signal(false);
  final promptsError = signal<AppError?>(null);

  late final activePrompts =
      computed(() => prompts.value.where((p) => p.isActive).toList());
  late final systemPrompts =
      computed(() => prompts.value.where((p) => p.isSystem).toList());
  late final customPrompts =
      computed(() => prompts.value.where((p) => !p.isSystem).toList());

  Future<void> fetchPrompts({bool refresh = false}) async {
    if (isLoadingPrompts.value && !refresh) return;

    isLoadingPrompts.value = true;
    promptsError.value = null;

    final result = await _client.listPrompts().toResult();

    batch(() {
      result.when(
        ok: (data) => prompts.value = data,
        error: (e) => promptsError.value = e,
      );
      isLoadingPrompts.value = false;
    });
  }

  Future<Result<AIPrompt>> createPrompt(AIPrompt prompt) async {
    final result = await _client.createPrompt(prompt).toResult();

    result.when(
      ok: (data) => prompts.value = [...prompts.value, data],
      error: (e) => promptsError.value = e,
    );

    return result;
  }

  Future<Result<AIPrompt>> updatePrompt(AIPrompt prompt) async {
    final previous = prompts.value;
    prompts.value =
        prompts.value.map((p) => p.id == prompt.id ? prompt : p).toList();

    final result = await _client.updatePrompt(prompt).toResult();

    result.when(
      ok: (data) => prompts.value =
          prompts.value.map((p) => p.id == prompt.id ? data : p).toList(),
      error: (e) {
        prompts.value = previous;
        promptsError.value = e;
      },
    );

    return result;
  }

  Future<Result<void>> deletePrompt(String id) async {
    final previous = prompts.value;
    prompts.value = prompts.value.where((p) => p.id != id).toList();

    final result = await _client.deletePrompt(id).toResult();

    result.when(
      ok: (_) {},
      error: (e) {
        prompts.value = previous;
        promptsError.value = e;
      },
    );

    return result;
  }

  Future<Result<AIPrompt>> togglePromptActive(String id) async {
    final previous = prompts.value;
    prompts.value = prompts.value
        .map((p) => p.id == id ? p.copyWith(isActive: !p.isActive) : p)
        .toList();

    final result = await _client.togglePromptActive(id).toResult();

    result.when(
      ok: (data) =>
          prompts.value = prompts.value.map((p) => p.id == id ? data : p).toList(),
      error: (e) {
        prompts.value = previous;
        promptsError.value = e;
      },
    );

    return result;
  }

  // ===========================================================================
  // AI Generations State
  // ===========================================================================

  final generations = signal<List<AIGeneration>>([]);
  final isLoadingGenerations = signal(false);
  final generationsError = signal<AppError?>(null);
  final generationsFilter = signal<AIGenerationStatus?>(null);

  late final filteredGenerations = computed(() {
    final filter = generationsFilter.value;
    if (filter == null) return generations.value;
    return generations.value.where((g) => g.status == filter).toList();
  });

  Future<void> fetchGenerations({
    bool refresh = false,
    String? promptId,
    AIGenerationStatus? status,
  }) async {
    if (isLoadingGenerations.value && !refresh) return;

    isLoadingGenerations.value = true;
    generationsError.value = null;

    final result = await _client
        .listGenerations(promptId: promptId, status: status)
        .toResult();

    batch(() {
      result.when(
        ok: (data) => generations.value = data,
        error: (e) => generationsError.value = e,
      );
      isLoadingGenerations.value = false;
    });
  }

  void setGenerationsFilter(AIGenerationStatus? status) {
    generationsFilter.value = status;
  }

  // ===========================================================================
  // Document Processing State
  // ===========================================================================

  final documentConfigs = signal<List<DocumentConfig>>([]);
  final isLoadingDocConfigs = signal(false);
  final docConfigsError = signal<AppError?>(null);

  late final activeDocConfigs =
      computed(() => documentConfigs.value.where((c) => c.isActive).toList());

  Future<void> fetchDocumentConfigs({bool refresh = false}) async {
    if (isLoadingDocConfigs.value && !refresh) return;

    isLoadingDocConfigs.value = true;
    docConfigsError.value = null;

    final result = await _client.listDocumentConfigs().toResult();

    batch(() {
      result.when(
        ok: (data) => documentConfigs.value = data,
        error: (e) => docConfigsError.value = e,
      );
      isLoadingDocConfigs.value = false;
    });
  }

  Future<Result<DocumentConfig>> createDocumentConfig(
    DocumentConfig config,
  ) async {
    final result = await _client.createDocumentConfig(config).toResult();

    result.when(
      ok: (data) => documentConfigs.value = [...documentConfigs.value, data],
      error: (e) => docConfigsError.value = e,
    );

    return result;
  }

  Future<Result<DocumentConfig>> updateDocumentConfig(
    DocumentConfig config,
  ) async {
    final previous = documentConfigs.value;
    documentConfigs.value = documentConfigs.value
        .map((c) => c.id == config.id ? config : c)
        .toList();

    final result = await _client.updateDocumentConfig(config).toResult();

    result.when(
      ok: (data) => documentConfigs.value = documentConfigs.value
          .map((c) => c.id == config.id ? data : c)
          .toList(),
      error: (e) {
        documentConfigs.value = previous;
        docConfigsError.value = e;
      },
    );

    return result;
  }

  Future<Result<void>> deleteDocumentConfig(String id) async {
    final previous = documentConfigs.value;
    documentConfigs.value =
        documentConfigs.value.where((c) => c.id != id).toList();

    final result = await _client.deleteDocumentConfig(id).toResult();

    result.when(
      ok: (_) {},
      error: (e) {
        documentConfigs.value = previous;
        docConfigsError.value = e;
      },
    );

    return result;
  }

  // ===========================================================================
  // System Metrics State
  // ===========================================================================

  final systemMetrics = signal<SystemMetrics?>(null);
  final isLoadingMetrics = signal(false);
  final metricsError = signal<AppError?>(null);

  Future<void> fetchSystemMetrics({bool refresh = false}) async {
    if (isLoadingMetrics.value && !refresh) return;

    isLoadingMetrics.value = true;
    metricsError.value = null;

    final result = await _client.getSystemMetrics().toResult();

    batch(() {
      result.when(
        ok: (data) => systemMetrics.value = data,
        error: (e) => metricsError.value = e,
      );
      isLoadingMetrics.value = false;
    });
  }

  // ===========================================================================
  // Gap Analysis State
  // ===========================================================================

  final gapItems = signal<List<GapAnalysisItem>>([]);
  final gapCategories = signal<List<String>>([]);
  final isLoadingGaps = signal(false);
  final gapsError = signal<AppError?>(null);
  final gapSeverityFilter = signal<GapSeverity?>(null);
  final gapStatusFilter = signal<GapStatus?>(null);
  final gapCategoryFilter = signal<String?>(null);

  late final filteredGapItems = computed(() {
    var items = gapItems.value;
    final severity = gapSeverityFilter.value;
    final status = gapStatusFilter.value;
    final category = gapCategoryFilter.value;

    if (severity != null) {
      items = items.where((g) => g.severity == severity).toList();
    }
    if (status != null) {
      items = items.where((g) => g.status == status).toList();
    }
    if (category != null) {
      items = items.where((g) => g.category == category).toList();
    }
    return items;
  });

  late final openGapsCount = computed(
    () => gapItems.value.where((g) => g.status == GapStatus.open).length,
  );

  late final criticalGapsCount = computed(
    () => gapItems.value.where((g) => g.severity == GapSeverity.critical).length,
  );

  Future<void> fetchGapItems({bool refresh = false}) async {
    if (isLoadingGaps.value && !refresh) return;

    isLoadingGaps.value = true;
    gapsError.value = null;

    final results = await Future.wait([
      _client.listGapItems().toResult(),
      _client.getGapCategories().toResult(),
    ]);

    batch(() {
      final itemsResult = results[0] as Result<List<GapAnalysisItem>>;
      final categoriesResult = results[1] as Result<List<String>>;

      itemsResult.when(
        ok: (data) => gapItems.value = data,
        error: (e) => gapsError.value = e,
      );

      categoriesResult.when(
        ok: (data) => gapCategories.value = data,
        error: (_) {},
      );

      isLoadingGaps.value = false;
    });
  }

  Future<Result<GapAnalysisItem>> updateGapItem(GapAnalysisItem item) async {
    final previous = gapItems.value;
    gapItems.value =
        gapItems.value.map((g) => g.id == item.id ? item : g).toList();

    final result = await _client.updateGapItem(item).toResult();

    result.when(
      ok: (data) => gapItems.value =
          gapItems.value.map((g) => g.id == item.id ? data : g).toList(),
      error: (e) {
        gapItems.value = previous;
        gapsError.value = e;
      },
    );

    return result;
  }

  void setGapFilters({
    GapSeverity? severity,
    GapStatus? status,
    String? category,
  }) {
    batch(() {
      gapSeverityFilter.value = severity;
      gapStatusFilter.value = status;
      gapCategoryFilter.value = category;
    });
  }

  void clearGapFilters() {
    batch(() {
      gapSeverityFilter.value = null;
      gapStatusFilter.value = null;
      gapCategoryFilter.value = null;
    });
  }
}
