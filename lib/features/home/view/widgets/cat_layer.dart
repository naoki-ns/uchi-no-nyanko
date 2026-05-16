import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/models/cat.dart';
import '../../../cat/providers/cat_providers.dart';
import 'cat_placeholder.dart';

const _catPositions = [
  Offset(0.20, 0.55),
  Offset(0.50, 0.60),
  Offset(0.75, 0.50),
  Offset(0.35, 0.40),
  Offset(0.65, 0.65),
];

class CatLayer extends ConsumerWidget {
  const CatLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cats = ref.watch(catListProvider).valueOrNull ?? [];
    if (cats.isEmpty) return const SizedBox.shrink();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            for (final (index, cat) in cats.take(5).indexed)
              _positioned(context, cat, index, constraints),
          ],
        );
      },
    );
  }

  Widget _positioned(
    BuildContext context,
    Cat cat,
    int index,
    BoxConstraints constraints,
  ) {
    final pos = _catPositions[index % _catPositions.length];
    return Positioned(
      left: pos.dx * constraints.maxWidth - 30,
      top: pos.dy * constraints.maxHeight - 40,
      child: CatPlaceholder(
        cat: cat,
        onTap: () => context.push('/cat/${cat.id}'),
      ),
    );
  }
}
