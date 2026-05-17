import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/sound_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(soundSettingsNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('設定')),
      body: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => const Center(child: Text('読み込みエラー')),
        data: (settings) => _SettingsBody(settings: settings),
      ),
    );
  }
}

class _SettingsBody extends ConsumerWidget {
  const _SettingsBody({required this.settings});

  final SoundSettings settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(soundSettingsNotifierProvider.notifier);
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
          child: Text('BGM', style: textTheme.titleSmall),
        ),
        SwitchListTile(
          title: const Text('BGM'),
          value: settings.bgmEnabled,
          onChanged: notifier.setBgmEnabled,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const SizedBox(width: 8),
              const Text('音量'),
              Expanded(
                child: Slider(
                  value: settings.bgmVolume,
                  onChanged: settings.bgmEnabled ? notifier.setBgmVolume : null,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
          child: Text('SE（効果音）', style: textTheme.titleSmall),
        ),
        SwitchListTile(
          title: const Text('SE'),
          value: settings.seEnabled,
          onChanged: notifier.setSeEnabled,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const SizedBox(width: 8),
              const Text('音量'),
              Expanded(
                child: Slider(
                  value: settings.seVolume,
                  onChanged: settings.seEnabled ? notifier.setSeVolume : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
