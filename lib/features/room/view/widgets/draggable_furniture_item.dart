import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/room_item.dart';
import '../../../home/view/widgets/furniture_placeholder.dart';
import '../../providers/room_edit_providers.dart';

class DraggableFurnitureItem extends ConsumerWidget {
  const DraggableFurnitureItem({
    super.key,
    required this.item,
    required this.isDeleteMode,
  });

  final RoomItem item;
  final bool isDeleteMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeholder = FurniturePlaceholder(itemType: item.itemType);

    if (isDeleteMode) {
      return GestureDetector(
        onTap: () =>
            ref.read(roomEditNotifierProvider.notifier).removeItem(item.id),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            placeholder,
            Positioned(
              top: -6,
              right: -6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, size: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }

    return LongPressDraggable<int>(
      data: item.id,
      feedback: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(8),
        child: placeholder,
      ),
      childWhenDragging: Opacity(opacity: 0.3, child: placeholder),
      child: placeholder,
    );
  }
}
