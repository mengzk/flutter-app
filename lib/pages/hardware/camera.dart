import 'package:flutter/material.dart';

/// Author: Meng
/// Date: 2024-08-23
/// Modify: 2024-08-23
/// Desc:
///
class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Camera Page'),
      ),
    );
  }
}
