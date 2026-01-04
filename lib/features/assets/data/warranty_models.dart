// Warranty coverage and history models.
// Matches v0's WarrantyCoverageApiResponse and AppAssetWarrantyCoverageHistory.

/// Types of warranty resolution actions.
enum WarrantyHistoryType {
  noAction,
  madeClaim,
  other;

  String get displayName {
    switch (this) {
      case WarrantyHistoryType.noAction:
        return 'No Action Taken';
      case WarrantyHistoryType.madeClaim:
        return 'Made a Warranty Claim';
      case WarrantyHistoryType.other:
        return 'Other';
    }
  }

  static WarrantyHistoryType fromString(String? value) {
    switch (value) {
      case 'noAction':
        return WarrantyHistoryType.noAction;
      case 'madeClaim':
        return WarrantyHistoryType.madeClaim;
      case 'other':
        return WarrantyHistoryType.other;
      default:
        return WarrantyHistoryType.other;
    }
  }
}

/// Warranty coverage history entry for tracking resolution actions.
class WarrantyCoverageHistory {
  final String id;
  final String coverageId;
  final String assetId;
  final WarrantyHistoryType type;
  final String? description;
  final DateTime date;
  final String? userId;
  final String? userName;

  const WarrantyCoverageHistory({
    required this.id,
    required this.coverageId,
    required this.assetId,
    required this.type,
    this.description,
    required this.date,
    this.userId,
    this.userName,
  });

  factory WarrantyCoverageHistory.fromJson(Map<String, dynamic> json) {
    return WarrantyCoverageHistory(
      id: json['id'] as String? ?? '',
      coverageId: json['coverage_id'] as String? ?? json['coverageId'] as String? ?? '',
      assetId: json['asset_id'] as String? ?? json['assetId'] as String? ?? '',
      type: WarrantyHistoryType.fromString(json['type'] as String?),
      description: json['description'] as String?,
      date: json['date'] != null
          ? DateTime.parse(json['date'] as String)
          : DateTime.now(),
      userId: json['user_id'] as String? ?? json['userId'] as String?,
      userName: json['user_name'] as String? ?? json['userName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'coverage_id': coverageId,
      'asset_id': assetId,
      'type': type.name,
      'description': description,
      'date': date.toIso8601String(),
      'user_id': userId,
      'user_name': userName,
    };
  }
}

/// Warranty coverage information from warranty documents.
class WarrantyCoverage {
  final String id;
  final String assetId;
  final String? companyId;
  final String? name;
  final String? description;
  final int? expirationInMonths;
  final int? pageNumber;
  final String? assetFileId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Map<String, dynamic>? details;
  final String? warrantyType;
  final String? status;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? registeredDate;
  final String? registrationNumber;
  final String? providerName;
  final String? providerContact;
  final String? providerPhone;
  final String? providerEmail;
  final String? providerWebsite;
  final String? termsAndConditions;
  final List<String>? coverageItems;
  final List<String>? exclusions;
  final String? claimProcess;
  final List<String>? claimRequirements;
  final double? cost;
  final bool? isTransferable;
  final bool? isActive;
  final int? daysRemaining;

  const WarrantyCoverage({
    required this.id,
    required this.assetId,
    this.companyId,
    this.name,
    this.description,
    this.expirationInMonths,
    this.pageNumber,
    this.assetFileId,
    this.createdAt,
    this.updatedAt,
    this.details,
    this.warrantyType,
    this.status,
    this.startDate,
    this.endDate,
    this.registeredDate,
    this.registrationNumber,
    this.providerName,
    this.providerContact,
    this.providerPhone,
    this.providerEmail,
    this.providerWebsite,
    this.termsAndConditions,
    this.coverageItems,
    this.exclusions,
    this.claimProcess,
    this.claimRequirements,
    this.cost,
    this.isTransferable,
    this.isActive,
    this.daysRemaining,
  });

  /// Whether this is a lifetime warranty (999 months).
  bool get isLifetimeWarranty => expirationInMonths == 999;

  /// Whether this warranty has expired.
  bool get isExpired {
    if (endDate == null) return false;
    return DateTime.now().isAfter(endDate!);
  }

  /// Calculate days until expiration.
  int? get daysUntilExpiration {
    if (endDate == null) return null;
    return endDate!.difference(DateTime.now()).inDays;
  }

  /// Get the provider name from details or direct field.
  String? get effectiveProviderName =>
      details?['provider'] as String? ??
      details?['provider_name'] as String? ??
      providerName;

  /// Get provider contact from details or direct field.
  String? get effectiveProviderContact =>
      details?['provider_contact'] as String? ?? providerContact;

  /// Get provider phone from details or direct field.
  String? get effectiveProviderPhone =>
      details?['provider_phone'] as String? ?? providerPhone;

  /// Get provider email from details or direct field.
  String? get effectiveProviderEmail =>
      details?['provider_email'] as String? ?? providerEmail;

  /// Get provider website from details or direct field.
  String? get effectiveProviderWebsite =>
      details?['provider_website'] as String? ?? providerWebsite;

  /// Get file info from details.
  String? get fileId =>
      details?['file_info']?['file_id'] as String? ?? assetFileId;

