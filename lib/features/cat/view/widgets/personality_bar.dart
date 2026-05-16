import 'package:flutter/material.dart';

class PersonalityBar extends StatelessWidget {
  const PersonalityBar({
    super.key,
    required this.label,
    required this.value,
    this.bonus = 0.0,
  });

  final String label;
  final double value;
  final double bonus;

  @override
  Widget build(BuildContext context) {
    final effectiveValue = (value + bonus).clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Expanded(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: effectiveValue),
              duration: const Duration(milliseconds: 600),
              builder: (context, v, child) => LinearProgressIndicator(
                value: v,
                minHeight: 10,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 36,
            child: Text(
              '${(effectiveValue * 100).toInt()}',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.right,
            ),
          ),
          if (bonus > 0)
            const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Icon(Icons.arrow_upward, size: 14, color: Colors.green),
            ),
        ],
      ),
    );
  }
}
