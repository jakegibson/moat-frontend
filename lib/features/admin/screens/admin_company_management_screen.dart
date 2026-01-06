import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../../../gen/moat/v1/admin.pb.dart' as admin;
import '../state/admin_state.dart';

/// Admin: Company Management screen with company summaries.
class AdminCompanyManagementScreen extends StatefulWidget {
  const AdminCompanyManagementScreen({super.key});

  @override
  State<AdminCompanyManagementScreen> createState() =>
      _AdminCompanyManagementScreenState();
}

class _AdminCompanyManagementScreenState
    extends State<AdminCompanyManagementScreen> {
  late final AdminState _state;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _state.fetchCompanySummaries();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _search(String query) {
    _state.fetchCompanySummaries(search: query.isEmpty ? null : query);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            title: 'Company Management',
            subtitle: 'View and manage company accounts.',
          ),
          const SizedBox(height: SemanticSpacing.section),
          // Search bar
          SizedBox(
            width: 320,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search companies...',
                prefixIcon: const Icon(Icons.search, size: 20),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          _search('');
                        },
                      )
                    : null,
                isDense: true,
              ),
              onChanged: _search,
            ),
          ),
          const SizedBox(height: SemanticSpacing.normal),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingSystemStats.value &&
                  _state.companySummaries.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              final companies = _state.companySummaries.value;

              if (companies.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business_outlined,
                        size: 64,
                        color: SemanticColors.textTertiary,
                      ),
                      const SizedBox(height: SemanticSpacing.normal),
                      Text(
                        'No companies found',
                        style: Semantic.body.copyWith(
                          color: SemanticColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Container(
                decoration: BoxDecoration(
                  color: SemanticColors.bgCard,
                  border: Border.all(color: SemanticColors.border),
                  borderRadius: BorderRadius.circular(SemanticRadius.card),
                ),
                child: Column(
                  children: [
                    // Table header
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: SemanticSpacing.cardPadding,
                        vertical: SemanticSpacing.normal,
                      ),
                      decoration: BoxDecoration(
                        color: SemanticColors.bgSecondary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(SemanticRadius.card),
                          topRight: Radius.circular(SemanticRadius.card),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child:
                                Text('Company Name', style: Semantic.tableHeader),
                          ),
                          Expanded(
                            child: Text('Members', style: Semantic.tableHeader),
                          ),
                          Expanded(
                            child: Text('Assets', style: Semantic.tableHeader),
                          ),
                          Expanded(
                            child: Text('Locations', style: Semantic.tableHeader),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    // Table body
                    Expanded(
                      child: ListView.separated(
                        itemCount: companies.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final company = companies[index];
                          return _CompanyRow(company: company);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _CompanyRow extends StatelessWidget {
  final admin.CompanySummary company;

  const _CompanyRow({required this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SemanticSpacing.cardPadding,
        vertical: SemanticSpacing.normal,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: SemanticColors.bgSecondary,
                    borderRadius: BorderRadius.circular(SemanticRadius.small),
                  ),
                  child: Icon(
                    Icons.business,
                    size: 20,
                    color: SemanticColors.textSecondary,
                  ),
                ),
                const SizedBox(width: SemanticSpacing.normal),
                Expanded(
                  child: Text(
                    company.companyName,
                    style: Semantic.body,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              company.memberCount.toString(),
              style: Semantic.body,
            ),
          ),
          Expanded(
            child: Text(
              company.assetCount.toString(),
              style: Semantic.body,
            ),
          ),
          Expanded(
            child: Text(
              company.locationCount.toString(),
              style: Semantic.body,
            ),
          ),
        ],
      ),
    );
  }
}
