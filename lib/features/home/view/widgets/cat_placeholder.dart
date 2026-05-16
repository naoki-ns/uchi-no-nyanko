import 'package:flutter/material.dart';

import '../../../../domain/models/cat.dart';

class CatPlaceholder extends StatelessWidget {
  const CatPlaceholder({
    super.key,
    required this.cat,
    this.onTap,
    this.radius = 30,
  });

  final Cat cat;
  final VoidCallback? onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: _colorFor(cat.coatColor),
            child: Text(
              cat.name.substring(0, 1),
              style: TextStyle(
                fontSize: radius * 0.8,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              cat.name,
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  Color _colorFor(String coatColor) => switch (coatColor) {
        'orange' => Colors.orange,
        'white' => Colors.grey[300]!,
        'black' => Colors.grey[800]!,
        'gray' || 'grey' => Colors.grey,
        'brown' => Colors.brown,
        'calico' => Colors.deepOrange[300]!,
        'tabby' => Colors.brown[400]!,
        _ => Colors.orange[300]!,
      };
}
