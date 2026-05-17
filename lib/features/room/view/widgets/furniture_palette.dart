import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/furniture_type.dart';
import '../../../shop/providers/shop_providers.dart';
import '../../providers/room_edit_providers.dart';

Future<void> showFurniturePalette(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (_) => const _FurniturePalette(),
  );
}

class _FurniturePalette extends ConsumerWidget {
  const _FurniturePalette();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unlockedAsync = ref.watch(unlockedFurnitureTypesProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('家具を追加', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            unlockedAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('エラー: $e'),
              data: (unlocked) {
                final available = FurnitureType.values
                    .where((t) => unlocked.contains(t.name))
                    .toList();
                if (available.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: Text(
                        'ショップで家具を購入してください',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                    ),
                  );
                }
                return GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: available.map((type) {
                    return InkWell(
                      onTap: () {
                        ref
                            .read(roomEditNotifierProvider.notifier)
                            .addItem(type);
                        Navigator.of(context).pop();
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              type.icon,
                              size: 28,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              type.displayName,
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
