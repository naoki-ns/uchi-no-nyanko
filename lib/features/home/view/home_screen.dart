import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('うちのにゃんこ')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('ホーム（仮）', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 24),
            // --- 動作確認用ボタン（Task05以降で削除） ---
            ElevatedButton(
              onPressed: () => context.push('/cat/test-cat-001'),
              child: const Text('/cat/:id（モーダル確認）'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.push('/room/edit'),
              child: const Text('/room/edit（Push確認）'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.push('/settings'),
              child: const Text('/settings（Push確認）'),
            ),
          ],
        ),
      ),
    );
  }
}
