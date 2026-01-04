import 'package:equatable/equatable.dart';

/// Alert type for asset-related alerts.
enum AlertType {
  resolve,
  complete,
  warranty,
  maintenance,
}

/// Extension to get display values for AlertType.
extension AlertTypeExtension on AlertType {
  String get displayName {
    switch (this) {
      case AlertType.resolve:
        return 'Resolve';
      case AlertType.complete:
        return 'Complete';
      case AlertType.warranty:
        return 'Warranty';
      case AlertType.maintenance:
        return 'Maintenance';
    }
  }

  /// The action label shown in the UI.
  String get actionLabel {
    switch (this) {
      case AlertType.warranty:
      case AlertType.resolve:
        return 'Resolve';
      case AlertType.complete:
      case AlertType.maintenance:
        return 'Complete';
    }
  }
}

/// Asset alert model for warranty expirations and maintenance schedules.
class AssetAlert extends Equatable {
  final String id;
  final String name;
  final String reason;
  final AlertType type;
  final String assetId;
  final String assetName;
  final String? maintenanceId;
  final String locationId;
  final String? locationName;
  final DateTime createdAt;
  final DateTime? dueDate;
  final DateTime? expirationDate;
  final bool isExpirationAlert;
  final String? division;

  const AssetAlert({
    required this.id,
    required this.name,
    required this.reason,
    required this.type,
    required this.assetId,
    required this.assetName,
    this.maintenanceId,
    required this.locationId,
    this.locationName,
    required this.createdAt,
    this.dueDate,
    this.expirationDate,
    this.isExpirationAlert = false,
    this.division,
  });

  /// The effective due date for sorting and display.
  DateTime get alertDueDate {
    if (isExpirationAlert && expirationDate != null) {
      return expirationDate!;
    }
    return dueDate ?? createdAt;
  }

  /// The action label based on alert type.
  String get action => type.actionLabel;

  /// Check if alert is overdue.
  bool get isOverdue => alertDueDate.isBefore(DateTime.now());

  /// Days until due (negative if overdue).
  int get daysUntilDue => alertDueDate.difference(DateTime.now()).inDays;

  factory AssetAlert.fromJson(Map<String, dynamic> json) {
    return AssetAlert(
      id: json['id'] as String,
      name: json['name'] as String,
      reason: json['reason'] as String,
      type: AlertType.values.firstWhere(
        (t) => t.name == json['type'],
        orElse: () => AlertType.complete,
      ),
      assetId: json['assetId'] as String,
      assetName: json['assetName'] as String,
      maintenanceId: json['maintenanceId'] as String?,
      locationId: json['locationId'] as String,
      locationName: json['locationName'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      dueDate: json['dueDate'] != null
          ? DateTime.tryParse(json['dueDate'] as String)
          : null,
      expirationDate: json['expirationDate'] != null
          ? DateTime.tryParse(json['expirationDate'] as String)
          : null,
      isExpirationAlert: json['isExpirationAlert'] as bool? ?? false,
      division: json['division'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        reason,
        type,
        assetId,
        assetName,
        maintenanceId,
        locationId,
        locationName,
        createdAt,
        dueDate,
        expirationDate,
        isExpirationAlert,
        division,
      ];
}
