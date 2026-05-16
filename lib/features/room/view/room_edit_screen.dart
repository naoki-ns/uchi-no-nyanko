import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/home/providers/room_providers.dart';
import '../providers/room_edit_providers.dart';
import 'widgets/draggable_furniture_item.dart';
import 'widgets/furniture_palette.dart';

class RoomEditScreen extends ConsumerStatefulWidget {
  const RoomEditScreen({super.key});

  @override
  ConsumerState<RoomEditScreen> createState() => _RoomEditScreenState();
}

class _RoomEditScreenState extends ConsumerState<RoomEditScreen> {
  bool _isDeleteMode = false;
  final _stackKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(roomLayoutProvider).valueOrNull ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('部屋カスタマイズ'),
        actions: [
          IconButton(
            icon: Icon(
              _isDeleteMode ? Icons.delete : Icons.delete_outline,
              color: _isDeleteMode ? Colors.red : null,
            ),
            tooltip: '削除モード',
            onPressed: () => setState(() => _isDeleteMode = !_isDeleteMode),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: '家具を追加',
            onPressed: () => showFurniturePalette(context),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return DragTarget<int>(
            onAcceptWithDetails: (details) {
              final box =
                  _stackKey.currentContext?.findRenderObject() as RenderBox?;
              if (box == null) return;
              final localPos = box.globalToLocal(details.offset);
              final posX =
                  (localPos.dx / box.size.width).clamp(0.05, 0.95);
              final posY =
                  (localPos.dy / box.size.height).clamp(0.05, 0.95);
              ref
                  .read(roomEditNotifierProvider.notifier)
                  .moveItem(details.data, posX, posY);
            },
            builder: (context, candidates, rejects) {
              final isDragOver = candidates.isNotEmpty;
              return Stack(
                key: _stackKey,
                children: [
                  Container(
                    color: isDragOver
                        ? Colors.brown[50]
                        : Colors.grey[100],
                  ),
                  if (items.isEmpty)
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add_home,
                              size: 64, color: Colors.grey[400]),
                          const SizedBox(height: 8),
                          Text(
                            '右上の + ボタンで家具を追加',
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
                  for (final item in items)
                    Positioned(
                      left: item.posX * constraints.maxWidth - 30,
                      top: item.posY * constraints.maxHeight - 30,
                      child: DraggableFurnitureItem(
                        item: item,
                        isDeleteMode: _isDeleteMode,
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
