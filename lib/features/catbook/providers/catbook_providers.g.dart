// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catbook_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$catInteractionCountHash() =>
    r'a4ce90820f8189aed4bd57d9026588e2c84cb478';

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

/// See also [catInteractionCount].
@ProviderFor(catInteractionCount)
const catInteractionCountProvider = CatInteractionCountFamily();

/// See also [catInteractionCount].
class CatInteractionCountFamily extends Family<AsyncValue<int>> {
  /// See also [catInteractionCount].
  const CatInteractionCountFamily();

  /// See also [catInteractionCount].
  CatInteractionCountProvider call(String catId) {
    return CatInteractionCountProvider(catId);
  }

  @override
  CatInteractionCountProvider getProviderOverride(
    covariant CatInteractionCountProvider provider,
  ) {
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
  String? get name => r'catInteractionCountProvider';
}

/// See also [catInteractionCount].
class CatInteractionCountProvider extends AutoDisposeFutureProvider<int> {
  /// See also [catInteractionCount].
  CatInteractionCountProvider(String catId)
    : this._internal(
        (ref) => catInteractionCount(ref as CatInteractionCountRef, catId),
        from: catInteractionCountProvider,
        name: r'catInteractionCountProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$catInteractionCountHash,
        dependencies: CatInteractionCountFamily._dependencies,
        allTransitiveDependencies:
            CatInteractionCountFamily._allTransitiveDependencies,
        catId: catId,
      );

  CatInteractionCountProvider._internal(
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
    FutureOr<int> Function(CatInteractionCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CatInteractionCountProvider._internal(
        (ref) => create(ref as CatInteractionCountRef),
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
  AutoDisposeFutureProviderElement<int> createElement() {
    return _CatInteractionCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CatInteractionCountProvider && other.catId == catId;
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
mixin CatInteractionCountRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `catId` of this provider.
  String get catId;
}

class _CatInteractionCountProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with CatInteractionCountRef {
  _CatInteractionCountProviderElement(super.provider);

  @override
  String get catId => (origin as CatInteractionCountProvider).catId;
}

String _$catLastCareHash() => r'1a269d6d4866f932ffa84dbdfa24e6798831f462';

/// See also [catLastCare].
@ProviderFor(catLastCare)
const catLastCareProvider = CatLastCareFamily();

/// See also [catLastCare].
class CatLastCareFamily extends Family<AsyncValue<DateTime?>> {
  /// See also [catLastCare].
  const CatLastCareFamily();

  /// See also [catLastCare].
  CatLastCareProvider call(String catId) {
    return CatLastCareProvider(catId);
  }

  @override
  CatLastCareProvider getProviderOverride(
    covariant CatLastCareProvider provider,
  ) {
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
  String? get name => r'catLastCareProvider';
}

/// See also [catLastCare].
class CatLastCareProvider extends AutoDisposeFutureProvider<DateTime?> {
  /// See also [catLastCare].
  CatLastCareProvider(String catId)
    : this._internal(
        (ref) => catLastCare(ref as CatLastCareRef, catId),
        from: catLastCareProvider,
        name: r'catLastCareProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$catLastCareHash,
        dependencies: CatLastCareFamily._dependencies,
        allTransitiveDependencies: CatLastCareFamily._allTransitiveDependencies,
        catId: catId,
      );

  CatLastCareProvider._internal(
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
    FutureOr<DateTime?> Function(CatLastCareRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CatLastCareProvider._internal(
        (ref) => create(ref as CatLastCareRef),
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
  AutoDisposeFutureProviderElement<DateTime?> createElement() {
    return _CatLastCareProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CatLastCareProvider && other.catId == catId;
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
mixin CatLastCareRef on AutoDisposeFutureProviderRef<DateTime?> {
  /// The parameter `catId` of this provider.
  String get catId;
}

class _CatLastCareProviderElement
    extends AutoDisposeFutureProviderElement<DateTime?>
    with CatLastCareRef {
  _CatLastCareProviderElement(super.provider);

  @override
  String get catId => (origin as CatLastCareProvider).catId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
