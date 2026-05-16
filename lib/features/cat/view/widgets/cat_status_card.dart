import 'package:flutter/material.dart';

import '../../../../domain/models/cat.dart';

class CatStatusCard extends StatelessWidget {
  const CatStatusCard({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _row(context, Icons.favorite, '機嫌', cat.mood),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.stars, size: 20),
                const SizedBox(width: 8),
                Text('絆', style: Theme.of(context).textTheme.bodyMedium),
                const Spacer(),
                Text(
                  '${cat.bond}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(BuildContext context, IconData icon, String label, double value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: _moodColor(value)),
        const SizedBox(width: 8),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(width: 12),
        Expanded(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: value),
            duration: const Duration(milliseconds: 600),
            builder: (context, v, child) => LinearProgressIndicator(
              value: v,
              minHeight: 10,
              color: _moodColor(v),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '${(value * 100).toInt()}%',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Color _moodColor(double v) {
    if (v >= 0.7) return Colors.green;
    if (v >= 0.4) return Colors.orange;
    return Colors.red;
  }
}
