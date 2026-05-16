import '../../../data/database/app_database.dart';

class MoodDecayService {
  static Future<void> applyDecay(AppDatabase db, String catId) async {
    final cat = await db.watchCat(catId).first;
    if (cat == null) return;

    final interactions = await db.watchInteractions(catId).first;
    final now = DateTime.now();

    // watchInteractions は timestamp DESC 順なので先頭が最新
    final reference =
        interactions.isNotEmpty ? interactions.first.timestamp : cat.birthDate;

    final elapsedHours = now.difference(reference).inMinutes / 60.0;
    if (elapsedHours <= 0) return;

    final decayAmount = elapsedHours * 0.02;
    final maxDecay = (cat.mood - 0.1).clamp(0.0, 1.0);
    final finalDecay = decayAmount.clamp(0.0, maxDecay);

    if (finalDecay > 0) {
      await db.updateCatAfterCare(catId,
          moodDelta: -finalDecay, bondDelta: 0);
    }
  }
}
