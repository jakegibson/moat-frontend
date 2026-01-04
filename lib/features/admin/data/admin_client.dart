import 'package:injectable/injectable.dart';

import 'admin_models.dart';

/// Client for admin API calls.
///
/// Currently returns mock data until proto clients are generated.
@lazySingleton
class AdminClient {
  AdminClient();

  // ===========================================================================
  // Company Settings
  // ===========================================================================

  static final _mockCompanySettings = CompanySettings(
    id: 'company-001',
    name: 'Acme Corporation',
    logo: null,
    website: 'https://acme.com',
    industry: 'Manufacturing',
    timezone: 'America/New_York',
    dateFormat: 'MM/dd/yyyy',
    currency: 'USD',
    allowPublicSignup: false,
    requireEmailVerification: true,
    enableTwoFactor: false,
    sessionTimeoutMinutes: 60,
    createdAt: DateTime.now().subtract(const Duration(days: 365)),
    updatedAt: DateTime.now().subtract(const Duration(days: 7)),
  );

  Future<CompanySettings> getCompanySettings() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockCompanySettings;
  }

  Future<CompanySettings> updateCompanySettings(CompanySettings settings) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return settings.copyWith(updatedAt: DateTime.now());
  }

  // ===========================================================================
  // SSO Domains
  // ===========================================================================

  static final _mockSSODomains = <SSODomain>[
    SSODomain(
      id: 'sso-001',
      companyId: 'company-001',
      domain: 'acme.com',
      provider: SSOProvider.microsoft,
      isVerified: true,
      isActive: true,
      entityId: 'https://login.microsoftonline.com/tenant-id',
      ssoUrl: 'https://login.microsoftonline.com/tenant-id/saml2',
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
    ),
    SSODomain(
      id: 'sso-002',
      companyId: 'company-001',
      domain: 'acme-corp.com',
      provider: SSOProvider.google,
      isVerified: true,
      isActive: false,
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
    ),
  ];

  Future<List<SSODomain>> listSSODomains() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_mockSSODomains);
  }

  Future<SSODomain> createSSODomain({
    required String domain,
    required SSOProvider provider,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final newDomain = SSODomain(
      id: 'sso-${DateTime.now().millisecondsSinceEpoch}',
      companyId: 'company-001',
      domain: domain,
      provider: provider,
      isVerified: false,
      isActive: false,
      createdAt: DateTime.now(),
    );
    _mockSSODomains.add(newDomain);
    return newDomain;
  }

  Future<SSODomain> updateSSODomain(SSODomain domain) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _mockSSODomains.indexWhere((d) => d.id == domain.id);
    if (index == -1) throw Exception('Domain not found');
    _mockSSODomains[index] = domain.copyWith(updatedAt: DateTime.now());
    return _mockSSODomains[index];
  }

  Future<void> deleteSSODomain(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _mockSSODomains.removeWhere((d) => d.id == id);
  }

  Future<SSODomain> verifySSODomain(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _mockSSODomains.indexWhere((d) => d.id == id);
    if (index == -1) throw Exception('Domain not found');
    _mockSSODomains[index] = _mockSSODomains[index].copyWith(
      isVerified: true,
      updatedAt: DateTime.now(),
    );
    return _mockSSODomains[index];
  }

  // ===========================================================================
  // Workflows
  // ===========================================================================

  static final _mockWorkflows = <Workflow>[
    Workflow(
      id: 'wf-001',
      companyId: 'company-001',
      name: 'Ticket Approval Flow',
      description: 'Standard approval workflow for high-priority tickets',
      type: WorkflowType.ticketApproval,
      isActive: true,
      steps: [
        const WorkflowStep(
          id: 'step-1',
          name: 'Manager Review',
          order: 1,
          assigneeRoleId: 'role-manager',
          action: WorkflowStepAction.review,
          timeoutHours: 24,
        ),
        const WorkflowStep(
          id: 'step-2',
          name: 'Admin Approval',
          order: 2,
          assigneeRoleId: 'role-admin',
          action: WorkflowStepAction.approve,
          timeoutHours: 48,
        ),
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    Workflow(
      id: 'wf-002',
      companyId: 'company-001',
      name: 'Asset Transfer',
      description: 'Workflow for transferring assets between locations',
      type: WorkflowType.assetTransfer,
      isActive: true,
      steps: [
        const WorkflowStep(
          id: 'step-1',
          name: 'Source Location Approval',
          order: 1,
          assigneeRoleId: 'role-loc-manager',
          action: WorkflowStepAction.approve,
        ),
        const WorkflowStep(
          id: 'step-2',
          name: 'Destination Confirmation',
          order: 2,
          assigneeRoleId: 'role-loc-manager',
          action: WorkflowStepAction.approve,
        ),
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
    Workflow(
      id: 'wf-003',
      companyId: 'company-001',
      name: 'Document Review',
      description: 'Review process for uploaded documents',
      type: WorkflowType.documentReview,
      isActive: false,
      steps: [
        const WorkflowStep(
          id: 'step-1',
          name: 'Initial Review',
          order: 1,
          action: WorkflowStepAction.review,
        ),
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
    ),
  ];

  Future<List<Workflow>> listWorkflows() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_mockWorkflows);
  }

  Future<Workflow> createWorkflow(Workflow workflow) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final newWorkflow = workflow.copyWith(
      id: 'wf-${DateTime.now().millisecondsSinceEpoch}',
      createdAt: DateTime.now(),
    );
    _mockWorkflows.add(newWorkflow);
    return newWorkflow;
  }

  Future<Workflow> updateWorkflow(Workflow workflow) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _mockWorkflows.indexWhere((w) => w.id == workflow.id);
    if (index == -1) throw Exception('Workflow not found');
    _mockWorkflows[index] = workflow.copyWith(updatedAt: DateTime.now());
    return _mockWorkflows[index];
  }

  Future<void> deleteWorkflow(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _mockWorkflows.removeWhere((w) => w.id == id);
  }

  Future<Workflow> toggleWorkflowActive(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _mockWorkflows.indexWhere((w) => w.id == id);
    if (index == -1) throw Exception('Workflow not found');
    _mockWorkflows[index] = _mockWorkflows[index].copyWith(
      isActive: !_mockWorkflows[index].isActive,
      updatedAt: DateTime.now(),
    );
    return _mockWorkflows[index];
  }

  // ===========================================================================
  // AI Prompts
  // ===========================================================================

  static final _mockPrompts = <AIPrompt>[
    AIPrompt(
      id: 'prompt-001',
      companyId: 'company-001',
      name: 'Ticket Summary Generator',
      description: 'Generates concise summaries for ticket descriptions',
      type: AIPromptType.ticketSummary,
      template:
          'Summarize the following ticket in 2-3 sentences:\n\n{{ticket_description}}',
      variables: {'ticket_description': 'The full ticket description'},
      isActive: true,
      isSystem: true,
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
    ),
    AIPrompt(
      id: 'prompt-002',
      companyId: 'company-001',
      name: 'Customer Response Draft',
      description: 'Drafts professional responses to customer tickets',
      type: AIPromptType.ticketResponse,
      template:
          'Draft a professional response to this customer inquiry:\n\n{{customer_message}}\n\nContext: {{ticket_context}}',
      variables: {
        'customer_message': 'The customer message',
        'ticket_context': 'Additional context',
      },
      isActive: true,
      isSystem: false,
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
    ),
    AIPrompt(
      id: 'prompt-003',
      companyId: 'company-001',
      name: 'Invoice Extractor',
      description: 'Extracts key fields from invoice documents',
      type: AIPromptType.documentExtraction,
      template:
          'Extract the following fields from this invoice:\n- Vendor name\n- Invoice number\n- Date\n- Total amount\n- Line items\n\nDocument:\n{{document_text}}',
      variables: {'document_text': 'OCR text from document'},
      isActive: true,
      isSystem: true,
      createdAt: DateTime.now().subtract(const Duration(days: 120)),
    ),
    AIPrompt(
      id: 'prompt-004',
      companyId: 'company-001',
      name: 'Asset Description',
      description: 'Generates detailed asset descriptions',
      type: AIPromptType.assetDescription,
      template:
          'Generate a detailed description for this asset:\n\nType: {{asset_type}}\nManufacturer: {{manufacturer}}\nModel: {{model}}',
      isActive: false,
      isSystem: false,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
  ];

  Future<List<AIPrompt>> listPrompts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_mockPrompts);
  }

  Future<AIPrompt> createPrompt(AIPrompt prompt) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final newPrompt = prompt.copyWith(
      id: 'prompt-${DateTime.now().millisecondsSinceEpoch}',
      createdAt: DateTime.now(),
    );
    _mockPrompts.add(newPrompt);
    return newPrompt;
  }

  Future<AIPrompt> updatePrompt(AIPrompt prompt) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _mockPrompts.indexWhere((p) => p.id == prompt.id);
    if (index == -1) throw Exception('Prompt not found');
    _mockPrompts[index] = prompt.copyWith(updatedAt: DateTime.now());
    return _mockPrompts[index];
  }

  Future<void> deletePrompt(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final prompt = _mockPrompts.firstWhere((p) => p.id == id);
    if (prompt.isSystem) throw Exception('Cannot delete system prompts');
    _mockPrompts.removeWhere((p) => p.id == id);
  }

  Future<AIPrompt> togglePromptActive(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _mockPrompts.indexWhere((p) => p.id == id);
    if (index == -1) throw Exception('Prompt not found');
    _mockPrompts[index] = _mockPrompts[index].copyWith(
      isActive: !_mockPrompts[index].isActive,
      updatedAt: DateTime.now(),
    );
    return _mockPrompts[index];
  }

  // ===========================================================================
  // AI Generations
  // ===========================================================================

  static final _mockGenerations = <AIGeneration>[
    AIGeneration(
      id: 'gen-001',
      companyId: 'company-001',
      promptId: 'prompt-001',
      promptName: 'Ticket Summary Generator',
      status: AIGenerationStatus.completed,
      input: 'HVAC unit not cooling properly in building A...',
      output:
          'The HVAC system in building A is experiencing cooling issues, requiring technician inspection and potential refrigerant recharge.',
      tokensUsed: 145,
      latencyMs: 1250,
      userId: 'user-001',
      userName: 'John Smith',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    AIGeneration(
      id: 'gen-002',
      companyId: 'company-001',
      promptId: 'prompt-002',
      promptName: 'Customer Response Draft',
      status: AIGenerationStatus.completed,
      input: 'When will my equipment be repaired?',
      output:
          'Thank you for reaching out. Our technician is scheduled to arrive tomorrow between 9 AM and 12 PM...',
      tokensUsed: 210,
      latencyMs: 1800,
      userId: 'user-002',
      userName: 'Jane Doe',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    AIGeneration(
      id: 'gen-003',
      companyId: 'company-001',
      promptId: 'prompt-003',
      promptName: 'Invoice Extractor',
      status: AIGenerationStatus.failed,
      input: '[Document text too long]',
      error: 'Document exceeds maximum token limit',
      userId: 'user-001',
      userName: 'John Smith',
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    ),
    AIGeneration(
      id: 'gen-004',
      companyId: 'company-001',
      promptId: 'prompt-001',
      promptName: 'Ticket Summary Generator',
      status: AIGenerationStatus.running,
      input: 'Fire suppression system annual inspection...',
      userId: 'user-003',
      userName: 'Bob Wilson',
      createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
  ];

  Future<List<AIGeneration>> listGenerations({
    int limit = 50,
    int offset = 0,
    String? promptId,
    AIGenerationStatus? status,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    var filtered = _mockGenerations.toList();
    if (promptId != null) {
      filtered = filtered.where((g) => g.promptId == promptId).toList();
    }
    if (status != null) {
      filtered = filtered.where((g) => g.status == status).toList();
    }
    return filtered.skip(offset).take(limit).toList();
  }

  Future<AIGeneration> getGeneration(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _mockGenerations.firstWhere((g) => g.id == id);
  }

  // ===========================================================================
  // Document Processing
  // ===========================================================================

  static final _mockDocumentConfigs = <DocumentConfig>[
    DocumentConfig(
      id: 'doc-001',
      companyId: 'company-001',
      name: 'Invoice Processing',
      documentType: DocumentType.invoice,
      description: 'Extract data from vendor invoices',
      extractionFields: [
        'vendor_name',
        'invoice_number',
        'date',
        'total',
        'line_items',
      ],
      promptId: 'prompt-003',
      isActive: true,
      autoProcess: true,
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
    ),
    DocumentConfig(
      id: 'doc-002',
      companyId: 'company-001',
      name: 'Work Order Extraction',
      documentType: DocumentType.workOrder,
      description: 'Parse work order details',
      extractionFields: [
        'work_order_number',
        'description',
        'location',
        'date',
        'technician',
      ],
      isActive: true,
      autoProcess: false,
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
    DocumentConfig(
      id: 'doc-003',
      companyId: 'company-001',
      name: 'Warranty Documents',
      documentType: DocumentType.warranty,
      description: 'Extract warranty information',
      extractionFields: [
        'product',
        'serial_number',
        'start_date',
        'end_date',
        'coverage',
      ],
      isActive: false,
      autoProcess: false,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
  ];

  Future<List<DocumentConfig>> listDocumentConfigs() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_mockDocumentConfigs);
  }

  Future<DocumentConfig> createDocumentConfig(DocumentConfig config) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final newConfig = config.copyWith(
      id: 'doc-${DateTime.now().millisecondsSinceEpoch}',
      createdAt: DateTime.now(),
    );
    _mockDocumentConfigs.add(newConfig);
    return newConfig;
  }

  Future<DocumentConfig> updateDocumentConfig(DocumentConfig config) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _mockDocumentConfigs.indexWhere((c) => c.id == config.id);
    if (index == -1) throw Exception('Config not found');
    _mockDocumentConfigs[index] = config.copyWith(updatedAt: DateTime.now());
    return _mockDocumentConfigs[index];
  }

  Future<void> deleteDocumentConfig(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _mockDocumentConfigs.removeWhere((c) => c.id == id);
  }

  // ===========================================================================
  // System Metrics
  // ===========================================================================

  Future<SystemMetrics> getSystemMetrics() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return SystemMetrics(
      totalUsers: 47,
      activeUsers: 32,
      totalTickets: 1284,
      openTickets: 156,
      totalAssets: 892,
      totalLocations: 12,
      aiGenerationsToday: 234,
      aiTokensUsedToday: 45600,
      avgResponseTimeMs: 245.7,
      errorRate: 0.02,
      timestamp: DateTime.now(),
    );
  }

  // ===========================================================================
  // Gap Analysis
  // ===========================================================================

  static final _mockGapItems = <GapAnalysisItem>[
    GapAnalysisItem(
      id: 'gap-001',
      category: 'Security',
      title: 'Two-Factor Authentication Not Enabled',
      description:
          'Two-factor authentication is not enabled for the organization, which may expose accounts to unauthorized access.',
      severity: GapSeverity.high,
      status: GapStatus.open,
      recommendation:
          'Enable two-factor authentication in Company Settings to enhance account security.',
      createdAt: DateTime.now().subtract(const Duration(days: 14)),
    ),
    GapAnalysisItem(
      id: 'gap-002',
      category: 'Compliance',
      title: 'Missing Asset Maintenance Records',
      description:
          '23 assets are missing required maintenance documentation for the past 6 months.',
      severity: GapSeverity.medium,
      status: GapStatus.inProgress,
      recommendation:
          'Review flagged assets and ensure maintenance logs are up to date.',
      assigneeId: 'user-002',
      assigneeName: 'Jane Doe',
      dueDate: DateTime.now().add(const Duration(days: 7)),
      createdAt: DateTime.now().subtract(const Duration(days: 21)),
    ),
    GapAnalysisItem(
      id: 'gap-003',
      category: 'Operations',
      title: 'Unassigned High-Priority Tickets',
      description:
          '5 high-priority tickets have been unassigned for more than 48 hours.',
      severity: GapSeverity.critical,
      status: GapStatus.open,
      recommendation:
          'Review assignment rules and ensure adequate staff coverage for high-priority issues.',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    GapAnalysisItem(
      id: 'gap-004',
      category: 'Data Quality',
      title: 'Incomplete Location Data',
      description:
          '3 locations are missing address information, affecting reporting accuracy.',
      severity: GapSeverity.low,
      status: GapStatus.resolved,
      recommendation: 'Update location records with complete address details.',
      assigneeId: 'user-001',
      assigneeName: 'John Smith',
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      resolvedAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    GapAnalysisItem(
      id: 'gap-005',
      category: 'Security',
      title: 'Expired User Sessions',
      description:
          'Session timeout is set to 60 minutes. Consider reducing for enhanced security.',
      severity: GapSeverity.low,
      status: GapStatus.accepted,
      recommendation: 'Reduce session timeout to 30 minutes.',
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
  ];

  Future<List<GapAnalysisItem>> listGapItems({
    GapSeverity? severity,
    GapStatus? status,
    String? category,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    var filtered = _mockGapItems.toList();
    if (severity != null) {
      filtered = filtered.where((g) => g.severity == severity).toList();
    }
    if (status != null) {
      filtered = filtered.where((g) => g.status == status).toList();
    }
    if (category != null) {
      filtered = filtered.where((g) => g.category == category).toList();
    }
    return filtered;
  }

  Future<GapAnalysisItem> updateGapItem(GapAnalysisItem item) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _mockGapItems.indexWhere((g) => g.id == item.id);
    if (index == -1) throw Exception('Gap item not found');
    _mockGapItems[index] = item;
    return item;
  }

  Future<List<String>> getGapCategories() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return ['Security', 'Compliance', 'Operations', 'Data Quality'];
  }
}
