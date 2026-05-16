import 'package:flutter/material.dart';

class CatProfileScreen extends StatelessWidget {
  final String catId;

  const CatProfileScreen({super.key, required this.catId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('猫プロフィール')),
      body: Center(child: Text('catId: $catId')),
    );
  }
}
