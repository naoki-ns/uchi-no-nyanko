import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../cat/providers/cat_providers.dart';
import '../../../cat/view/widgets/care_action_sheet.dart';

class HomeHud extends ConsumerWidget {
  const HomeHud({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cats = ref.watch(catListProvider).valueOrNull ?? [];
    return SafeArea(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home_work, color: Colors.white),
                    style:
                        IconButton.styleFrom(backgroundColor: Colors.black38),
                    onPressed: () => context.push('/room/edit'),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    style:
                        IconButton.styleFrom(backgroundColor: Colors.black38),
                    onPressed: () => context.push('/settings'),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FloatingActionButton(
                onPressed: () {
                  if (cats.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('猫がいません'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  showCareActionSheet(context, cats.first.id);
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
