import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cat_memory_providers.dart';
import '../providers/cat_providers.dart';
import 'widgets/cat_status_card.dart';
import 'widgets/personality_bar.dart';

class CatProfileScreen extends ConsumerWidget {
  const CatProfileScreen({super.key, required this.catId});

  final String catId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catAsync = ref.watch(catDetailProvider(catId));
    final memoryAsync = ref.watch(catMemoryProvider(catId));

    return Scaffold(
      appBar: AppBar(
        title: catAsync.maybeWhen(
          data: (cat) => Text(cat?.name ?? '猫プロフィール'),
          orElse: () => const Text('猫プロフィール'),
        ),
      ),
      body: catAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('エラー: $e')),
        data: (cat) {
          if (cat == null) {
            return const Center(child: Text('猫が見つかりません'));
          }
          final memory = memoryAsync.valueOrNull ??
              const CatMemoryState(
                affectionBonus: 0,
                sociabilityPenalty: false,
              );
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: _coatColor(cat.coatColor),
                  child: Text(
                    cat.name.substring(0, 1),
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  cat.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  '毛色: ${cat.coatColor}  瞳: ${cat.eyeColor}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                CatStatusCard(cat: cat),
                if (memory.sociabilityPenalty) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.warning_amber, color: Colors.orange),
                        SizedBox(width: 8),
                        Expanded(child: Text('最近会いに来てないよ…')),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '個性',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const Divider(),
                PersonalityBar(
                  label: '社交性',
                  value: cat.sociability,
                  bonus: memory.sociabilityPenalty ? -0.1 : 0,
                ),
                PersonalityBar(label: '活動性', value: cat.energy),
                PersonalityBar(
                  label: '愛情表現',
                  value: cat.affection,
                  bonus: memory.affectionBonus,
                ),
                PersonalityBar(label: '好奇心', value: cat.curiosity),
                const SizedBox(height: 8),
                Text(
                  '誕生日: ${_formatDate(cat.birthDate)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Color _coatColor(String c) => switch (c) {
        'orange' => Colors.orange,
        'white' => Colors.grey[300]!,
        'black' => Colors.grey[800]!,
        'gray' || 'grey' => Colors.grey,
        'brown' => Colors.brown,
        'calico' => Colors.deepOrange[300]!,
        'tabby' => Colors.brown[400]!,
        _ => Colors.orange[300]!,
      };

  String _formatDate(DateTime d) =>
      '${d.year}/${d.month.toString().padLeft(2, '0')}/${d.day.toString().padLeft(2, '0')}';
}
