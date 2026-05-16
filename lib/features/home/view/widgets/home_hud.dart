import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeHud extends StatelessWidget {
  const HomeHud({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black38,
                ),
                onPressed: () => context.push('/settings'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FloatingActionButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('猫をタップしてケアしよう！'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Icon(Icons.favorite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
