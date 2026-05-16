import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/home_providers.dart';
import 'widgets/cat_layer.dart';
import 'widgets/furniture_layer.dart';
import 'widgets/home_hud.dart';
import 'widgets/room_background.dart';
import 'widgets/season_overlay.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(defaultCatInitializerProvider.notifier).ensureDefaultCat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          RoomBackground(),
          FurnitureLayer(),
          CatLayer(),
          SeasonOverlay(),
          HomeHud(),
        ],
      ),
    );
  }
}
