import 'package:equatable/equatable.dart';

import '../../../core/constants/divisions_of_contruction.dart';

/// Asset status values.
class AssetStatus {
  static const active = 'active';
  static const inactive = 'inactive';
  static const retired = 'retired';
  static const disposed = 'disposed';
  static const draft = 'draft';

  static const all = [active, inactive, retired, disposed, draft];

  static String displayName(String status) {
    switch (status) {
      case active:
        return 'Active';
      case inactive:
        return 'Inactive';
      case retired:
        return 'Retired';
      case disposed:
        return 'Disposed';
      case draft:
        return 'Draft';
      default:
        return status;
    }
  }
}

/// Asset process status values.
class AssetProcessStatus {
  static const processing = 'processing';
  static const completed = 'completed';
  static const failed = 'failed';
}

/// Asset model for facility asset management.
class Asset extends Equatable {
  final String id;
  final String companyId;
  final String name;
  final String status;
  final String processStatus;
  final String? technicalName;
  final String? notes;
  final String? locationId;
  final String? locationName;
  final String? floorLocation;
  final String? serviceArea;
  final String? internalId;
  final String? divisionOfConstruction;
  final String? provider;
  final String? manufacturer;
  final String? serialNumber;
  final String? modelNumber;
  final String? aiSerialNumber;
  final String? aiModelNumber;
  final double? priceValue;
  final double? purchasePrice;
  final double? aiPriceValue;
  final DateTime? startDate;
  final DateTime? substantialCompletionDate;
  final DateTime? documentDate;
  final DateTime? dueDate;
  final DateTime? installationDate;
  final DateTime? invoiceDate;
  final DateTime? purchaseDate;
  final int? warrantyDurationMonths;
  final DateTime? warrantyStartDate;
  final DateTime? warrantyEndDate;
  final DateTime? aiWarrantyStartDate;
  final bool ignoreWarrantyStartDate;
  final bool allCoveragesResolvedAndExpired;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Asset({
    required this.id,
    required this.companyId,
    required this.name,
    required this.status,
    this.processStatus = AssetProcessStatus.completed,
    this.technicalName,
    this.notes,
    this.locationId,
    this.locationName,
    this.floorLocation,
    this.serviceArea,
    this.internalId,
    this.divisionOfConstruction,
    this.provider,
    this.manufacturer,
    this.serialNumber,
    this.modelNumber,
    this.aiSerialNumber,
    this.aiModelNumber,
    this.priceValue,
    this.purchasePrice,
    this.aiPriceValue,
    this.startDate,
    this.substantialCompletionDate,
    this.documentDate,
    this.dueDate,
    this.installationDate,
    this.invoiceDate,
    this.purchaseDate,
    this.warrantyDurationMonths,
    this.warrantyStartDate,
    this.warrantyEndDate,
    this.aiWarrantyStartDate,
    this.ignoreWarrantyStartDate = false,
    this.allCoveragesResolvedAndExpired = false,
    required this.createdAt,
    required this.updatedAt,
  });

  // ============================================================================
  // Division of Construction computed properties
  // ============================================================================

  /// Returns the division number in "XX 00 00" format.
  /// e.g., "22 00 00" for Plumbing
  String? get docDivisionNumber {
    if (divisionOfConstruction == null) return null;
    final parts = divisionOfConstruction!.split(' ');
    if (parts.isEmpty) return null;
    return '${parts[0]} 00 00';
  }

  /// Returns the section number in "XX XX 00" format.
  /// e.g., "22 10 00" for Facility Water Distribution
  String? get docSectionNumber {
    if (divisionOfConstruction == null) return null;
    final parts = divisionOfConstruction!.split(' ');
    if (parts.length < 2) return null;
    return '${parts[0]} ${parts[1]} 00';
  }

  /// Returns true if the asset has a specific subsection (not "00").
  bool get hasDocSubsectionNumber {
    if (divisionOfConstruction == null) return false;
    final parts = divisionOfConstruction!.split(' ');
    return parts.length >= 3 && parts[2] != '00';
  }

  /// Returns the full subsection number.
  /// e.g., "22 10 23" for specific subsection
  String? get docSubsectionNumber => divisionOfConstruction;

  /// Returns the division name from the CSI MasterFormat lookup.
  /// e.g., "Plumbing" for division 22
  String? get docDivisionName {
    if (docDivisionNumber == null) return null;
    final key = docDivisionNumber!.split(' ').join('');
    return DivisionsOfConstruction.divisions[key] ?? 'unknown';
  }

