import 'package:flutter/material.dart';
import 'package:flutter_app/common/color.dart';
import 'package:flutter_app/utils/log/Log.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home/home.dart';
import 'my/my.dart';
import 'push/push.dart';

/// Author: Meng
/// Date: 2024-08-22
/// Modify: 2024-08-22
/// Desc:
///

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabState();
}

class _MainTabState extends State<MainTabPage> {
  static const List<Widget> _widgets = <Widget>[
    HomePage(),
    PushPage(),
    MyPage()
  ];
  int _curIndex = 0;

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

    final info = statuses[Permission.camera]!.isGranted
        ? 'Camera permission granted'
        : 'Camera permission denied';
    Log.i('permission', info);
  }

  void _onChangeTab(int index) {
    setState(() {
      _curIndex = index;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('底部Tab示例'),
      ),
      body: Center(
        child: _widgets.elementAt(_curIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '搜索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '个人中心',
          ),
        ],
        currentIndex: _curIndex,
        selectedItemColor: Color3.theme,
        onTap: _onChangeTab,
      ),
    );
  }
}
