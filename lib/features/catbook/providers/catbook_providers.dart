import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers/app_database_provider.dart';

part 'catbook_providers.g.dart';

@riverpod
Future<int> catInteractionCount(
  CatInteractionCountRef ref,
  String catId,
) async {
  final db = ref.watch(appDatabaseProvider);
  final list = await db.watchInteractions(catId).first;
  return list.length;
}

@riverpod
Future<DateTime?> catLastCare(CatLastCareRef ref, String catId) async {
  final db = ref.watch(appDatabaseProvider);
  final list = await db.watchInteractions(catId).first;
  if (list.isEmpty) return null;
  return list.first.timestamp;
}
