import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers/app_database_provider.dart';
import '../../../domain/models/cat.dart';
import '../../../shared/utils/cat_personality.dart';
import 'cat_providers.dart';

part 'breeding_providers.g.dart';

@Riverpod(keepAlive: true)
class BreedingNotifier extends _$BreedingNotifier {
  final Map<String, DateTime> _cooldowns = {};

  @override
  (Cat, Cat)? build() {
    // ref.watch を使わず ref.listen にすることで、catListProvider の更新が
    // build() の再実行を引き起こさないようにする。
    // build() が再実行されると Notifier の内部状態が破棄され、
    // catListProvider の AsyncValue が一時的に不整合になる可能性がある。
    ref.listen<AsyncValue<List<Cat>>>(catListProvider, (_, next) {
      if (!next.hasValue) return;
      if (state != null) return; // すでにバナー表示中
      final pair = _findEligiblePair(next.value!);
      if (pair != null) state = pair;
    });

    // 初回チェック: プロバイダー生成時点ですでにデータがあれば即検査
    final initial = ref.read(catListProvider);
    if (initial.hasValue) {
      return _findEligiblePair(initial.value!);
    }
    return null;
  }

  (Cat, Cat)? _findEligiblePair(List<Cat> cats) {
    final adults = cats.where((c) => !c.isKitten).toList();
    for (var i = 0; i < adults.length; i++) {
      for (var j = i + 1; j < adults.length; j++) {
        final a = adults[i];
        final b = adults[j];
        if (_canBreed(a, b) && !_isInCooldown(a.id, b.id)) {
          return (a, b);
        }
      }
    }
    return null;
  }

  bool _canBreed(Cat a, Cat b) {
    final cohabitStart = a.birthDate.isAfter(b.birthDate) ? a.birthDate : b.birthDate;
    final daysCohabit = DateTime.now().difference(cohabitStart).inDays;
    final compatibility = (a.sociability - b.sociability).abs();
    return daysCohabit >= 7 && compatibility < 0.3;
  }

  bool _isInCooldown(String id1, String id2) {
    final rejectedAt = _cooldowns[_pairKey(id1, id2)];
    if (rejectedAt == null) return false;
    return DateTime.now().difference(rejectedAt).inDays < 7;
  }

  String _pairKey(String id1, String id2) {
    final sorted = [id1, id2]..sort();
    return '${sorted[0]}_${sorted[1]}';
  }

  Future<void> approve(Cat parentA, Cat parentB, String kittenName) async {
    _cooldowns[_pairKey(parentA.id, parentB.id)] = DateTime.now();
    state = null; // バナーを先に閉じる
    final kitten = generateKitten(
      parentA,
      parentB,
      kittenName.trim().isEmpty ? '子猫' : kittenName.trim(),
    );
    await ref.read(appDatabaseProvider).saveCat(kitten);
  }

  void reject(Cat a, Cat b) {
    _cooldowns[_pairKey(a.id, b.id)] = DateTime.now();
    state = null; // バナーを閉じる
  }
}
