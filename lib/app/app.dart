import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/cat/providers/mood_decay_provider.dart';
import '../features/shop/providers/shop_providers.dart';
import '../shared/providers/sound_providers.dart';
import '../shared/theme/app_theme.dart';
import 'router.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(moodDecayInitializerProvider.notifier).applyAllDecay();
      ref.read(bgmControllerProvider.notifier);
      ref.read(playerStatsNotifierProvider.notifier).checkAndGrantDailyLogin();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final bgm = ref.read(bgmControllerProvider.notifier);
    if (state == AppLifecycleState.paused) bgm.pause();
    if (state == AppLifecycleState.resumed) bgm.resume();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'うちのにゃんこ',
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
