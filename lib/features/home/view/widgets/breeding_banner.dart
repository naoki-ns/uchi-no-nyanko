import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/cat.dart';
import '../../../cat/providers/breeding_providers.dart';

class BreedingBanner extends ConsumerWidget {
  const BreedingBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pair = ref.watch(breedingNotifierProvider);
    if (pair == null) return const SizedBox.shrink();

    // notifier を await 前にキャプチャして ref の非同期使用を避ける
    final notifier = ref.read(breedingNotifierProvider.notifier);

    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 80, 0),
        child: GestureDetector(
          onTap: () => _showConfirmDialog(context, notifier, pair.$1, pair.$2),
          child: Card(
            color: Colors.pink.shade50.withValues(alpha: 0.95),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('💕', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      '${pair.$1.name}と${pair.$2.name}がとても仲良しです',
                      style: const TextStyle(fontSize: 12, color: Colors.pink),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showConfirmDialog(
    BuildContext context,
    BreedingNotifier notifier,
    Cat catA,
    Cat catB,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('子猫が生まれるかも？'),
        content: Text(
          '${catA.name}と${catB.name}はとても仲良し！\n子猫が生まれるかもしれません。',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('まだいいかな'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('産まれてほしい♡'),
          ),
        ],
      ),
    );

    if (!context.mounted) return;
    if (result == true) {
      await _showNamingDialog(context, notifier, catA, catB);
    } else if (result == false) {
      notifier.reject(catA, catB);
    }
  }

  Future<void> _showNamingDialog(
    BuildContext context,
    BreedingNotifier notifier,
    Cat catA,
    Cat catB,
  ) async {
    // StatefulWidget にコントローラ管理を委譲し、ダイアログ終了アニメーション後に
    // dispose されるようにする。showDialog は名前文字列を返す。
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => const _KittenNamingDialog(),
    );

    if (!context.mounted) return;
    if (name != null) {
      await notifier.approve(catA, catB, name);
    } else {
      notifier.reject(catA, catB);
    }
  }
}

class _KittenNamingDialog extends StatefulWidget {
  const _KittenNamingDialog();

  @override
  State<_KittenNamingDialog> createState() => _KittenNamingDialogState();
}

class _KittenNamingDialogState extends State<_KittenNamingDialog> {
  final _controller = TextEditingController(text: '子猫');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('子猫の名前を決めてあげましょう'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: const InputDecoration(hintText: '子猫'),
        textCapitalization: TextCapitalization.none,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: const Text('キャンセル'),
        ),
        FilledButton(
          onPressed: () {
            final name = _controller.text.trim();
            Navigator.of(context).pop(name.isEmpty ? '子猫' : name);
          },
          child: const Text('決定'),
        ),
      ],
    );
  }
}