  /// Returns the section name from the CSI MasterFormat lookup.
  /// e.g., "Facility Water Distribution" for section 22 10
  String? get docSectionName {
    if (docSectionNumber == null) return null;
    final key = docSectionNumber!.split(' ').join('');
    return DivisionsOfConstruction.divisions[key] ?? 'unknown';
  }

  /// Returns the subsection name from the CSI MasterFormat lookup.
  String? get docSubsectionName {
    if (docSubsectionNumber == null) return null;
    final key = docSubsectionNumber!.split(' ').join('');
    return DivisionsOfConstruction.divisions[key] ?? 'unknown';
  }

  /// Returns the display name for filtering, e.g., "22 Plumbing".
  String? get docFilterName {
    if (docDivisionNumber == null) return null;
    final divNum = docDivisionNumber!.substring(0, 2);
    return '$divNum $docDivisionName';
  }

  // ============================================================================
  // Status helpers
  // ============================================================================

  bool get isActive => status == AssetStatus.active;
  bool get isInactive => status == AssetStatus.inactive;
  bool get isDisposed => status == AssetStatus.disposed;
  bool get isRetired => status == AssetStatus.retired;
  bool get isProcessing => processStatus == AssetProcessStatus.processing;

  // ============================================================================
  // Warranty helpers
  // ============================================================================

  bool get hasWarranty => warrantyStartDate != null && warrantyEndDate != null;

  bool get hasLifetimeWarranty => warrantyDurationMonths == 999;

  bool get isWarrantyActive =>
      hasWarranty &&
      DateTime.now().isAfter(warrantyStartDate!) &&
      DateTime.now().isBefore(warrantyEndDate!);

  bool get isWarrantyExpired =>
      hasWarranty && DateTime.now().isAfter(warrantyEndDate!);

  int? get warrantyDaysRemaining {
    if (!hasWarranty || isWarrantyExpired) return null;
    return warrantyEndDate!.difference(DateTime.now()).inDays;
  }

