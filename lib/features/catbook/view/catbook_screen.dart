import 'package:flutter/material.dart';

class CatbookScreen extends StatelessWidget {
  const CatbookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('猫図鑑')),
      body: const Center(child: Text('猫図鑑')),
    );
  }
}
