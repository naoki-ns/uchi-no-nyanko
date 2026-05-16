import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/cat_animation_state.dart';
import '../../../shared/utils/cat_personality.dart';
import '../../../shared/widgets/animated_cat_widget.dart';
import '../../cat/providers/cat_providers.dart';
import '../../cat/view/widgets/cat_status_card.dart';
import '../../cat/view/widgets/personality_bar.dart';
import '../providers/catbook_providers.dart';

class CatbookDetailScreen extends ConsumerWidget {
  const CatbookDetailScreen({super.key, required this.catId});

  final String catId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catAsync = ref.watch(catDetailProvider(catId));
    final countAsync = ref.watch(catInteractionCountProvider(catId));
    final lastCareAsync = ref.watch(catLastCareProvider(catId));

    return Scaffold(
      appBar: AppBar(
        title: catAsync.maybeWhen(
          data: (cat) => Text(cat?.name ?? '猫の詳細'),
          orElse: () => const Text('猫の詳細'),
        ),
      ),
      body: catAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('エラー: $e')),
        data: (cat) {
          if (cat == null) {
            return const Center(child: Text('猫が見つかりません'));
          }
          final type = personalityType(cat);
          final badgeColor = personalityColor(type);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedCatWidget(
                  cat: cat,
                  animState: CatAnimationState.idle,
                  size: 100,
                ),
                const SizedBox(height: 12),
                Text(
                  cat.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 6),
                _PersonalityTypeBadge(type: type, color: badgeColor),
                const SizedBox(height: 8),
                Text(
                  '誕生日: ${_formatDate(cat.birthDate)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '毛色: ${cat.coatColor}  /  瞳: ${cat.eyeColor}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                CatStatusCard(cat: cat),
                const SizedBox(height: 12),
                _StatsRow(
                  countAsync: countAsync,
                  lastCareAsync: lastCareAsync,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '個性',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const Divider(),
                PersonalityBar(label: '社交性', value: cat.sociability),
                PersonalityBar(label: '活動性', value: cat.energy),
                PersonalityBar(label: '愛情表現', value: cat.affection),
                PersonalityBar(label: '好奇心', value: cat.curiosity),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => context.push('/cat/${cat.id}'),
                    icon: const Icon(Icons.favorite),
                    label: const Text('ケアする'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime d) =>
      '${d.year}/${d.month.toString().padLeft(2, '0')}/${d.day.toString().padLeft(2, '0')}';
}

class _PersonalityTypeBadge extends StatelessWidget {
  const _PersonalityTypeBadge({required this.type, required this.color});

  final String type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.6)),
      ),
      child: Text(
        type,
        style: TextStyle(
          fontSize: 13,
          color: color.withValues(alpha: 1.0),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.countAsync, required this.lastCareAsync});

  final AsyncValue<int> countAsync;
  final AsyncValue<DateTime?> lastCareAsync;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Icon(Icons.touch_app, size: 20),
                  const SizedBox(height: 4),
                  countAsync.when(
                    loading: () => const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    error: (e, _) => const Text('-'),
                    data: (count) => Text(
                      '$count 回',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Text(
                    'お世話回数',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const VerticalDivider(width: 1),
            Expanded(
              child: Column(
                children: [
                  const Icon(Icons.schedule, size: 20),
                  const SizedBox(height: 4),
                  lastCareAsync.when(
                    loading: () => const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    error: (e, _) => const Text('-'),
                    data: (date) => Text(
                      date != null ? _formatDate(date) : 'まだなし',
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    '最終ケア',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime d) =>
      '${d.month}/${d.day} ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
}
