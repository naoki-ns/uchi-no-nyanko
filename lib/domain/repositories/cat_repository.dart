import '../models/cat.dart';
import '../models/interaction.dart';

abstract class CatRepository {
  Stream<List<Cat>> watchAllCats();
  Stream<Cat?> watchCat(String catId);
  Future<void> saveCat(Cat cat);
  Future<void> deleteCat(String catId);
  Future<void> saveInteraction(Interaction interaction);
  Stream<List<Interaction>> watchInteractions(String catId);
}
