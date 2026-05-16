import 'package:flutter/material.dart';

class FurniturePlaceholder extends StatelessWidget {
  const FurniturePlaceholder({super.key, required this.itemType});

  final String itemType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.brown[100]!.withAlpha(200),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.brown[300]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(_iconFor(itemType), size: 28, color: Colors.brown[700]),
          Text(
            _labelFor(itemType),
            style: TextStyle(fontSize: 9, color: Colors.brown[700]),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  IconData _iconFor(String type) => switch (type) {
        'bed' => Icons.bed,
        'scratcher' => Icons.dashboard,
        'toy' => Icons.toys,
        'foodBowl' => Icons.restaurant,
        'windowMat' => Icons.window,
        'bookshelf' => Icons.book,
        'cushion' => Icons.chair,
        'light' => Icons.lightbulb,
        _ => Icons.category,
      };

  String _labelFor(String type) => switch (type) {
        'bed' => 'ベッド',
        'scratcher' => '爪とぎ',
        'toy' => 'おもちゃ',
        'foodBowl' => '皿',
        'windowMat' => '窓マット',
        'bookshelf' => '本棚',
        'cushion' => 'クッション',
        'light' => '照明',
        _ => type,
      };
}
