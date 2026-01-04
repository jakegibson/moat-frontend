/// Maintenance cadence enum representing frequency of maintenance tasks.
///
/// Matches v0's MaintenanceCadence with RRULE mapping support.
enum MaintenanceCadence {
  daily,
  weekly,
  monthly,
  bimonthly,
  quarterly,
  semiannually,
  annually,
  biannually,
  triennially,
  quinquennially,
  decennially,
  occasionally,
  periodically,
  asNeeded,
  regularly,
  frequently,
  noCadence,
  afterEachUse;

  /// Get the display name for this cadence.
  String get displayName {
    switch (this) {
      case MaintenanceCadence.daily:
        return 'Daily';
      case MaintenanceCadence.weekly:
        return 'Weekly';
      case MaintenanceCadence.monthly:
        return 'Monthly';
      case MaintenanceCadence.bimonthly:
        return 'Every 2 Months';
      case MaintenanceCadence.quarterly:
        return 'Quarterly';
      case MaintenanceCadence.semiannually:
        return 'Semi-Annually';
      case MaintenanceCadence.annually:
        return 'Annually';
      case MaintenanceCadence.biannually:
        return 'Every 2 Years';
      case MaintenanceCadence.triennially:
        return 'Every 3 Years';
      case MaintenanceCadence.quinquennially:
        return 'Every 5 Years';
      case MaintenanceCadence.decennially:
        return 'Every 10 Years';
      case MaintenanceCadence.occasionally:
        return 'Occasionally';
      case MaintenanceCadence.periodically:
        return 'Periodically';
      case MaintenanceCadence.asNeeded:
        return 'As Needed';
      case MaintenanceCadence.regularly:
        return 'Regularly';
      case MaintenanceCadence.frequently:
        return 'Frequently';
      case MaintenanceCadence.noCadence:
        return 'No Cadence';
      case MaintenanceCadence.afterEachUse:
        return 'After Each Use';
    }
  }

  /// Whether this cadence can be used when creating/editing tasks.
  /// Some cadences are legacy and should migrate to asNeeded.
  bool get isSelectable {
    return this != MaintenanceCadence.occasionally &&
        this != MaintenanceCadence.regularly &&
        this != MaintenanceCadence.frequently &&
        this != MaintenanceCadence.noCadence &&
        this != MaintenanceCadence.afterEachUse;
  }

  /// Get selectable cadences for dropdowns.
  static List<MaintenanceCadence> get selectableValues {
    return MaintenanceCadence.values.where((c) => c.isSelectable).toList();
  }
}

/// Utility class for converting between MaintenanceCadence and RRULE format.
class RRuleUtils {
  RRuleUtils._();

  /// Convert a MaintenanceCadence to an RRULE string.
  /// Returns null for asNeeded or non-recurring cadences.
  static String? cadenceToRRule(MaintenanceCadence cadence, {double? cadenceInMonths}) {
    switch (cadence) {
      case MaintenanceCadence.daily:
        return 'FREQ=DAILY;INTERVAL=1';
      case MaintenanceCadence.weekly:
        return 'FREQ=WEEKLY;INTERVAL=1';
      case MaintenanceCadence.monthly:
        return 'FREQ=MONTHLY;INTERVAL=1';
      case MaintenanceCadence.bimonthly:
        return 'FREQ=MONTHLY;INTERVAL=2';
      case MaintenanceCadence.quarterly:
        return 'FREQ=MONTHLY;INTERVAL=3';
      case MaintenanceCadence.semiannually:
        return 'FREQ=MONTHLY;INTERVAL=6';
      case MaintenanceCadence.annually:
        return 'FREQ=YEARLY;INTERVAL=1';
      case MaintenanceCadence.biannually:
        return 'FREQ=YEARLY;INTERVAL=2';
      case MaintenanceCadence.triennially:
        return 'FREQ=YEARLY;INTERVAL=3';
      case MaintenanceCadence.quinquennially:
        return 'FREQ=YEARLY;INTERVAL=5';
      case MaintenanceCadence.decennially:
        return 'FREQ=YEARLY;INTERVAL=10';
      case MaintenanceCadence.periodically:
        if (cadenceInMonths != null && cadenceInMonths > 0) {
          return 'FREQ=MONTHLY;INTERVAL=${cadenceInMonths.round()}';
        }
        return null;
      case MaintenanceCadence.asNeeded:
      case MaintenanceCadence.occasionally:
      case MaintenanceCadence.regularly:
      case MaintenanceCadence.frequently:
      case MaintenanceCadence.noCadence:
      case MaintenanceCadence.afterEachUse:
        return null;
    }
  }

  /// Parse an RRULE string to a MaintenanceCadence.
  /// Returns asNeeded if the rule is null or cannot be parsed.
  static MaintenanceCadence rruleToCadence(String? rrule) {
    if (rrule == null || rrule.isEmpty) {
      return MaintenanceCadence.asNeeded;
    }

    final parts = rrule.split(';');
    String? freq;
    int interval = 1;

    for (final part in parts) {
      if (part.startsWith('FREQ=')) {
        freq = part.substring(5);
      } else if (part.startsWith('INTERVAL=')) {
        interval = int.tryParse(part.substring(9)) ?? 1;
      }
    }

    if (freq == 'DAILY' && interval == 1) {
      return MaintenanceCadence.daily;
    } else if (freq == 'WEEKLY' && interval == 1) {
      return MaintenanceCadence.weekly;
    } else if (freq == 'MONTHLY') {
      switch (interval) {
        case 1:
          return MaintenanceCadence.monthly;
        case 2:
          return MaintenanceCadence.bimonthly;
        case 3:
          return MaintenanceCadence.quarterly;
        case 6:
          return MaintenanceCadence.semiannually;
        default:
          return MaintenanceCadence.periodically;
      }
    } else if (freq == 'YEARLY') {
      switch (interval) {
        case 1:
          return MaintenanceCadence.annually;
        case 2:
          return MaintenanceCadence.biannually;
        case 3:
          return MaintenanceCadence.triennially;
        case 5:
          return MaintenanceCadence.quinquennially;
        case 10:
          return MaintenanceCadence.decennially;
        default:
          return MaintenanceCadence.periodically;
      }
    }

    return MaintenanceCadence.asNeeded;
  }

  /// Get the display name for a cadence (static method for convenience).
  static String getDisplayName(MaintenanceCadence cadence) {
    return cadence.displayName;
  }

  /// Parse interval in months from an RRULE.
  static double? getIntervalInMonths(String? rrule) {
    if (rrule == null || rrule.isEmpty) return null;

    final parts = rrule.split(';');
    String? freq;
    int interval = 1;

    for (final part in parts) {
      if (part.startsWith('FREQ=')) {
        freq = part.substring(5);
      } else if (part.startsWith('INTERVAL=')) {
        interval = int.tryParse(part.substring(9)) ?? 1;
      }
    }

    if (freq == 'DAILY') {
      return interval / 30.0;
    } else if (freq == 'WEEKLY') {
      return interval / 4.0;
    } else if (freq == 'MONTHLY') {
      return interval.toDouble();
    } else if (freq == 'YEARLY') {
      return interval * 12.0;
    }

    return null;
  }
}