  // ============================================================================
  // JSON serialization
  // ============================================================================

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'] as String,
      companyId: json['company_id'] as String? ?? json['companyId'] as String,
      name: json['name'] as String,
      status: json['status'] as String? ?? AssetStatus.active,
      processStatus: json['process_status'] as String? ??
          json['processStatus'] as String? ??
          AssetProcessStatus.completed,
      technicalName: json['technical_name'] as String? ??
          json['technicalName'] as String?,
      notes: json['notes'] as String?,
      locationId:
          json['location_id'] as String? ?? json['locationId'] as String?,
      locationName:
          json['location_name'] as String? ?? json['locationName'] as String?,
      floorLocation:
          json['floor_location'] as String? ?? json['floorLocation'] as String?,
      serviceArea:
          json['service_area'] as String? ?? json['serviceArea'] as String?,
      internalId:
          json['internal_id'] as String? ?? json['internalId'] as String?,
      divisionOfConstruction: json['division_of_construction'] as String? ??
          json['divisionOfConstruction'] as String?,
      provider: json['provider'] as String?,
      manufacturer: json['manufacturer'] as String?,
      serialNumber:
          json['serial_number'] as String? ?? json['serialNumber'] as String?,
      modelNumber:
          json['model_number'] as String? ?? json['modelNumber'] as String?,
      aiSerialNumber: json['ai_serial_number'] as String? ??
          json['aiSerialNumber'] as String?,
      aiModelNumber: json['ai_model_number'] as String? ??
          json['aiModelNumber'] as String?,
      priceValue:
          (json['price_value'] ?? json['priceValue'])?.toDouble(),
      purchasePrice:
          (json['purchase_price'] ?? json['purchasePrice'])?.toDouble(),
      aiPriceValue:
          (json['ai_price_value'] ?? json['aiPriceValue'])?.toDouble(),
      startDate: _parseDateTime(json['start_date'] ?? json['startDate']),
      substantialCompletionDate: _parseDateTime(
          json['substantial_completion_date'] ??
              json['substantialCompletionDate']),
      documentDate:
          _parseDateTime(json['document_date'] ?? json['documentDate']),
      dueDate: _parseDateTime(json['due_date'] ?? json['dueDate']),
      installationDate:
          _parseDateTime(json['installation_date'] ?? json['installationDate']),
      invoiceDate: _parseDateTime(json['invoice_date'] ?? json['invoiceDate']),
      purchaseDate:
          _parseDateTime(json['purchase_date'] ?? json['purchaseDate']),
      warrantyDurationMonths: json['warranty_duration_months'] as int? ??
          json['warrantyDurationMonths'] as int?,
      warrantyStartDate: _parseDateTime(
          json['warranty_start_date'] ?? json['warrantyStartDate']),
      warrantyEndDate:
          _parseDateTime(json['warranty_end_date'] ?? json['warrantyEndDate']),
      aiWarrantyStartDate: _parseDateTime(
          json['ai_warranty_start_date'] ?? json['aiWarrantyStartDate']),
      ignoreWarrantyStartDate: json['ignore_warranty_start_date'] as bool? ??
          json['ignoreWarrantyStartDate'] as bool? ??
          false,
      allCoveragesResolvedAndExpired:
          json['all_coverages_resolved_and_expired'] as bool? ??
              json['allCoveragesResolvedAndExpired'] as bool? ??
              false,
      createdAt: DateTime.parse(
        json['created_at'] as String? ?? json['createdAt'] as String,
      ),
      updatedAt: DateTime.parse(
        json['updated_at'] as String? ?? json['updatedAt'] as String,
      ),
    );
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'name': name,
      'status': status,
      'process_status': processStatus,
      if (technicalName != null) 'technical_name': technicalName,
      if (notes != null) 'notes': notes,
      if (locationId != null) 'location_id': locationId,
      if (locationName != null) 'location_name': locationName,
      if (floorLocation != null) 'floor_location': floorLocation,
      if (serviceArea != null) 'service_area': serviceArea,
      if (internalId != null) 'internal_id': internalId,
      if (divisionOfConstruction != null)
        'division_of_construction': divisionOfConstruction,
      if (provider != null) 'provider': provider,
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (modelNumber != null) 'model_number': modelNumber,
      if (aiSerialNumber != null) 'ai_serial_number': aiSerialNumber,
      if (aiModelNumber != null) 'ai_model_number': aiModelNumber,
      if (priceValue != null) 'price_value': priceValue,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (aiPriceValue != null) 'ai_price_value': aiPriceValue,
      if (startDate != null) 'start_date': startDate!.toIso8601String(),
      if (substantialCompletionDate != null)
        'substantial_completion_date':
            substantialCompletionDate!.toIso8601String(),
      if (documentDate != null)
        'document_date': documentDate!.toIso8601String(),
      if (dueDate != null) 'due_date': dueDate!.toIso8601String(),
      if (installationDate != null)
        'installation_date': installationDate!.toIso8601String(),
      if (invoiceDate != null) 'invoice_date': invoiceDate!.toIso8601String(),
      if (purchaseDate != null)
        'purchase_date': purchaseDate!.toIso8601String(),
      if (warrantyDurationMonths != null)
        'warranty_duration_months': warrantyDurationMonths,
      if (warrantyStartDate != null)
        'warranty_start_date': warrantyStartDate!.toIso8601String(),
      if (warrantyEndDate != null)
        'warranty_end_date': warrantyEndDate!.toIso8601String(),
      if (aiWarrantyStartDate != null)
        'ai_warranty_start_date': aiWarrantyStartDate!.toIso8601String(),
      'ignore_warranty_start_date': ignoreWarrantyStartDate,
      'all_coverages_resolved_and_expired': allCoveragesResolvedAndExpired,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // ============================================================================
  // copyWith
  // ============================================================================

  Asset copyWith({
    String? id,
    String? companyId,
    String? name,
    String? status,
    String? processStatus,
    String? technicalName,
    String? notes,
    String? locationId,
    String? locationName,
    String? floorLocation,
    String? serviceArea,
    String? internalId,
    String? divisionOfConstruction,
    String? provider,
    String? manufacturer,
    String? serialNumber,
    String? modelNumber,
    String? aiSerialNumber,
    String? aiModelNumber,
    double? priceValue,
    double? purchasePrice,
    double? aiPriceValue,
    DateTime? startDate,
    DateTime? substantialCompletionDate,
    DateTime? documentDate,
    DateTime? dueDate,
    DateTime? installationDate,
    DateTime? invoiceDate,
    DateTime? purchaseDate,
    int? warrantyDurationMonths,
    DateTime? warrantyStartDate,
    DateTime? warrantyEndDate,
    DateTime? aiWarrantyStartDate,
    bool? ignoreWarrantyStartDate,
    bool? allCoveragesResolvedAndExpired,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Asset(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      name: name ?? this.name,
      status: status ?? this.status,
      processStatus: processStatus ?? this.processStatus,
      technicalName: technicalName ?? this.technicalName,
      notes: notes ?? this.notes,
      locationId: locationId ?? this.locationId,
      locationName: locationName ?? this.locationName,
      floorLocation: floorLocation ?? this.floorLocation,
      serviceArea: serviceArea ?? this.serviceArea,
      internalId: internalId ?? this.internalId,
      divisionOfConstruction:
          divisionOfConstruction ?? this.divisionOfConstruction,
      provider: provider ?? this.provider,
      manufacturer: manufacturer ?? this.manufacturer,
      serialNumber: serialNumber ?? this.serialNumber,
      modelNumber: modelNumber ?? this.modelNumber,
      aiSerialNumber: aiSerialNumber ?? this.aiSerialNumber,
      aiModelNumber: aiModelNumber ?? this.aiModelNumber,
      priceValue: priceValue ?? this.priceValue,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      aiPriceValue: aiPriceValue ?? this.aiPriceValue,
      startDate: startDate ?? this.startDate,
      substantialCompletionDate:
          substantialCompletionDate ?? this.substantialCompletionDate,
      documentDate: documentDate ?? this.documentDate,
      dueDate: dueDate ?? this.dueDate,
      installationDate: installationDate ?? this.installationDate,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      warrantyDurationMonths:
          warrantyDurationMonths ?? this.warrantyDurationMonths,
      warrantyStartDate: warrantyStartDate ?? this.warrantyStartDate,
      warrantyEndDate: warrantyEndDate ?? this.warrantyEndDate,
      aiWarrantyStartDate: aiWarrantyStartDate ?? this.aiWarrantyStartDate,
      ignoreWarrantyStartDate:
          ignoreWarrantyStartDate ?? this.ignoreWarrantyStartDate,
      allCoveragesResolvedAndExpired:
          allCoveragesResolvedAndExpired ?? this.allCoveragesResolvedAndExpired,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        companyId,
        name,
        status,
        processStatus,
        technicalName,
        notes,
        locationId,
        locationName,
        floorLocation,
        serviceArea,
        internalId,
        divisionOfConstruction,
        provider,
        manufacturer,
        serialNumber,
        modelNumber,
        aiSerialNumber,
        aiModelNumber,
        priceValue,
        purchasePrice,
        aiPriceValue,
        startDate,
        substantialCompletionDate,
        documentDate,
        dueDate,
        installationDate,
        invoiceDate,
        purchaseDate,
        warrantyDurationMonths,
        warrantyStartDate,
        warrantyEndDate,
        aiWarrantyStartDate,
        ignoreWarrantyStartDate,
        allCoveragesResolvedAndExpired,
        createdAt,
        updatedAt,
      ];
}

/// Paginated response for assets list.
class PaginatedAssets {
  final List<Asset> items;
  final int total;
  final int limit;
  final int offset;

  const PaginatedAssets({
    required this.items,
    required this.total,
    required this.limit,
    required this.offset,
  });

  int get currentPage => (offset / limit).floor() + 1;
  int get totalPages => (total / limit).ceil();
  bool get hasNextPage => currentPage < totalPages;
  bool get hasPreviousPage => currentPage > 1;
}

/// Asset message model for document chat Q&A.
class AssetMessage extends Equatable {
  final String id;
  final String assetId;
  final String prompt;
  final String? response;
  final DateTime createdAt;

  const AssetMessage({
    required this.id,
    required this.assetId,
    required this.prompt,
    this.response,
    required this.createdAt,
  });

  /// Whether this message is still awaiting AI response.
  bool get isLoading => response == null;

  @override
  List<Object?> get props => [id, assetId, prompt, response, createdAt];
}

/// Asset file model for uploaded documents (PDFs, manuals, warranties).
class AssetFile extends Equatable {
  final String id;
  final String assetId;
  final String fileName;
  final String contentType;
  final int sizeBytes;
  final String url;
  final String? caption;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AssetFile({
    required this.id,
    required this.assetId,
    required this.fileName,
    required this.contentType,
    required this.sizeBytes,
    required this.url,
    this.caption,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Whether this file is a PDF document.
  bool get isPdf => contentType == 'application/pdf';

  /// Whether this file is an image.
  bool get isImage => contentType.startsWith('image/');

  /// File extension from the filename.
  String get extension {
    final dotIndex = fileName.lastIndexOf('.');
    return dotIndex != -1 ? fileName.substring(dotIndex + 1).toLowerCase() : '';
  }

  /// Display-friendly file size.
  String get sizeDisplay {
    if (sizeBytes < 1024) return '$sizeBytes B';
    if (sizeBytes < 1024 * 1024) return '${(sizeBytes / 1024).toStringAsFixed(1)} KB';
    return '${(sizeBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  @override
  List<Object?> get props => [
        id,
        assetId,
        fileName,
        contentType,
        sizeBytes,
        url,
        caption,
        createdAt,
        updatedAt,
      ];
}
