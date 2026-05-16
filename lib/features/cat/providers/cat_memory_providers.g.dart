// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_memory_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$catMemoryHash() => r'8077484b01bc7524514227b1739123c8afccfffa';

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

/// See also [catMemory].
@ProviderFor(catMemory)
const catMemoryProvider = CatMemoryFamily();

/// See also [catMemory].
class CatMemoryFamily extends Family<AsyncValue<CatMemoryState>> {
  /// See also [catMemory].
  const CatMemoryFamily();

  /// See also [catMemory].
  CatMemoryProvider call(String catId) {
    return CatMemoryProvider(catId);
  }

  @override
  CatMemoryProvider getProviderOverride(covariant CatMemoryProvider provider) {
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
  String? get name => r'catMemoryProvider';
}

/// See also [catMemory].
class CatMemoryProvider extends AutoDisposeFutureProvider<CatMemoryState> {
  /// See also [catMemory].
  CatMemoryProvider(String catId)
    : this._internal(
        (ref) => catMemory(ref as CatMemoryRef, catId),
        from: catMemoryProvider,
        name: r'catMemoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$catMemoryHash,
        dependencies: CatMemoryFamily._dependencies,
        allTransitiveDependencies: CatMemoryFamily._allTransitiveDependencies,
        catId: catId,
      );

  CatMemoryProvider._internal(
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
  Override overrideWith(
    FutureOr<CatMemoryState> Function(CatMemoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CatMemoryProvider._internal(
        (ref) => create(ref as CatMemoryRef),
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
  AutoDisposeFutureProviderElement<CatMemoryState> createElement() {
    return _CatMemoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CatMemoryProvider && other.catId == catId;
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
mixin CatMemoryRef on AutoDisposeFutureProviderRef<CatMemoryState> {
  /// The parameter `catId` of this provider.
  String get catId;
}

class _CatMemoryProviderElement
    extends AutoDisposeFutureProviderElement<CatMemoryState>
    with CatMemoryRef {
  _CatMemoryProviderElement(super.provider);

  @override
  String get catId => (origin as CatMemoryProvider).catId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
