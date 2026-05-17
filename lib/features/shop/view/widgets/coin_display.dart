import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/shop_providers.dart';

class CoinDisplay extends ConsumerWidget {
  const CoinDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(playerStatsStreamProvider);
    final coins = stats.whenOrNull(data: (s) => s?.coins) ?? 0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.monetization_on, color: Colors.amber, size: 20),
        const SizedBox(width: 4),
        Text(
          '$coins',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
