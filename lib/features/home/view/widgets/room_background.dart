import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/shop_item.dart';
import '../../../shop/providers/shop_providers.dart';
import '../../providers/home_providers.dart';

class RoomBackground extends ConsumerWidget {
  const RoomBackground({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slot = ref.watch(currentTimeSlotProvider);
    final statsAsync = ref.watch(playerStatsStreamProvider);
    final wallpaperId =
        statsAsync.whenOrNull(data: (s) => s?.wallpaperId) ??
            WallpaperType.plain.name;
    final wallpaper = WallpaperType.values.firstWhere(
      (w) => w.name == wallpaperId,
      orElse: () => WallpaperType.plain,
    );

    final (begin, end) = _gradientColors(slot);
    final overlay = _overlayColor(slot);
    final wallTint = _wallTint(wallpaper);

    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [begin, end],
            ),
          ),
        ),
        if (wallTint != null)
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: MediaQuery.of(context).size.height * 0.55,
              color: wallTint,
            ),
          ),
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          color: overlay,
        ),
      ],
    );
  }

  (Color, Color) _gradientColors(TimeOfDaySlot slot) => switch (slot) {
        TimeOfDaySlot.morning => (Colors.amber[100]!, Colors.orange[50]!),
        TimeOfDaySlot.afternoon => (Colors.lightBlue[100]!, Colors.blue[50]!),
        TimeOfDaySlot.evening =>
          (Colors.deepOrange[200]!, Colors.orange[100]!),
        TimeOfDaySlot.night => (Colors.indigo[900]!, Colors.blueGrey[800]!),
      };

  Color _overlayColor(TimeOfDaySlot slot) => switch (slot) {
        TimeOfDaySlot.morning =>
          Colors.yellow[100]!.withValues(alpha: 0.08),
        TimeOfDaySlot.afternoon => Colors.transparent,
        TimeOfDaySlot.evening =>
          Colors.deepOrange.withValues(alpha: 0.12),
        TimeOfDaySlot.night =>
          Colors.indigo[900]!.withValues(alpha: 0.30),
      };

  Color? _wallTint(WallpaperType wallpaper) => switch (wallpaper) {
        WallpaperType.plain => null,
        WallpaperType.sakura =>
          Colors.pink[100]!.withValues(alpha: 0.45),
        WallpaperType.brick =>
          Colors.brown[300]!.withValues(alpha: 0.35),
        WallpaperType.nightWindow =>
          Colors.indigo[800]!.withValues(alpha: 0.40),
      };
}
