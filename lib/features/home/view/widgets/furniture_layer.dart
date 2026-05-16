import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/room_providers.dart';
import 'furniture_placeholder.dart';

class FurnitureLayer extends ConsumerWidget {
  const FurnitureLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(roomLayoutProvider).valueOrNull ?? [];
    if (items.isEmpty) return const SizedBox.shrink();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            for (final item in items)
              Positioned(
                left: item.posX * constraints.maxWidth - 30,
                top: item.posY * constraints.maxHeight - 30,
                child: FurniturePlaceholder(itemType: item.itemType),
              ),
          ],
        );
      },
    );
  }
}
