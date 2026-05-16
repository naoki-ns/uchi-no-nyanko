// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$catListHash() => r'f0bdf6e779ce95f1751e58f97cd276812bc96bda';

/// See also [catList].
@ProviderFor(catList)
final catListProvider = AutoDisposeStreamProvider<List<Cat>>.internal(
  catList,
  name: r'catListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$catListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CatListRef = AutoDisposeStreamProviderRef<List<Cat>>;
String _$catDetailHash() => r'8b66589524ddea1bb6561bcdbda5b514566cfefe';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [catDetail].
@ProviderFor(catDetail)
const catDetailProvider = CatDetailFamily();

/// See also [catDetail].
class CatDetailFamily extends Family<AsyncValue<Cat?>> {
  /// See also [catDetail].
  const CatDetailFamily();

  /// See also [catDetail].
  CatDetailProvider call(String catId) {
    return CatDetailProvider(catId);
  }

  @override
  CatDetailProvider getProviderOverride(covariant CatDetailProvider provider) {
    return call(provider.catId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'catDetailProvider';
}

/// See also [catDetail].
class CatDetailProvider extends AutoDisposeStreamProvider<Cat?> {
  /// See also [catDetail].
  CatDetailProvider(String catId)
    : this._internal(
        (ref) => catDetail(ref as CatDetailRef, catId),
        from: catDetailProvider,
        name: r'catDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$catDetailHash,
        dependencies: CatDetailFamily._dependencies,
        allTransitiveDependencies: CatDetailFamily._allTransitiveDependencies,
        catId: catId,
      );

  CatDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.catId,
  }) : super.internal();

  final String catId;

  @override
  Override overrideWith(Stream<Cat?> Function(CatDetailRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: CatDetailProvider._internal(
        (ref) => create(ref as CatDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        catId: catId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Cat?> createElement() {
    return _CatDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CatDetailProvider && other.catId == catId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, catId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CatDetailRef on AutoDisposeStreamProviderRef<Cat?> {
  /// The parameter `catId` of this provider.
  String get catId;
}

class _CatDetailProviderElement extends AutoDisposeStreamProviderElement<Cat?>
    with CatDetailRef {
  _CatDetailProviderElement(super.provider);

  @override
  String get catId => (origin as CatDetailProvider).catId;
}

String _$catCareNotifierHash() => r'1af6ba66bb1fc870e8149a4a126e08185054c01b';

/// See also [CatCareNotifier].
@ProviderFor(CatCareNotifier)
final catCareNotifierProvider =
    AutoDisposeNotifierProvider<CatCareNotifier, AsyncValue<void>>.internal(
      CatCareNotifier.new,
      name: r'catCareNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$catCareNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CatCareNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
