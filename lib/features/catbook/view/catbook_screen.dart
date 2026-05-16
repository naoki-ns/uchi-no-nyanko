import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/cat/providers/cat_providers.dart';
import 'widgets/cat_book_card.dart';

class CatbookScreen extends ConsumerWidget {
  const CatbookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catsAsync = ref.watch(catListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('猫図鑑')),
      body: catsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('エラー: $e')),
        data: (cats) {
          if (cats.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('まだ猫がいません', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () => context.go('/'),
                    child: const Text('お部屋へ'),
                  ),
                ],
              ),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.85,
            ),
            itemCount: cats.length,
            itemBuilder: (context, index) {
              final cat = cats[index];
              return CatBookCard(
                cat: cat,
                onTap: () => context.go('/catbook/${cat.id}'),
              );
            },
          );
        },
      ),
    );
  }
}
