import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers/app_database_provider.dart';

part 'cat_memory_providers.g.dart';

class CatMemoryState {
  const CatMemoryState({
    required this.affectionBonus,
    required this.sociabilityPenalty,
  });

  final double affectionBonus;
  final bool sociabilityPenalty;
}

@riverpod
Future<CatMemoryState> catMemory(CatMemoryRef ref, String catId) async {
  final db = ref.watch(appDatabaseProvider);
  final interactions = await db.watchInteractions(catId).first;

  final sevenDaysAgo = DateTime.now().subtract(const Duration(days: 7));
  final recentBrushCount = interactions
      .where((i) => i.type == 'brush' && i.timestamp.isAfter(sevenDaysAgo))
      .length;
  final hasRecentCare =
      interactions.any((i) => i.timestamp.isAfter(sevenDaysAgo));

  return CatMemoryState(
    affectionBonus: (recentBrushCount * 0.05).clamp(0.0, 0.2),
    sociabilityPenalty: !hasRecentCare && interactions.isNotEmpty,
  );
}
