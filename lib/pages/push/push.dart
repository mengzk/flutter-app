import 'package:flutter/material.dart';

/// Author: Meng
/// Date: 2024-08-22
/// Modify: 2024-08-22
/// Desc: 发布
///

class PushPage extends StatefulWidget {
  const PushPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PushState();
  }
}

class _PushState extends State<PushPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('PushPage'),
      ),
    );
  }
}
