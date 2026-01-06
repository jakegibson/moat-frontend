import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../reports/data/cube_models.dart';

/// Table view for explorer results.
class ExplorerTableView extends StatelessWidget {
  final CubeResponse result;
  final List<CubeMember> measures;
  final List<CubeMember> dimensions;
  final CubeMember? timeDimension;

  const ExplorerTableView({
    super.key,
    required this.result,
    required this.measures,
    required this.dimensions,
    this.timeDimension,
  });

  @override
  Widget build(BuildContext context) {
    if (result.data.isEmpty) {
      return const Center(child: Text('No data'));
    }

    // Build column list from passed measures/dimensions,
    // falling back to inferring from result data keys
    final columns = <_ColumnDef>[];

    // Add time dimension column first
    if (timeDimension != null) {
      columns.add(_ColumnDef(
        name: timeDimension!.name,
        title: timeDimension!.displayName,
        type: ColumnType.time,
      ));
    }

    // Add dimension columns
    for (final dim in dimensions) {
      columns.add(_ColumnDef(
        name: dim.name,
        title: dim.displayName,
        type: ColumnType.dimension,
      ));
    }

    // Add measure columns
    for (final measure in measures) {
      columns.add(_ColumnDef(
        name: measure.name,
        title: measure.displayName,
        type: ColumnType.measure,
      ));
    }

    // Fallback: if no columns defined, infer from result data keys
    if (columns.isEmpty && result.data.isNotEmpty) {
      final firstRow = result.data.first;
      for (final key in firstRow.keys) {
        // Infer type from key name and value
        final value = firstRow[key];
        final isNumeric = value is num || (value != null && num.tryParse(value.toString()) != null);
        final isTime = key.contains('date') || key.contains('time') || key.contains('created') || key.contains('updated');

        columns.add(_ColumnDef(
          name: key,
          title: _formatKeyAsTitle(key),
          type: isTime ? ColumnType.time : (isNumeric ? ColumnType.measure : ColumnType.dimension),
        ));
      }
    }

    // Safety check: DataTable requires at least one column
    if (columns.isEmpty) {
      return const Center(child: Text('No columns to display'));
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLG),
        border: Border.all(color: AppColors.borderSecondary),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusLG),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(AppColors.bgSecondary),
              dataRowMinHeight: 44,
              dataRowMaxHeight: 44,
              headingRowHeight: 48,
              horizontalMargin: AppSizes.spacingLG,
              columnSpacing: AppSizes.spacingXL,
              columns: columns.map((col) {
                return DataColumn(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _getColumnColor(col.type),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        col.title,
                        style: AppTextStyles.textSMSemibold,
                      ),
                    ],
                  ),
                  numeric: col.type == ColumnType.measure,
                );
              }).toList(),
              rows: result.data.take(100).map((row) {
                return DataRow(
                  cells: columns.map((col) {
                    final value = row[col.name];
                    return DataCell(
                      Text(
                        _formatValue(value, col.type),
                        style: AppTextStyles.textSM.copyWith(
                          fontFamily:
                              col.type == ColumnType.measure ? 'monospace' : null,
                        ),
                      ),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Color _getColumnColor(ColumnType type) {
    switch (type) {
      case ColumnType.measure:
        return AppColors.utilityBlue500;
      case ColumnType.dimension:
        return AppColors.utilityGreen500;
      case ColumnType.time:
        return AppColors.utilityPurple500;
    }
  }

  /// Format a data key as a readable title (e.g., "assets_analytics.count" -> "Count")
  String _formatKeyAsTitle(String key) {
    final fieldName = key.split('.').last;
    return fieldName
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1)}'
            : '')
        .join(' ');
  }

  String _formatValue(dynamic value, ColumnType type) {
    if (value == null) return '-';

    if (type == ColumnType.time) {
      try {
        final date = DateTime.parse(value.toString());
        return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      } catch (_) {
        return value.toString();
      }
    }

    if (type == ColumnType.measure) {
      if (value is num) {
        if (value >= 1000000) {
          return '${(value / 1000000).toStringAsFixed(2)}M';
        } else if (value >= 1000) {
          return '${(value / 1000).toStringAsFixed(2)}K';
        } else if (value == value.roundToDouble()) {
          return value.round().toString();
        }
        return value.toStringAsFixed(2);
      }
      final parsed = num.tryParse(value.toString());
      if (parsed != null) {
        return _formatValue(parsed, type);
      }
    }

    return value.toString();
  }
}

enum ColumnType { measure, dimension, time }

class _ColumnDef {
  final String name;
  final String title;
  final ColumnType type;

  _ColumnDef({
    required this.name,
    required this.title,
    required this.type,
  });
}
