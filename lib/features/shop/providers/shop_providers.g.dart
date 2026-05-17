// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$unlockedFurnitureTypesHash() =>
    r'65b2d25c75505723dcda90d473e3f9beeafe5b5e';

/// See also [unlockedFurnitureTypes].
@ProviderFor(unlockedFurnitureTypes)
final unlockedFurnitureTypesProvider =
    AutoDisposeStreamProvider<List<String>>.internal(
      unlockedFurnitureTypes,
      name: r'unlockedFurnitureTypesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$unlockedFurnitureTypesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UnlockedFurnitureTypesRef = AutoDisposeStreamProviderRef<List<String>>;
String _$playerStatsStreamHash() => r'7261dcccc70f5dad39c9f6f36d0d2b909b1831f1';

/// See also [playerStatsStream].
@ProviderFor(playerStatsStream)
final playerStatsStreamProvider =
    AutoDisposeStreamProvider<PlayerStatsRow?>.internal(
      playerStatsStream,
      name: r'playerStatsStreamProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$playerStatsStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PlayerStatsStreamRef = AutoDisposeStreamProviderRef<PlayerStatsRow?>;
String _$playerStatsNotifierHash() =>
    r'f2054e556fb1b15237a5ec033db6187ae1f11d92';

/// See also [PlayerStatsNotifier].
@ProviderFor(PlayerStatsNotifier)
final playerStatsNotifierProvider =
    AsyncNotifierProvider<PlayerStatsNotifier, PlayerStatsRow?>.internal(
      PlayerStatsNotifier.new,
      name: r'playerStatsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$playerStatsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PlayerStatsNotifier = AsyncNotifier<PlayerStatsRow?>;
String _$shopNotifierHash() => r'03fd2b5bccfd760f7952ed0bcd91629ebd9147d9';

/// See also [ShopNotifier].
@ProviderFor(ShopNotifier)
final shopNotifierProvider =
    AutoDisposeNotifierProvider<ShopNotifier, AsyncValue<void>>.internal(
      ShopNotifier.new,
      name: r'shopNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$shopNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ShopNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