  /// Get file name from details.
  String? get fileName => details?['file_info']?['file_name'] as String?;

  factory WarrantyCoverage.fromJson(Map<String, dynamic> json) {
    return WarrantyCoverage(
      id: json['id'] as String? ?? '',
      assetId: json['asset_id'] as String? ?? json['assetId'] as String? ?? '',
      companyId: json['company_id'] as String? ?? json['companyId'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      expirationInMonths: json['expiration_in_months'] as int? ??
          json['expirationInMonths'] as int?,
      pageNumber:
          json['page_number'] as int? ?? json['pageNumber'] as int?,
      assetFileId: json['asset_file_id'] as String? ??
          json['assetFileId'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      details: json['details'] as Map<String, dynamic>?,
      warrantyType:
          json['warranty_type'] as String? ?? json['warrantyType'] as String?,
      status: json['status'] as String?,
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'] as String)
          : null,
      endDate: json['end_date'] != null
          ? DateTime.parse(json['end_date'] as String)
          : null,
      registeredDate: json['registered_date'] != null
          ? DateTime.parse(json['registered_date'] as String)
          : null,
      registrationNumber: json['registration_number'] as String? ??
          json['registrationNumber'] as String?,
      providerName:
          json['provider_name'] as String? ?? json['providerName'] as String?,
      providerContact: json['provider_contact'] as String? ??
          json['providerContact'] as String?,
      providerPhone:
          json['provider_phone'] as String? ?? json['providerPhone'] as String?,
      providerEmail:
          json['provider_email'] as String? ?? json['providerEmail'] as String?,
      providerWebsite: json['provider_website'] as String? ??
          json['providerWebsite'] as String?,
      termsAndConditions: json['terms_and_conditions'] as String? ??
          json['termsAndConditions'] as String?,
      coverageItems: (json['coverage_items'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      exclusions: (json['exclusions'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      claimProcess:
          json['claim_process'] as String? ?? json['claimProcess'] as String?,
      claimRequirements: (json['claim_requirements'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      cost: (json['cost'] as num?)?.toDouble(),
      isTransferable:
          json['is_transferable'] as bool? ?? json['isTransferable'] as bool?,
      isActive: json['is_active'] as bool? ?? json['isActive'] as bool?,
      daysRemaining:
          json['days_remaining'] as int? ?? json['daysRemaining'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'asset_id': assetId,
      'company_id': companyId,
      'name': name,
      'description': description,
      'expiration_in_months': expirationInMonths,
      'page_number': pageNumber,
      'asset_file_id': assetFileId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'details': details,
      'warranty_type': warrantyType,
      'status': status,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'registered_date': registeredDate?.toIso8601String(),
      'registration_number': registrationNumber,
      'provider_name': providerName,
      'provider_contact': providerContact,
      'provider_phone': providerPhone,
      'provider_email': providerEmail,
      'provider_website': providerWebsite,
      'terms_and_conditions': termsAndConditions,
      'coverage_items': coverageItems,
      'exclusions': exclusions,
      'claim_process': claimProcess,
      'claim_requirements': claimRequirements,
      'cost': cost,
      'is_transferable': isTransferable,
      'is_active': isActive,
      'days_remaining': daysRemaining,
    };
  }

  WarrantyCoverage copyWith({
    String? id,
    String? assetId,
    String? companyId,
    String? name,
    String? description,
    int? expirationInMonths,
    int? pageNumber,
    String? assetFileId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? details,
    String? warrantyType,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? registeredDate,
    String? registrationNumber,
    String? providerName,
    String? providerContact,
    String? providerPhone,
    String? providerEmail,
    String? providerWebsite,
    String? termsAndConditions,
    List<String>? coverageItems,
    List<String>? exclusions,
    String? claimProcess,
    List<String>? claimRequirements,
    double? cost,
    bool? isTransferable,
    bool? isActive,
    int? daysRemaining,
  }) {
    return WarrantyCoverage(
      id: id ?? this.id,
      assetId: assetId ?? this.assetId,
      companyId: companyId ?? this.companyId,
      name: name ?? this.name,
      description: description ?? this.description,
      expirationInMonths: expirationInMonths ?? this.expirationInMonths,
      pageNumber: pageNumber ?? this.pageNumber,
      assetFileId: assetFileId ?? this.assetFileId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      details: details ?? this.details,
      warrantyType: warrantyType ?? this.warrantyType,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      registeredDate: registeredDate ?? this.registeredDate,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      providerName: providerName ?? this.providerName,
      providerContact: providerContact ?? this.providerContact,
      providerPhone: providerPhone ?? this.providerPhone,
      providerEmail: providerEmail ?? this.providerEmail,
      providerWebsite: providerWebsite ?? this.providerWebsite,
      termsAndConditions: termsAndConditions ?? this.termsAndConditions,
      coverageItems: coverageItems ?? this.coverageItems,
      exclusions: exclusions ?? this.exclusions,
      claimProcess: claimProcess ?? this.claimProcess,
      claimRequirements: claimRequirements ?? this.claimRequirements,
      cost: cost ?? this.cost,
      isTransferable: isTransferable ?? this.isTransferable,
      isActive: isActive ?? this.isActive,
      daysRemaining: daysRemaining ?? this.daysRemaining,
    );
  }
}
