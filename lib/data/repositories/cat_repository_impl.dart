import '../../domain/models/cat.dart';
import '../../domain/models/interaction.dart';
import '../../domain/repositories/cat_repository.dart';

class CatRepositoryImpl implements CatRepository {
  @override
  Stream<List<Cat>> watchAllCats() => throw UnimplementedError();

  @override
  Stream<Cat?> watchCat(String catId) => throw UnimplementedError();

  @override
  Future<void> saveCat(Cat cat) => throw UnimplementedError();

  @override
  Future<void> deleteCat(String catId) => throw UnimplementedError();

  @override
  Future<void> saveInteraction(Interaction interaction) =>
      throw UnimplementedError();

  @override
  Stream<List<Interaction>> watchInteractions(String catId) =>
      throw UnimplementedError();
}
