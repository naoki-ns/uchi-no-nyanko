import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/cat.dart';
import '../../../cat/providers/cat_animation_providers.dart';
import '../../../cat/providers/cat_providers.dart';
import '../../../cat/view/widgets/care_action_sheet.dart';
import '../../../../shared/widgets/animated_cat_widget.dart';

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
            for (final cat in cats.take(5))
              _AnimatedCatTile(
                key: ValueKey(cat.id),
                cat: cat,
                constraints: constraints,
              ),
          ],
        );
      },
    );
  }
}

class _AnimatedCatTile extends ConsumerWidget {
  const _AnimatedCatTile({
    super.key,
    required this.cat,
    required this.constraints,
  });

  final Cat cat;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animValue = ref.watch(catAnimationNotifierProvider(cat.id));
    final left = animValue.position.dx * constraints.maxWidth - 30;
    final top = animValue.position.dy * constraints.maxHeight - 40;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeInOut,
      left: left,
      top: top,
      child: AnimatedCatWidget(
        cat: cat,
        animState: animValue.state,
        size: 60,
        onTap: () => showCareActionSheet(context, cat.id),
      ),
    );
  }
}
