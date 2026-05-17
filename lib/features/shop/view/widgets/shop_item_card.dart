import 'package:flutter/material.dart';

import '../../../../domain/models/shop_item.dart';

class ShopItemCard extends StatelessWidget {
  const ShopItemCard({
    super.key,
    required this.item,
    required this.isUnlocked,
    required this.isSelected,
    required this.currentCoins,
    required this.onTap,
  });

  final ShopItem item;
  final bool isUnlocked;
  final bool isSelected;
  final int currentCoins;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final canAfford = currentCoins >= item.price;

    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: (!isUnlocked && !canAfford) ? 0.5 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? cs.primaryContainer
                : cs.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? Border.all(color: cs.primary, width: 2)
                : null,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.icon, size: 32, color: cs.primary),
                    const SizedBox(height: 4),
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    if (!isUnlocked) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.monetization_on,
                            color: Colors.amber,
                            size: 14,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${item.price}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              if (isUnlocked)
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: cs.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, size: 12, color: cs.onPrimary),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
