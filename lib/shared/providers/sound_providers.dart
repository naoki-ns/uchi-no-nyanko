import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:just_audio/just_audio.dart' as ja;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/providers/home_providers.dart';

part 'sound_providers.g.dart';

class SoundSettings {
  const SoundSettings({
    this.bgmEnabled = true,
    this.seEnabled = true,
    this.bgmVolume = 0.7,
    this.seVolume = 0.8,
  });

  final bool bgmEnabled;
  final bool seEnabled;
  final double bgmVolume;
  final double seVolume;

  SoundSettings copyWith({
    bool? bgmEnabled,
    bool? seEnabled,
    double? bgmVolume,
    double? seVolume,
  }) =>
      SoundSettings(
        bgmEnabled: bgmEnabled ?? this.bgmEnabled,
        seEnabled: seEnabled ?? this.seEnabled,
        bgmVolume: bgmVolume ?? this.bgmVolume,
        seVolume: seVolume ?? this.seVolume,
      );
}

@Riverpod(keepAlive: true)
class SoundSettingsNotifier extends _$SoundSettingsNotifier {
  static const _kBgmEnabled = 'sound_bgm_enabled';
  static const _kSeEnabled = 'sound_se_enabled';
  static const _kBgmVolume = 'sound_bgm_volume';
  static const _kSeVolume = 'sound_se_volume';

  @override
  Future<SoundSettings> build() async {
    final prefs = await SharedPreferences.getInstance();
    return SoundSettings(
      bgmEnabled: prefs.getBool(_kBgmEnabled) ?? true,
      seEnabled: prefs.getBool(_kSeEnabled) ?? true,
      bgmVolume: prefs.getDouble(_kBgmVolume) ?? 0.7,
      seVolume: prefs.getDouble(_kSeVolume) ?? 0.8,
    );
  }

  Future<void> setBgmEnabled(bool value) async {
    state = AsyncData(
      (state.valueOrNull ?? const SoundSettings()).copyWith(bgmEnabled: value),
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kBgmEnabled, value);
  }

  Future<void> setSeEnabled(bool value) async {
    state = AsyncData(
      (state.valueOrNull ?? const SoundSettings()).copyWith(seEnabled: value),
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kSeEnabled, value);
  }

  Future<void> setBgmVolume(double value) async {
    state = AsyncData(
      (state.valueOrNull ?? const SoundSettings()).copyWith(bgmVolume: value),
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_kBgmVolume, value);
  }

  Future<void> setSeVolume(double value) async {
    state = AsyncData(
      (state.valueOrNull ?? const SoundSettings()).copyWith(seVolume: value),
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_kSeVolume, value);
  }
}

@Riverpod(keepAlive: true)
class BgmController extends _$BgmController {
  ja.AudioPlayer? _player;
  bool _isFading = false;

  @override
  void build() {
    _player ??= ja.AudioPlayer();
    ref.onDispose(() {
      _player?.dispose();
      _player = null;
    });

    final slot = ref.read(currentTimeSlotProvider);
    _startInitial(slot);

    ref.listen(currentTimeSlotProvider, (prev, next) {
      if (prev != next) _switchTrack(next);
    });

    ref.listen(soundSettingsNotifierProvider, (_, next) {
      next.whenData((s) => _applySettings(s));
    });
  }

  void pause() {
    try {
      _player?.pause();
    } catch (_) {}
  }

  void resume() {
    final settings = ref.read(soundSettingsNotifierProvider).valueOrNull;
    if (settings?.bgmEnabled ?? true) {
      try {
        _player?.play();
      } catch (_) {}
    }
  }

  void _startInitial(TimeOfDaySlot slot) async {
    try {
      final settings = ref.read(soundSettingsNotifierProvider).valueOrNull;
      await _player?.setLoopMode(ja.LoopMode.one);
      await _player?.setAsset('assets/audio/bgm/${_slotName(slot)}.mp3');
      if (settings?.bgmEnabled ?? true) {
        await _player?.setVolume(settings?.bgmVolume ?? 0.7);
        await _player?.play();
      }
    } catch (_) {}
  }

  void _switchTrack(TimeOfDaySlot slot) async {
    if (_isFading) return;
    _isFading = true;
    try {
      final currentVol = _player?.volume ?? 0;
      // Fade out over 1 second (10 steps × 100ms)
      for (int i = 10; i >= 0; i--) {
        await _player?.setVolume(currentVol * i / 10);
        await Future.delayed(const Duration(milliseconds: 100));
      }
      await _player?.pause();

      await _player?.setLoopMode(ja.LoopMode.one);
      await _player?.setAsset('assets/audio/bgm/${_slotName(slot)}.mp3');

      final settings = ref.read(soundSettingsNotifierProvider).valueOrNull;
      final targetVol = settings?.bgmVolume ?? 0.7;
      if (settings?.bgmEnabled ?? true) {
        await _player?.setVolume(0);
        await _player?.play();
        // Fade in over 1 second
        for (int i = 0; i <= 10; i++) {
          await _player?.setVolume(targetVol * i / 10);
          await Future.delayed(const Duration(milliseconds: 100));
        }
      }
    } catch (_) {}
    _isFading = false;
  }

  void _applySettings(SoundSettings settings) async {
    if (_isFading) return;
    try {
      if (settings.bgmEnabled) {
        await _player?.setVolume(settings.bgmVolume);
        if (!(_player?.playing ?? false)) await _player?.play();
      } else {
        await _player?.pause();
      }
    } catch (_) {}
  }

  String _slotName(TimeOfDaySlot slot) => switch (slot) {
        TimeOfDaySlot.morning => 'morning',
        TimeOfDaySlot.afternoon => 'afternoon',
        TimeOfDaySlot.evening => 'evening',
        TimeOfDaySlot.night => 'night',
      };
}

@Riverpod(keepAlive: true)
class SePlayer extends _$SePlayer {
  @override
  void build() {}

  Future<void> play(String type) async {
    final settings = ref.read(soundSettingsNotifierProvider).valueOrNull;
    if (!(settings?.seEnabled ?? true)) return;
    final volume = settings?.seVolume ?? 0.8;
    try {
      final player = ap.AudioPlayer();
      await player.setVolume(volume);
      await player.play(ap.AssetSource('audio/se/$type.mp3'));
      player.onPlayerComplete.listen((_) => player.dispose());
    } catch (_) {}
  }
}
