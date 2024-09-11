import 'package:flutter/material.dart';

/// Author: Meng
/// Date: 2024-08-22
/// Modify: 2024-08-22
/// Desc: 我的
///

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyState();
  }
}

class _MyState extends State<MyPage> {
  @override
  void initState() {
    super.initState();
    print('my-------> initState');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MyPage'),
      ),
    );
  }
}
