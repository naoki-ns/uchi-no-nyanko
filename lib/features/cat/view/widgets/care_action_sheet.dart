import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/models/cat_animation_state.dart';
import '../../providers/cat_animation_providers.dart';
import '../../providers/cat_providers.dart';

Future<void> showCareActionSheet(BuildContext context, String catId) {
  return showModalBottomSheet(
    context: context,
    builder: (_) => _CareActionSheet(catId: catId),
  );
}

class _CareActionSheet extends ConsumerWidget {
  const _CareActionSheet({required this.catId});

  final String catId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final careState = ref.watch(catCareNotifierProvider);
    final isLoading = careState.isLoading;
    final cat = ref.watch(catDetailProvider(catId)).valueOrNull;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cat != null ? '${cat.name} のお世話' : 'お世話',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                _ActionButton(
                  icon: Icons.restaurant,
                  label: '給餌',
                  enabled: !isLoading,
                  onTap: () => _doAction(
                    context, ref, catId, 'feed', '給餌しました！',
                  ),
                ),
                _ActionButton(
                  icon: Icons.spa,
                  label: 'ブラッシング',
                  enabled: !isLoading,
                  onTap: () => _doAction(
                    context, ref, catId, 'brush', 'ブラッシングしました！',
                  ),
                ),
                _ActionButton(
                  icon: Icons.toys,
                  label: '遊ぶ',
                  enabled: !isLoading,
                  onTap: () => _doAction(
                    context, ref, catId, 'play', '一緒に遊びました！',
                  ),
                ),
                _ActionButton(
                  icon: Icons.favorite,
                  label: 'なでる',
                  enabled: !isLoading,
                  onTap: () => _doAction(
                    context, ref, catId, 'pet', 'なでました！',
                  ),
                ),
                _ActionButton(
                  icon: Icons.bed,
                  label: 'ベッド整え',
                  enabled: !isLoading,
                  onTap: () => _doAction(
                    context, ref, catId, 'bed', 'ベッドを整えました！',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.push('/cat/$catId');
              },
              child: const Text('プロフィールを見る'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _doAction(
    BuildContext context,
    WidgetRef ref,
    String catId,
    String type,
    String message,
  ) async {
    final notifier = ref.read(catCareNotifierProvider.notifier);
    final animNotifier =
        ref.read(catAnimationNotifierProvider(catId).notifier);
    switch (type) {
      case 'feed':
        await notifier.feed(catId);
        animNotifier.trigger(CatAnimationState.eat);
      case 'brush':
        await notifier.brush(catId);
        animNotifier.trigger(CatAnimationState.groom);
      case 'play':
        await notifier.play(catId);
        animNotifier.trigger(CatAnimationState.play);
      case 'pet':
        await notifier.pet(catId);
        animNotifier.trigger(CatAnimationState.happy);
      case 'bed':
        await notifier.makeBed(catId);
        animNotifier.trigger(
          CatAnimationState.sleep,
          duration: const Duration(seconds: 5),
        );
    }
    if (context.mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
      );
    }
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(12),
      child: Opacity(
        opacity: enabled ? 1.0 : 0.4,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 6),
              Text(label, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
