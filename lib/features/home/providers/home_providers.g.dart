// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentSeasonHash() => r'74dc98acb19cfb9ab761f18e207c905e8314d3ad';

/// See also [currentSeason].
@ProviderFor(currentSeason)
final currentSeasonProvider = AutoDisposeProvider<Season>.internal(
  currentSeason,
  name: r'currentSeasonProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSeasonHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentSeasonRef = AutoDisposeProviderRef<Season>;
String _$currentTimeSlotHash() => r'14c0c5099e875889fe32e317fe78445a6662c7c7';

/// See also [currentTimeSlot].
@ProviderFor(currentTimeSlot)
final currentTimeSlotProvider = AutoDisposeProvider<TimeOfDaySlot>.internal(
  currentTimeSlot,
  name: r'currentTimeSlotProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentTimeSlotHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentTimeSlotRef = AutoDisposeProviderRef<TimeOfDaySlot>;
String _$defaultCatInitializerHash() =>
    r'77fdff658634a3a5f83a3bfb32922a8b01612b67';

/// See also [DefaultCatInitializer].
@ProviderFor(DefaultCatInitializer)
final defaultCatInitializerProvider =
    AutoDisposeNotifierProvider<
      DefaultCatInitializer,
      AsyncValue<void>
    >.internal(
      DefaultCatInitializer.new,
      name: r'defaultCatInitializerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$defaultCatInitializerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DefaultCatInitializer = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
