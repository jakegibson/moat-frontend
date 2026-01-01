import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/page_header.dart';
import '../../../common_widgets/rounded_action_button.dart';
import '../../../core/di/injection.dart';
import '../../../core/routing/routes.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../data/task_models.dart';
import '../state/task_state.dart';
import '../widgets/assignee_table_card.dart';
import '../widgets/filter_search_bar.dart';
import '../widgets/mobile_ticket_card.dart';
import '../widgets/ticket_filter_bar.dart';
import '../widgets/ticket_status_badge.dart';
import '../widgets/tickets_stat_card.dart';
import '../widgets/time_in_queue_bar.dart';
import '../widgets/type_badge.dart';
import 'create_ticket_drawer.dart';

class TicketListScreen extends StatefulWidget {
  const TicketListScreen({super.key});

  @override
  State<TicketListScreen> createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  late final TaskState _state;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _state = getIt<TaskState>();
    _state.fetchTasks(refresh: true);
    _state.fetchMetrics();
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
      _state.loadMore();
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
                  _state.applyFilters(search: query);
                },
                initialValue: _state.searchQuery.value,
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
              value: _state.metricsTotal.value.toDouble(),
              changeValue: _state.metricsTotalLastMonth.value.toDouble(),
              chartValues: _state.weeklyOpenTickets.value,
            ),
          ),
          SizedBox(width: AppSizes.spacingLG),
          Expanded(
            child: TicketsStatCard(
              title: 'Ave Time to Close',
              value: _state.metricsAvgTimeToClose.value > 0
                  ? _state.metricsAvgTimeToClose.value / 24
                  : null,
              valueLabel: 'days',
              decimalPlaces: 1,
              changeValue: _state.metricsTimeToCloseChange.value ?? 0,
              chartValues: _state.weeklyTimeToClose.value,
            ),
          ),
          SizedBox(width: AppSizes.spacingLG),
          Expanded(
            child: TicketsStatCard(
              title: 'Ave Response Time',
              value: _state.metricsAvgResponseTime.value > 0
                  ? _state.metricsAvgResponseTime.value
                  : null,
              valueLabel: 'hours',
              changeValue: _state.metricsResponseTimeChange.value ?? 0,
              chartValues: _state.weeklyResponseTimes.value,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    return Watch((context) {
      final tasks = _state.tasks.value;
      final isLoading = _state.isLoading.value;
      final error = _state.error.value;

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
                onPressed: () => _state.fetchTasks(refresh: true),
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
                  value: _state.metricsTotal.value.toDouble(),
                  changeValue: _state.metricsTotalLastMonth.value.toDouble(),
                  width: 240.0,
                ),
                SizedBox(width: AppSizes.spacingLG),
                TicketsStatCard(
                  title: 'Ave Time to Close',
                  value: _state.metricsAvgTimeToClose.value > 0
                      ? _state.metricsAvgTimeToClose.value / 24
                      : null,
                  valueLabel: 'days',
                  decimalPlaces: 1,
                  changeValue: _state.metricsTimeToCloseChange.value ?? 0,
                  width: 240.0,
                ),
                SizedBox(width: AppSizes.spacingLG),
                TicketsStatCard(
                  title: 'Ave Response Time',
                  value: _state.metricsAvgResponseTime.value > 0
                      ? _state.metricsAvgResponseTime.value
                      : null,
                  valueLabel: 'hours',
                  changeValue: _state.metricsResponseTimeChange.value ?? 0,
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
                onTap: () => context.goToTicket(task.externalId ?? task.id),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopContent(List<TaskWithDetails> tasks, bool isLoading) {
    final today = DateTime.now();

    return Column(
      children: [
        Expanded(
          child: DataTable2(
            scrollController: _scrollController,
            columnSpacing: 12,
            horizontalMargin: AppSizes.spacingXL,
            minWidth: 900,
            dividerThickness: 0,
            headingRowHeight: 48,
            dataRowHeight: 72,
            headingRowColor: WidgetStateProperty.all(AppColors.bgSecondary),
            columns: [
              DataColumn2(
                label: Text('Ticket', style: AppTextStyles.textSMSemibold),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('Type', style: AppTextStyles.textSMSemibold),
                size: ColumnSize.S,
              ),
              DataColumn2(
                label: Text('Status', style: AppTextStyles.textSMSemibold),
                size: ColumnSize.S,
              ),
              DataColumn2(
                label: Text('Location', style: AppTextStyles.textSMSemibold),
                size: ColumnSize.M,
              ),
              DataColumn2(
                label: Text('Due Date', style: AppTextStyles.textSMSemibold),
                size: ColumnSize.S,
              ),
              DataColumn2(
                label: Text('Time in Queue', style: AppTextStyles.textSMSemibold),
                size: ColumnSize.M,
              ),
              DataColumn2(
                label: Text('Assignee', style: AppTextStyles.textSMSemibold),
                size: ColumnSize.M,
              ),
            ],
            rows: [
              ...tasks.map((task) {
                return DataRow2(
                  onTap: () => context.goToTicket(task.externalId ?? task.id),
                  cells: [
                    // Ticket ID and Title
                    DataCell(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            task.externalId ?? task.id.substring(0, 8),
                            style: AppTextStyles.textSMSemibold,
                          ),
                          Text(
                            task.title ?? 'Untitled',
                            style: AppTextStyles.textSMSecondary,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // Type Badge
                    DataCell(
                      TypeBadge(type: task.taskType),
                    ),
                    // Status
                    DataCell(
                      TicketStatusBadge(status: task.status),
                    ),
                    // Location
                    DataCell(
                      Text(
                        task.locationName ?? '-',
                        style: AppTextStyles.textSMSecondary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Due Date
                    DataCell(
                      Text(
                        task.dueDate != null
                            ? DateFormatter.formatFriendlyDate(
                                dateTime: task.dueDate!,
                                short: true,
                              )
                            : '-',
                        style: AppTextStyles.textSMSecondary,
                      ),
                    ),
                    // Time in Queue
                    DataCell(
                      SizedBox(
                        width: 120,
                        child: TimeInQueueBar(
                          scheduledDate: task.scheduledDate,
                          today: today,
                        ),
                      ),
                    ),
                    // Assignee
                    DataCell(
                      AssigneeTableCard(
                        name: task.assigneeName,
                        jobTitle: null,
                        photoUrl: null,
                      ),
                    ),
                  ],
                );
              }),
              if (isLoading)
                DataRow2(
                  cells: List.generate(
                    7,
                    (index) => DataCell(
                      index == 3
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
      ],
    );
  }

  Future<void> _handleCreateTicket() async {
    final result = await CreateTicketDrawer.show(context);
    if (result == true) {
      _state.fetchTasks(refresh: true);
    }
  }
}
