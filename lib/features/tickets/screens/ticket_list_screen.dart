import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/page_header.dart';
import '../../../common_widgets/rounded_action_button.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../data/task_models.dart';
import '../state/task_list_state.dart';
import '../state/task_metrics_state.dart';
import '../widgets/assignee_table_card.dart';
import '../widgets/filter_search_bar.dart';
import '../widgets/mobile_ticket_card.dart';
import '../widgets/ticket_filter_bar.dart';
import '../widgets/tickets_stat_card.dart';
import '../widgets/time_in_queue_bar.dart';
import '../widgets/type_badge.dart';
import 'create_ticket_drawer.dart';
import 'ticket_detail_drawer.dart';

class TicketListScreen extends StatefulWidget {
  const TicketListScreen({super.key});

  @override
  State<TicketListScreen> createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  late final TaskListState _listState;
  late final TaskMetricsState _metricsState;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _listState = getIt<TaskListState>();
    _metricsState = getIt<TaskMetricsState>();
    _listState.fetchTasks(refresh: true);
    _metricsState.fetchMetrics();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _listState.loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppSizes.mobileScreenWidth;

    return Scaffold(
      backgroundColor: isMobile ? AppColors.bgSecondary : AppColors.white,
      body: Column(
        children: [
          // Page Header with Search and Filter Bar
          Container(
            color: AppColors.white,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? AppSizes.spacingLG : AppSizes.spacingXL,
            ),
            child: PageHeader(
              title: 'Open Tickets',
              subtitle:
                  'View and allocate service requests, preventative maintenance tasks and warranty expirations to your team members.',
              showSearchBar: true,
              actions: [
                RoundedActionButton(
                  leading: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  onPressed: _handleCreateTicket,
                  text: 'Add Ticket',
                  backgroundColor: AppColors.accentButton,
                  textStyle: AppTextStyles.textSMSemiboldWhite,
                  mobileOnlyIcon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ],
              actionBar: const TicketFilterBar(),
              middleWidget: !isMobile ? _buildStatCardsRow() : null,
              searchWidget: FilterSearchBar(
                onSearch: (query) {
                  _listState.applyFilters(search: query);
                },
                initialValue: _listState.searchQuery.value,
              ),
            ),
          ),
          // Content
          Expanded(
            child: _buildContent(context, isMobile),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCardsRow() {
    return Watch((context) {
      return Row(
        children: [
          Expanded(
            child: TicketsStatCard(
              title: 'Total Tickets',
              value: _metricsState.total.value.toDouble(),
              changeValue: _metricsState.totalLastMonth.value.toDouble(),
              chartValues: _metricsState.weeklyOpenTickets.value,
            ),
          ),
          SizedBox(width: AppSizes.spacingXL), // 16px per Figma
          Expanded(
            child: TicketsStatCard(
              title: 'Ave Time to Close',
              value: _metricsState.avgTimeToClose.value > 0
                  ? _metricsState.avgTimeToClose.value / 24
                  : null,
              valueLabel: 'days',
              decimalPlaces: 1,
              changeValue: _metricsState.timeToCloseChange.value ?? 0,
              chartValues: _metricsState.weeklyTimeToClose.value,
            ),
          ),
          SizedBox(width: AppSizes.spacingXL), // 16px per Figma
          Expanded(
            child: TicketsStatCard(
              title: 'Ave Response Time',
              value: _metricsState.avgResponseTime.value > 0
                  ? _metricsState.avgResponseTime.value
                  : null,
              valueLabel: 'hours',
              changeValue: _metricsState.responseTimeChange.value ?? 0,
              chartValues: _metricsState.weeklyResponseTimes.value,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    return Watch((context) {
      final tasks = _listState.tasks.value;
      final isLoading = _listState.isLoading.value;
      final error = _listState.error.value;

      if (error != null && tasks.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: AppColors.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading Tickets',
                style: AppTextStyles.text2XLSemibold,
              ),
              const SizedBox(height: 8),
              Text(error.message, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              RoundedActionButton(
                onPressed: () => _listState.fetchTasks(refresh: true),
                text: 'Retry',
                backgroundColor: AppColors.accentButton,
                textStyle: AppTextStyles.textSMSemiboldWhite,
              ),
            ],
          ),
        );
      }

      if (tasks.isEmpty && isLoading) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentButton),
          ),
        );
      }

      if (tasks.isEmpty) {
        return Center(
          child: Text(
            'No matching tickets found',
            style: AppTextStyles.textMDTertiary,
          ),
        );
      }

      if (isMobile) {
        return _buildMobileContent(tasks, isLoading);
      }

      return _buildDesktopContent(tasks, isLoading);
    });
  }

  Widget _buildMobileContent(List<TaskWithDetails> tasks, bool isLoading) {
    return Column(
      children: [
        // Horizontal scrolling stat cards
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(AppSizes.spacing2XL),
          child: Watch((context) {
            return Row(
              children: [
                TicketsStatCard(
                  title: 'Total Tickets',
                  value: _metricsState.total.value.toDouble(),
                  changeValue: _metricsState.totalLastMonth.value.toDouble(),
                  width: 240.0,
                ),
                SizedBox(width: AppSizes.spacingLG),
                TicketsStatCard(
                  title: 'Ave Time to Close',
                  value: _metricsState.avgTimeToClose.value > 0
                      ? _metricsState.avgTimeToClose.value / 24
                      : null,
                  valueLabel: 'days',
                  decimalPlaces: 1,
                  changeValue: _metricsState.timeToCloseChange.value ?? 0,
                  width: 240.0,
                ),
                SizedBox(width: AppSizes.spacingLG),
                TicketsStatCard(
                  title: 'Ave Response Time',
                  value: _metricsState.avgResponseTime.value > 0
                      ? _metricsState.avgResponseTime.value
                      : null,
                  valueLabel: 'hours',
                  changeValue: _metricsState.responseTimeChange.value ?? 0,
                  width: 240.0,
                ),
              ],
            );
          }),
        ),
        // Ticket list
        Expanded(
          child: ListView.separated(
            controller: _scrollController,
            padding: EdgeInsets.only(
              bottom: AppSizes.spacing2XL,
              left: AppSizes.spacing2XL,
              right: AppSizes.spacing2XL,
            ),
            itemCount: tasks.length + (isLoading ? 1 : 0),
            separatorBuilder: (context, index) =>
                SizedBox(height: AppSizes.spacingMD),
            itemBuilder: (context, index) {
              if (index == tasks.length) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.spacingMD),
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.accentButton),
                    ),
                  ),
                );
              }

              final task = tasks[index];
              return MobileTicketCard(
                task: task,
                onTap: () => _handleOpenTicket(task.externalId ?? task.id),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopContent(List<TaskWithDetails> tasks, bool isLoading) {
    final today = DateTime.now();
    final totalPages = (_listState.totalCount.value / 25).ceil();
    final currentPage = (_listState.currentOffset.value / 25).floor() + 1;

    return Padding(
      padding: EdgeInsets.all(AppSizes.spacing4XL),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusLG),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.radiusLG),
            border: Border.all(
              color: AppColors.borderSecondary,
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0x0D0A0D12), // Figma: shadow-xs
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              // Table
              Expanded(
                child: DataTable2(
                  scrollController: _scrollController,
                  columnSpacing: 12,
                  horizontalMargin: AppSizes.spacing3XL,
                  minWidth: 900,
                  dividerThickness: 0,
                  headingRowHeight: 44,
                  dataRowHeight: AppSizes.tableRowHeight, // 64px per Figma
                  headingRowColor: WidgetStateProperty.all(AppColors.bgSecondary),
                  headingTextStyle: AppTextStyles.textXSSemibold,
                  border: TableBorder(
                    horizontalInside: BorderSide(
                      color: AppColors.borderSecondary,
                      width: 1.0,
                    ),
                  ),
                  columns: [
                  DataColumn2(
                    label: _buildColumnHeader('Task', sortable: true),
                    size: ColumnSize.L,
                    onSort: (columnIndex, ascending) => _handleSort('title', ascending),
                  ),
                  DataColumn2(
                    label: _buildColumnHeader('Location', sortable: true),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) => _handleSort('location', ascending),
                  ),
                  DataColumn2(
                    label: _buildColumnHeader('Type', sortable: true),
                    size: ColumnSize.S,
                    onSort: (columnIndex, ascending) => _handleSort('taskType', ascending),
                  ),
                  DataColumn2(
                    label: _buildColumnHeader('Assignee', sortable: true),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) => _handleSort('assignee', ascending),
                  ),
                  DataColumn2(
                    label: _buildColumnHeader('Time in Queue', sortable: true),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) => _handleSort('scheduledDate', ascending),
                  ),
                ],
                rows: [
                    ...tasks.map((task) {
                      return DataRow2(
                        onTap: () => _handleOpenTicket(task.externalId ?? task.id),
                        cells: [
                          // Task: Title + Description
                          DataCell(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  task.title,
                                  style: AppTextStyles.textSMMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  task.description ?? '',
                                  style: AppTextStyles.textSMTertiary,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          // Location + Sublocation
                          DataCell(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  task.locationName ?? '-',
                                  style: AppTextStyles.textSMMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (task.specificLocation != null)
                                  Text(
                                    task.specificLocation!,
                                    style: AppTextStyles.textSMTertiary,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              ],
                            ),
                          ),
                          // Type Badge
                          DataCell(TypeBadge(type: task.taskType)),
                          // Assignee
                          DataCell(
                            AssigneeTableCard(
                              name: task.assigneeName,
                              jobTitle: null,
                              photoUrl: null,
                            ),
                          ),
                          // Time in Queue
                          DataCell(
                            SizedBox(
                              width: 140,
                              child: TimeInQueueBar(
                                scheduledDate: task.scheduledDate,
                                today: today,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    if (isLoading)
                      DataRow2(
                        cells: List.generate(
                          5,
                          (index) => DataCell(
                            index == 2
                                ? Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.accentButton,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            // Pagination
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.spacing3XL,
                vertical: AppSizes.spacingLG,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.borderSecondary),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous button
                  _buildPaginationButton(
                    label: 'Previous',
                    icon: Icons.arrow_back,
                    onPressed: currentPage > 1
                        ? () => _listState.goToPage(currentPage - 1)
                        : null,
                  ),
                  // Page numbers
                  Row(
                    children: _buildPageNumbers(currentPage, totalPages),
                  ),
                  // Next button
                  _buildPaginationButton(
                    label: 'Next',
                    icon: Icons.arrow_forward,
                    iconAfter: true,
                    onPressed: currentPage < totalPages
                        ? () => _listState.goToPage(currentPage + 1)
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  Widget _buildPaginationButton({
    required String label,
    required IconData icon,
    bool iconAfter = false,
    VoidCallback? onPressed,
  }) {
    final isDisabled = onPressed == null;
    final color = isDisabled ? AppColors.fgQuaternary : AppColors.textPrimary;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.spacingLG,
          vertical: AppSizes.spacingMD,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderSecondary),
          borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!iconAfter) ...[
              Icon(icon, size: 16, color: color),
              SizedBox(width: AppSizes.spacingXS),
            ],
            Text(
              label,
              style: AppTextStyles.textSMSemibold.copyWith(color: color),
            ),
            if (iconAfter) ...[
              SizedBox(width: AppSizes.spacingXS),
              Icon(icon, size: 16, color: color),
            ],
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageNumbers(int currentPage, int totalPages) {
    final pages = <Widget>[];
    final maxVisiblePages = 7;

    int startPage = 1;
    int endPage = totalPages;

    if (totalPages > maxVisiblePages) {
      startPage = (currentPage - 3).clamp(1, totalPages - maxVisiblePages + 1);
      endPage = (startPage + maxVisiblePages - 1).clamp(maxVisiblePages, totalPages);
    }

    for (int i = startPage; i <= endPage; i++) {
      final isCurrentPage = i == currentPage;
      pages.add(
        InkWell(
          onTap: isCurrentPage ? null : () => _listState.goToPage(i),
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isCurrentPage ? AppColors.bgSecondary : Colors.transparent,
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            ),
            child: Text(
              '$i',
              style: AppTextStyles.textSMMedium.copyWith(
                color: isCurrentPage
                    ? AppColors.textSecondary
                    : AppColors.textTertiary,
              ),
            ),
          ),
        ),
      );
    }

    return pages;
  }

  /// Build column header with sort indicator - matches v0 style
  Widget _buildColumnHeader(String label, {bool sortable = false}) {
    final isCurrentSort = _listState.sortBy.value == _getSortField(label);
    final isAscending = _listState.sortOrder.value == 'asc';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStyles.textXSSemibold,
        ),
        if (sortable) ...[
          const SizedBox(width: 4),
          Icon(
            isCurrentSort
                ? (isAscending ? Icons.arrow_drop_up : Icons.arrow_drop_down)
                : Icons.arrow_drop_down,
            size: 18,
            color: isCurrentSort ? AppColors.black : AppColors.gray,
          ),
        ],
      ],
    );
  }

  String _getSortField(String label) {
    switch (label) {
      case 'Task':
        return 'title';
      case 'Location':
        return 'location';
      case 'Type':
        return 'taskType';
      case 'Assignee':
        return 'assignee';
      case 'Time in Queue':
        return 'scheduledDate';
      default:
        return '';
    }
  }

  void _handleSort(String field, bool ascending) {
    _listState.applyFilters(
      sort: field,
      order: ascending ? 'asc' : 'desc',
    );
  }

  Future<void> _handleCreateTicket() async {
    final result = await CreateTicketDrawer.show(context);
    if (result == true) {
      _listState.fetchTasks(refresh: true);
    }
  }

  Future<void> _handleOpenTicket(String externalId) async {
    final result = await TicketDetailDrawer.show(context, externalId);
    if (result == true) {
      _listState.fetchTasks(refresh: true);
    }
  }
}
