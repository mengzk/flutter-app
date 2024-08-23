import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// Author: Meng
/// Date: 2024-08-22
/// Modify: 2024-08-22
/// Desc:
///

class BottomTab extends StatelessWidget {
  const BottomTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('BottomTab'),
      ),
    );
  }
}

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabState();
}

class _TabState extends State<TabPage> {
  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  void _requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.photos,
      Permission.camera,
    ].request();

    // final info = statuses[Permission.camera]!.isGranted
    //     ? 'Camera permission granted'
    //     : 'Camera permission denied';
    // print('-----> $info');
  }

  @override
  Widget build(context) {
    return const Scaffold(
      body: Center(
        child: Text('TabPage'),
      ),
    );
  }
}
