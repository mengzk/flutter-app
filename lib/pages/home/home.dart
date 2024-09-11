import 'package:flutter/material.dart';

/// Author: Meng
/// Date: 2024-08-22
/// Modify: 2024-08-22
/// Desc: 首页
///

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print('home-------> initState');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('HomePage'),
      ),
    );
  }
}
