import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/home_providers.dart';

class RoomBackground extends ConsumerWidget {
  const RoomBackground({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slot = ref.watch(currentTimeSlotProvider);
    final (begin, end) = _gradientColors(slot);
    final overlay = _overlayColor(slot);
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
        TimeOfDaySlot.evening => (Colors.deepOrange[200]!, Colors.orange[100]!),
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
}
