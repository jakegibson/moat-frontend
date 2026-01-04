import 'package:equatable/equatable.dart';

// =============================================================================
// Company Settings
// =============================================================================

/// Company settings and configuration.
class CompanySettings extends Equatable {
  final String id;
  final String name;
  final String? logo;
  final String? website;
  final String? industry;
  final String timezone;
  final String dateFormat;
  final String currency;
  final bool allowPublicSignup;
  final bool requireEmailVerification;
  final bool enableTwoFactor;
  final int sessionTimeoutMinutes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CompanySettings({
    required this.id,
    required this.name,
    this.logo,
    this.website,
    this.industry,
    this.timezone = 'UTC',
    this.dateFormat = 'MM/dd/yyyy',
    this.currency = 'USD',
    this.allowPublicSignup = false,
    this.requireEmailVerification = true,
    this.enableTwoFactor = false,
    this.sessionTimeoutMinutes = 60,
    this.createdAt,
    this.updatedAt,
  });

  factory CompanySettings.fromJson(Map<String, dynamic> json) {
    return CompanySettings(
      id: json['id'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String?,
      website: json['website'] as String?,
      industry: json['industry'] as String?,
      timezone: json['timezone'] as String? ?? 'UTC',
      dateFormat: json['date_format'] as String? ?? 'MM/dd/yyyy',
      currency: json['currency'] as String? ?? 'USD',
      allowPublicSignup: json['allow_public_signup'] as bool? ?? false,
      requireEmailVerification:
          json['require_email_verification'] as bool? ?? true,
      enableTwoFactor: json['enable_two_factor'] as bool? ?? false,
      sessionTimeoutMinutes: json['session_timeout_minutes'] as int? ?? 60,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (logo != null) 'logo': logo,
      if (website != null) 'website': website,
      if (industry != null) 'industry': industry,
      'timezone': timezone,
      'date_format': dateFormat,
      'currency': currency,
      'allow_public_signup': allowPublicSignup,
      'require_email_verification': requireEmailVerification,
      'enable_two_factor': enableTwoFactor,
      'session_timeout_minutes': sessionTimeoutMinutes,
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }

  CompanySettings copyWith({
    String? id,
    String? name,
    String? logo,
    String? website,
    String? industry,
    String? timezone,
    String? dateFormat,
    String? currency,
    bool? allowPublicSignup,
    bool? requireEmailVerification,
    bool? enableTwoFactor,
    int? sessionTimeoutMinutes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CompanySettings(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      website: website ?? this.website,
      industry: industry ?? this.industry,
      timezone: timezone ?? this.timezone,
      dateFormat: dateFormat ?? this.dateFormat,
      currency: currency ?? this.currency,
      allowPublicSignup: allowPublicSignup ?? this.allowPublicSignup,
      requireEmailVerification:
          requireEmailVerification ?? this.requireEmailVerification,
      enableTwoFactor: enableTwoFactor ?? this.enableTwoFactor,
      sessionTimeoutMinutes:
          sessionTimeoutMinutes ?? this.sessionTimeoutMinutes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        logo,
        website,
        industry,
        timezone,
        dateFormat,
        currency,
        allowPublicSignup,
        requireEmailVerification,
        enableTwoFactor,
        sessionTimeoutMinutes,
        createdAt,
        updatedAt,
      ];
}

// =============================================================================
// SSO Domain
// =============================================================================

/// SSO domain configuration.
class SSODomain extends Equatable {
  final String id;
  final String companyId;
  final String domain;
  final SSOProvider provider;
  final bool isVerified;
  final bool isActive;
  final String? entityId;
  final String? ssoUrl;
  final String? certificate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const SSODomain({
    required this.id,
    required this.companyId,
    required this.domain,
    required this.provider,
    this.isVerified = false,
    this.isActive = false,
    this.entityId,
    this.ssoUrl,
    this.certificate,
    this.createdAt,
    this.updatedAt,
  });

  factory SSODomain.fromJson(Map<String, dynamic> json) {
    return SSODomain(
      id: json['id'] as String,
      companyId: json['company_id'] as String,
      domain: json['domain'] as String,
      provider: SSOProvider.values.firstWhere(
        (p) => p.name == json['provider'],
        orElse: () => SSOProvider.saml,
      ),
      isVerified: json['is_verified'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? false,
      entityId: json['entity_id'] as String?,
      ssoUrl: json['sso_url'] as String?,
      certificate: json['certificate'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'domain': domain,
      'provider': provider.name,
      'is_verified': isVerified,
      'is_active': isActive,
      if (entityId != null) 'entity_id': entityId,
      if (ssoUrl != null) 'sso_url': ssoUrl,
      if (certificate != null) 'certificate': certificate,
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }

  SSODomain copyWith({
    String? id,
    String? companyId,
    String? domain,
    SSOProvider? provider,
    bool? isVerified,
    bool? isActive,
    String? entityId,
    String? ssoUrl,
    String? certificate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SSODomain(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      domain: domain ?? this.domain,
      provider: provider ?? this.provider,
      isVerified: isVerified ?? this.isVerified,
      isActive: isActive ?? this.isActive,
      entityId: entityId ?? this.entityId,
      ssoUrl: ssoUrl ?? this.ssoUrl,
      certificate: certificate ?? this.certificate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        companyId,
        domain,
        provider,
        isVerified,
        isActive,
        entityId,
        ssoUrl,
        certificate,
        createdAt,
        updatedAt,
      ];
}

/// SSO provider types.
enum SSOProvider {
  saml,
  oidc,
  google,
  microsoft,
  okta,
}

extension SSOProviderExtension on SSOProvider {
  String get displayName {
    switch (this) {
      case SSOProvider.saml:
        return 'SAML 2.0';
      case SSOProvider.oidc:
        return 'OpenID Connect';
      case SSOProvider.google:
        return 'Google Workspace';
      case SSOProvider.microsoft:
        return 'Microsoft Entra ID';
      case SSOProvider.okta:
        return 'Okta';
    }
  }
}

// =============================================================================
// Workflow
// =============================================================================

/// Workflow configuration.
class Workflow extends Equatable {
  final String id;
  final String companyId;
  final String name;
  final String? description;
  final WorkflowType type;
  final bool isActive;
  final List<WorkflowStep> steps;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Workflow({
    required this.id,
    required this.companyId,
    required this.name,
    this.description,
    required this.type,
    this.isActive = true,
    required this.steps,
    this.createdAt,
    this.updatedAt,
  });

  factory Workflow.fromJson(Map<String, dynamic> json) {
    return Workflow(
      id: json['id'] as String,
      companyId: json['company_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      type: WorkflowType.values.firstWhere(
        (t) => t.name == json['type'],
        orElse: () => WorkflowType.ticketApproval,
      ),
      isActive: json['is_active'] as bool? ?? true,
      steps: (json['steps'] as List<dynamic>?)
              ?.map((s) => WorkflowStep.fromJson(s as Map<String, dynamic>))
              .toList() ??
          [],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'name': name,
      if (description != null) 'description': description,
      'type': type.name,
      'is_active': isActive,
      'steps': steps.map((s) => s.toJson()).toList(),
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }

  Workflow copyWith({
    String? id,
    String? companyId,
    String? name,
    String? description,
    WorkflowType? type,
    bool? isActive,
    List<WorkflowStep>? steps,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Workflow(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      isActive: isActive ?? this.isActive,
      steps: steps ?? this.steps,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        companyId,
        name,
        description,
        type,
        isActive,
        steps,
        createdAt,
        updatedAt,
      ];
}

/// Workflow types.
enum WorkflowType {
  ticketApproval,
  assetTransfer,
  maintenanceSchedule,
  documentReview,
}

extension WorkflowTypeExtension on WorkflowType {
  String get displayName {
    switch (this) {
      case WorkflowType.ticketApproval:
        return 'Ticket Approval';
      case WorkflowType.assetTransfer:
        return 'Asset Transfer';
      case WorkflowType.maintenanceSchedule:
        return 'Maintenance Schedule';
      case WorkflowType.documentReview:
        return 'Document Review';
    }
  }
}

/// Workflow step.
class WorkflowStep extends Equatable {
  final String id;
  final String name;
  final int order;
  final String? assigneeRoleId;
  final WorkflowStepAction action;
  final int? timeoutHours;

  const WorkflowStep({
    required this.id,
    required this.name,
    required this.order,
    this.assigneeRoleId,
    required this.action,
    this.timeoutHours,
  });

  factory WorkflowStep.fromJson(Map<String, dynamic> json) {
    return WorkflowStep(
      id: json['id'] as String,
      name: json['name'] as String,
      order: json['order'] as int,
      assigneeRoleId: json['assignee_role_id'] as String?,
      action: WorkflowStepAction.values.firstWhere(
        (a) => a.name == json['action'],
        orElse: () => WorkflowStepAction.approve,
      ),
      timeoutHours: json['timeout_hours'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'order': order,
      if (assigneeRoleId != null) 'assignee_role_id': assigneeRoleId,
      'action': action.name,
      if (timeoutHours != null) 'timeout_hours': timeoutHours,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        order,
        assigneeRoleId,
        action,
        timeoutHours,
      ];
}

/// Workflow step actions.
enum WorkflowStepAction {
  approve,
  review,
  notify,
  assign,
  escalate,
}

extension WorkflowStepActionExtension on WorkflowStepAction {
  String get displayName {
    switch (this) {
      case WorkflowStepAction.approve:
        return 'Approve';
      case WorkflowStepAction.review:
        return 'Review';
      case WorkflowStepAction.notify:
        return 'Notify';
      case WorkflowStepAction.assign:
        return 'Assign';
      case WorkflowStepAction.escalate:
        return 'Escalate';
    }
  }
}

// =============================================================================
// AI Prompt
// =============================================================================

/// AI prompt template.
class AIPrompt extends Equatable {
  final String id;
  final String companyId;
  final String name;
  final String? description;
  final AIPromptType type;
  final String template;
  final Map<String, dynamic>? variables;
  final bool isActive;
  final bool isSystem;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const AIPrompt({
    required this.id,
    required this.companyId,
    required this.name,
    this.description,
    required this.type,
    required this.template,
    this.variables,
    this.isActive = true,
    this.isSystem = false,
    this.createdAt,
    this.updatedAt,
  });

  factory AIPrompt.fromJson(Map<String, dynamic> json) {
    return AIPrompt(
      id: json['id'] as String,
      companyId: json['company_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      type: AIPromptType.values.firstWhere(
        (t) => t.name == json['type'],
        orElse: () => AIPromptType.ticketSummary,
      ),
      template: json['template'] as String,
      variables: json['variables'] as Map<String, dynamic>?,
      isActive: json['is_active'] as bool? ?? true,
      isSystem: json['is_system'] as bool? ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'name': name,
      if (description != null) 'description': description,
      'type': type.name,
      'template': template,
      if (variables != null) 'variables': variables,
      'is_active': isActive,
      'is_system': isSystem,
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }

  AIPrompt copyWith({
    String? id,
    String? companyId,
    String? name,
    String? description,
    AIPromptType? type,
    String? template,
    Map<String, dynamic>? variables,
    bool? isActive,
    bool? isSystem,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AIPrompt(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      template: template ?? this.template,
      variables: variables ?? this.variables,
      isActive: isActive ?? this.isActive,
      isSystem: isSystem ?? this.isSystem,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        companyId,
        name,
        description,
        type,
        template,
        variables,
        isActive,
        isSystem,
        createdAt,
        updatedAt,
      ];
}

/// AI prompt types.
enum AIPromptType {
  ticketSummary,
  ticketResponse,
  documentExtraction,
  assetDescription,
  maintenancePlan,
}

extension AIPromptTypeExtension on AIPromptType {
  String get displayName {
    switch (this) {
      case AIPromptType.ticketSummary:
        return 'Ticket Summary';
      case AIPromptType.ticketResponse:
        return 'Ticket Response';
      case AIPromptType.documentExtraction:
        return 'Document Extraction';
      case AIPromptType.assetDescription:
        return 'Asset Description';
      case AIPromptType.maintenancePlan:
        return 'Maintenance Plan';
    }
  }
}

// =============================================================================
// AI Generation
// =============================================================================

/// AI generation record.
class AIGeneration extends Equatable {
  final String id;
  final String companyId;
  final String promptId;
  final String? promptName;
  final AIGenerationStatus status;
  final String? input;
  final String? output;
  final int? tokensUsed;
  final int? latencyMs;
  final String? error;
  final String? userId;
  final String? userName;
  final DateTime createdAt;

  const AIGeneration({
    required this.id,
    required this.companyId,
    required this.promptId,
    this.promptName,
    required this.status,
    this.input,
    this.output,
    this.tokensUsed,
    this.latencyMs,
    this.error,
    this.userId,
    this.userName,
    required this.createdAt,
  });

  factory AIGeneration.fromJson(Map<String, dynamic> json) {
    return AIGeneration(
      id: json['id'] as String,
      companyId: json['company_id'] as String,
      promptId: json['prompt_id'] as String,
      promptName: json['prompt_name'] as String?,
      status: AIGenerationStatus.values.firstWhere(
        (s) => s.name == json['status'],
        orElse: () => AIGenerationStatus.pending,
      ),
      input: json['input'] as String?,
      output: json['output'] as String?,
      tokensUsed: json['tokens_used'] as int?,
      latencyMs: json['latency_ms'] as int?,
      error: json['error'] as String?,
      userId: json['user_id'] as String?,
      userName: json['user_name'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'prompt_id': promptId,
      if (promptName != null) 'prompt_name': promptName,
      'status': status.name,
      if (input != null) 'input': input,
      if (output != null) 'output': output,
      if (tokensUsed != null) 'tokens_used': tokensUsed,
      if (latencyMs != null) 'latency_ms': latencyMs,
      if (error != null) 'error': error,
      if (userId != null) 'user_id': userId,
      if (userName != null) 'user_name': userName,
      'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        companyId,
        promptId,
        promptName,
        status,
        input,
        output,
        tokensUsed,
        latencyMs,
        error,
        userId,
        userName,
        createdAt,
      ];
}

/// AI generation status.
enum AIGenerationStatus {
  pending,
  running,
  completed,
  failed,
}

extension AIGenerationStatusExtension on AIGenerationStatus {
  String get displayName {
    switch (this) {
      case AIGenerationStatus.pending:
        return 'Pending';
      case AIGenerationStatus.running:
        return 'Running';
      case AIGenerationStatus.completed:
        return 'Completed';
      case AIGenerationStatus.failed:
        return 'Failed';
    }
  }
}

// =============================================================================
// Document Processing Config
// =============================================================================

/// Document processing configuration.
class DocumentConfig extends Equatable {
  final String id;
  final String companyId;
  final String name;
  final DocumentType documentType;
  final String? description;
  final List<String> extractionFields;
  final String? promptId;
  final bool isActive;
  final bool autoProcess;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const DocumentConfig({
    required this.id,
    required this.companyId,
    required this.name,
    required this.documentType,
    this.description,
    required this.extractionFields,
    this.promptId,
    this.isActive = true,
    this.autoProcess = false,
    this.createdAt,
    this.updatedAt,
  });

  factory DocumentConfig.fromJson(Map<String, dynamic> json) {
    return DocumentConfig(
      id: json['id'] as String,
      companyId: json['company_id'] as String,
      name: json['name'] as String,
      documentType: DocumentType.values.firstWhere(
        (t) => t.name == json['document_type'],
        orElse: () => DocumentType.invoice,
      ),
      description: json['description'] as String?,
      extractionFields:
          (json['extraction_fields'] as List<dynamic>?)?.cast<String>() ?? [],
      promptId: json['prompt_id'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      autoProcess: json['auto_process'] as bool? ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'name': name,
      'document_type': documentType.name,
      if (description != null) 'description': description,
      'extraction_fields': extractionFields,
      if (promptId != null) 'prompt_id': promptId,
      'is_active': isActive,
      'auto_process': autoProcess,
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }

  DocumentConfig copyWith({
    String? id,
    String? companyId,
    String? name,
    DocumentType? documentType,
    String? description,
    List<String>? extractionFields,
    String? promptId,
    bool? isActive,
    bool? autoProcess,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DocumentConfig(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      name: name ?? this.name,
      documentType: documentType ?? this.documentType,
      description: description ?? this.description,
      extractionFields: extractionFields ?? this.extractionFields,
      promptId: promptId ?? this.promptId,
      isActive: isActive ?? this.isActive,
      autoProcess: autoProcess ?? this.autoProcess,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        companyId,
        name,
        documentType,
        description,
        extractionFields,
        promptId,
        isActive,
        autoProcess,
        createdAt,
        updatedAt,
      ];
}

/// Document types.
enum DocumentType {
  invoice,
  workOrder,
  warranty,
  manual,
  certificate,
  receipt,
}

extension DocumentTypeExtension on DocumentType {
  String get displayName {
    switch (this) {
      case DocumentType.invoice:
        return 'Invoice';
      case DocumentType.workOrder:
        return 'Work Order';
      case DocumentType.warranty:
        return 'Warranty';
      case DocumentType.manual:
        return 'Manual';
      case DocumentType.certificate:
        return 'Certificate';
      case DocumentType.receipt:
        return 'Receipt';
    }
  }
}

// =============================================================================
// System Metrics
// =============================================================================

/// System metrics overview.
class SystemMetrics extends Equatable {
  final int totalUsers;
  final int activeUsers;
  final int totalTickets;
  final int openTickets;
  final int totalAssets;
  final int totalLocations;
  final int aiGenerationsToday;
  final int aiTokensUsedToday;
  final double avgResponseTimeMs;
  final double errorRate;
  final DateTime timestamp;

  const SystemMetrics({
    required this.totalUsers,
    required this.activeUsers,
    required this.totalTickets,
    required this.openTickets,
    required this.totalAssets,
    required this.totalLocations,
    required this.aiGenerationsToday,
    required this.aiTokensUsedToday,
    required this.avgResponseTimeMs,
    required this.errorRate,
    required this.timestamp,
  });

  factory SystemMetrics.fromJson(Map<String, dynamic> json) {
    return SystemMetrics(
      totalUsers: json['total_users'] as int,
      activeUsers: json['active_users'] as int,
      totalTickets: json['total_tickets'] as int,
      openTickets: json['open_tickets'] as int,
      totalAssets: json['total_assets'] as int,
      totalLocations: json['total_locations'] as int,
      aiGenerationsToday: json['ai_generations_today'] as int,
      aiTokensUsedToday: json['ai_tokens_used_today'] as int,
      avgResponseTimeMs: (json['avg_response_time_ms'] as num).toDouble(),
      errorRate: (json['error_rate'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  @override
  List<Object?> get props => [
        totalUsers,
        activeUsers,
        totalTickets,
        openTickets,
        totalAssets,
        totalLocations,
        aiGenerationsToday,
        aiTokensUsedToday,
        avgResponseTimeMs,
        errorRate,
        timestamp,
      ];
}

// =============================================================================
// Gap Analysis
// =============================================================================

/// Gap analysis item.
class GapAnalysisItem extends Equatable {
  final String id;
  final String category;
  final String title;
  final String description;
  final GapSeverity severity;
  final GapStatus status;
  final String? recommendation;
  final String? assigneeId;
  final String? assigneeName;
  final DateTime? dueDate;
  final DateTime createdAt;
  final DateTime? resolvedAt;

  const GapAnalysisItem({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.severity,
    required this.status,
    this.recommendation,
    this.assigneeId,
    this.assigneeName,
    this.dueDate,
    required this.createdAt,
    this.resolvedAt,
  });

  factory GapAnalysisItem.fromJson(Map<String, dynamic> json) {
    return GapAnalysisItem(
      id: json['id'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      severity: GapSeverity.values.firstWhere(
        (s) => s.name == json['severity'],
        orElse: () => GapSeverity.medium,
      ),
      status: GapStatus.values.firstWhere(
        (s) => s.name == json['status'],
        orElse: () => GapStatus.open,
      ),
      recommendation: json['recommendation'] as String?,
      assigneeId: json['assignee_id'] as String?,
      assigneeName: json['assignee_name'] as String?,
      dueDate: json['due_date'] != null
          ? DateTime.tryParse(json['due_date'] as String)
          : null,
      createdAt: DateTime.parse(json['created_at'] as String),
      resolvedAt: json['resolved_at'] != null
          ? DateTime.tryParse(json['resolved_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'title': title,
      'description': description,
      'severity': severity.name,
      'status': status.name,
      if (recommendation != null) 'recommendation': recommendation,
      if (assigneeId != null) 'assignee_id': assigneeId,
      if (assigneeName != null) 'assignee_name': assigneeName,
      if (dueDate != null) 'due_date': dueDate!.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      if (resolvedAt != null) 'resolved_at': resolvedAt!.toIso8601String(),
    };
  }

  GapAnalysisItem copyWith({
    String? id,
    String? category,
    String? title,
    String? description,
    GapSeverity? severity,
    GapStatus? status,
    String? recommendation,
    String? assigneeId,
    String? assigneeName,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? resolvedAt,
  }) {
    return GapAnalysisItem(
      id: id ?? this.id,
      category: category ?? this.category,
      title: title ?? this.title,
      description: description ?? this.description,
      severity: severity ?? this.severity,
      status: status ?? this.status,
      recommendation: recommendation ?? this.recommendation,
      assigneeId: assigneeId ?? this.assigneeId,
      assigneeName: assigneeName ?? this.assigneeName,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      resolvedAt: resolvedAt ?? this.resolvedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        category,
        title,
        description,
        severity,
        status,
        recommendation,
        assigneeId,
        assigneeName,
        dueDate,
        createdAt,
        resolvedAt,
      ];
}

/// Gap severity levels.
enum GapSeverity {
  critical,
  high,
  medium,
  low,
}

extension GapSeverityExtension on GapSeverity {
  String get displayName {
    switch (this) {
      case GapSeverity.critical:
        return 'Critical';
      case GapSeverity.high:
        return 'High';
      case GapSeverity.medium:
        return 'Medium';
      case GapSeverity.low:
        return 'Low';
    }
  }
}

/// Gap status.
enum GapStatus {
  open,
  inProgress,
  resolved,
  accepted,
}

extension GapStatusExtension on GapStatus {
  String get displayName {
    switch (this) {
      case GapStatus.open:
        return 'Open';
      case GapStatus.inProgress:
        return 'In Progress';
      case GapStatus.resolved:
        return 'Resolved';
      case GapStatus.accepted:
        return 'Accepted';
    }
  }
}
