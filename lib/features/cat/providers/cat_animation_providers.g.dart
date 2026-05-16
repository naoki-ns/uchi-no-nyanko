// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_animation_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$catAnimationNotifierHash() =>
    r'35e2dadc68b847e582d833c010c0728a0e112a3f';

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

abstract class _$CatAnimationNotifier
    extends BuildlessAutoDisposeNotifier<CatAnimationValue> {
  late final String catId;

  CatAnimationValue build(String catId);
}

/// See also [CatAnimationNotifier].
@ProviderFor(CatAnimationNotifier)
const catAnimationNotifierProvider = CatAnimationNotifierFamily();

/// See also [CatAnimationNotifier].
class CatAnimationNotifierFamily extends Family<CatAnimationValue> {
  /// See also [CatAnimationNotifier].
  const CatAnimationNotifierFamily();

  /// See also [CatAnimationNotifier].
  CatAnimationNotifierProvider call(String catId) {
    return CatAnimationNotifierProvider(catId);
  }

  @override
  CatAnimationNotifierProvider getProviderOverride(
    covariant CatAnimationNotifierProvider provider,
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
  String? get name => r'catAnimationNotifierProvider';
}

/// See also [CatAnimationNotifier].
class CatAnimationNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          CatAnimationNotifier,
          CatAnimationValue
        > {
  /// See also [CatAnimationNotifier].
  CatAnimationNotifierProvider(String catId)
    : this._internal(
        () => CatAnimationNotifier()..catId = catId,
        from: catAnimationNotifierProvider,
        name: r'catAnimationNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$catAnimationNotifierHash,
        dependencies: CatAnimationNotifierFamily._dependencies,
        allTransitiveDependencies:
            CatAnimationNotifierFamily._allTransitiveDependencies,
        catId: catId,
      );

  CatAnimationNotifierProvider._internal(
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
  CatAnimationValue runNotifierBuild(covariant CatAnimationNotifier notifier) {
    return notifier.build(catId);
  }

  @override
  Override overrideWith(CatAnimationNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CatAnimationNotifierProvider._internal(
        () => create()..catId = catId,
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
  AutoDisposeNotifierProviderElement<CatAnimationNotifier, CatAnimationValue>
  createElement() {
    return _CatAnimationNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CatAnimationNotifierProvider && other.catId == catId;
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
mixin CatAnimationNotifierRef
    on AutoDisposeNotifierProviderRef<CatAnimationValue> {
  /// The parameter `catId` of this provider.
  String get catId;
}

class _CatAnimationNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          CatAnimationNotifier,
          CatAnimationValue
        >
    with CatAnimationNotifierRef {
  _CatAnimationNotifierProviderElement(super.provider);

  @override
  String get catId => (origin as CatAnimationNotifierProvider).catId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
