// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$soundSettingsNotifierHash() =>
    r'c3ce938171d991aed10440fbd31af094c5ede3b8';

/// See also [SoundSettingsNotifier].
@ProviderFor(SoundSettingsNotifier)
final soundSettingsNotifierProvider =
    AsyncNotifierProvider<SoundSettingsNotifier, SoundSettings>.internal(
      SoundSettingsNotifier.new,
      name: r'soundSettingsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$soundSettingsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SoundSettingsNotifier = AsyncNotifier<SoundSettings>;
String _$bgmControllerHash() => r'251fcfff6223ce8428aa7404ccfb633dc1f349e3';

/// See also [BgmController].
@ProviderFor(BgmController)
final bgmControllerProvider = NotifierProvider<BgmController, void>.internal(
  BgmController.new,
  name: r'bgmControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bgmControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BgmController = Notifier<void>;
String _$sePlayerHash() => r'5cc9818b38a64ce3dc4882b202a9c6bbec6f66be';

/// See also [SePlayer].
@ProviderFor(SePlayer)
final sePlayerProvider = NotifierProvider<SePlayer, void>.internal(
  SePlayer.new,
  name: r'sePlayerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sePlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SePlayer = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
