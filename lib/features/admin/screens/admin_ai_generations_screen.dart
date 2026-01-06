import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../data/admin_client.dart' show Generation;
import '../state/admin_state.dart';

/// Admin: AI Generations history screen.
class AdminAIGenerationsScreen extends StatefulWidget {
  const AdminAIGenerationsScreen({super.key});

  @override
  State<AdminAIGenerationsScreen> createState() =>
      _AdminAIGenerationsScreenState();
}

class _AdminAIGenerationsScreenState extends State<AdminAIGenerationsScreen> {
  late final AdminState _state;
  bool? _successFilter;

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _state.fetchGenerations();
  }

  void _setFilter(bool? success) {
    setState(() => _successFilter = success);
    _state.fetchGenerations(success: success, refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'AI Generations',
            subtitle: 'View AI generation history and usage.',
            actions: [
              AppButton(
                label: 'Refresh',
                onPressed: () =>
                    _state.fetchGenerations(success: _successFilter, refresh: true),
                isFullWidth: false,
                icon: const Icon(Icons.refresh, size: 18),
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          _buildFilters(),
          const SizedBox(height: SemanticSpacing.normal),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingGenerations.value &&
                  _state.generations.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              final gens = _state.generations.value;
              if (gens.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.auto_awesome,
                          size: 64, color: AppColors.textTertiary),
                      const SizedBox(height: SemanticSpacing.section),
                      Text('No generations found', style: Semantic.cardTitle),
                    ],
                  ),
                );
              }

              return ListView.separated(
                itemCount: gens.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: SemanticSpacing.normal),
                itemBuilder: (context, index) {
                  return GenerationCard(generation: gens[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Wrap(
      spacing: SemanticSpacing.tight,
      children: [
        FilterChip(
          label: const Text('All'),
          selected: _successFilter == null,
          onSelected: (_) => _setFilter(null),
        ),
        FilterChip(
          label: const Text('Successful'),
          selected: _successFilter == true,
          onSelected: (_) => _setFilter(true),
        ),
        FilterChip(
          label: const Text('Failed'),
          selected: _successFilter == false,
          onSelected: (_) => _setFilter(false),
        ),
      ],
    );
  }
}

/// Card displaying a single AI generation
class GenerationCard extends StatelessWidget {
  final Generation generation;

  const GenerationCard({super.key, required this.generation});

  @override
  Widget build(BuildContext context) {
    final statusColor =
        generation.success ? SemanticColors.success : SemanticColors.error;

    return Container(
      padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
      decoration: BoxDecoration(
        color: SemanticColors.bgCard,
        border: Border.all(color: SemanticColors.border),
        borderRadius: BorderRadius.circular(SemanticRadius.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: SemanticSpacing.tight),
              Expanded(
                child: Text(
                  generation.generationType.isNotEmpty
                      ? generation.generationType
                      : 'Unknown Type',
                  style: Semantic.formLabel,
                ),
              ),
              if (generation.createdAt != null)
                Text(
                  _formatTime(generation.createdAt!),
                  style: Semantic.caption,
                ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.tight),
          Row(
            children: [
              Text(
                generation.success ? 'Success' : 'Failed',
                style: Semantic.badge.copyWith(color: statusColor),
              ),
              const Spacer(),
              if (generation.tokens != null)
                Text('${generation.tokens!.total} tokens',
                    style: Semantic.caption),
              if (generation.latencyMs > 0) ...[
                const SizedBox(width: SemanticSpacing.normal),
                Text('${generation.latencyMs}ms', style: Semantic.caption),
              ],
            ],
          ),
          if (generation.error != null && generation.error!.isNotEmpty) ...[
            const SizedBox(height: SemanticSpacing.tight),
            Container(
              padding: const EdgeInsets.all(SemanticSpacing.tight),
              decoration: BoxDecoration(
                color: SemanticColors.errorBg,
                borderRadius: BorderRadius.circular(SemanticRadius.normal),
              ),
              child: Text(
                generation.error!,
                style: Semantic.caption.copyWith(color: SemanticColors.error),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else {
      return '${diff.inDays}d ago';
    }
  }
}
