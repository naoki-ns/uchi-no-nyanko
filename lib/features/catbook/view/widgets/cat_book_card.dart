import 'package:flutter/material.dart';

import '../../../../domain/models/cat.dart';
import '../../../../domain/models/cat_animation_state.dart';
import '../../../../shared/utils/cat_personality.dart';
import '../../../../shared/widgets/animated_cat_widget.dart';

class CatBookCard extends StatelessWidget {
  const CatBookCard({super.key, required this.cat, required this.onTap});

  final Cat cat;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final type = personalityType(cat);
    final badgeColor = personalityColor(type);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedCatWidget(
                cat: cat,
                animState: CatAnimationState.idle,
                size: 64,
              ),
              const SizedBox(height: 8),
              Text(
                cat.name,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                cat.coatColor,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 6),
              _PersonalityBadge(type: type, color: badgeColor),
            ],
          ),
        ),
      ),
    );
  }
}

class _PersonalityBadge extends StatelessWidget {
  const _PersonalityBadge({required this.type, required this.color});

  final String type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.6)),
      ),
      child: Text(
        type,
        style: TextStyle(
          fontSize: 11,
          color: color.withValues(alpha: 1.0),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
