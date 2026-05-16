import '../../domain/models/cat.dart';
import '../../domain/models/interaction.dart';
import '../../domain/repositories/cat_repository.dart';
import '../database/app_database.dart';

class CatRepositoryImpl implements CatRepository {
  final AppDatabase _db;

  CatRepositoryImpl(this._db);

  @override
  Stream<List<Cat>> watchAllCats() => _db.watchAllCats();

  @override
  Stream<Cat?> watchCat(String catId) => _db.watchCat(catId);

  @override
  Future<void> saveCat(Cat cat) => _db.saveCat(cat);

  @override
  Future<void> deleteCat(String catId) => _db.deleteCat(catId);

  @override
  Future<void> saveInteraction(Interaction interaction) =>
      _db.saveInteraction(interaction);

  @override
  Stream<List<Interaction>> watchInteractions(String catId) =>
      _db.watchInteractions(catId);
}
