import 'package:flutter/material.dart';
import 'package:flutter_app/common/color.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home/home.dart';
import 'my/my.dart';
import 'push/push.dart';

/// Author: Meng
/// Date: 2024-08-22
/// Modify: 2024-08-22
/// Desc:
///

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _TabState();
}

class _TabState extends State<BottomTab> {
  final List<Widget> _pageList = [
    const HomePage(),
    const SizedBox.shrink(),
    const MyPage()
  ];

  var _curIndex = 0;

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
    return Scaffold(
        body: IndexedStack(
          index: _curIndex,
          children: _pageList,
        ),
        bottomNavigationBar: _bottomNavigate());
  }

  Widget _bottomNavigate() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: Color3.btnColors,
        ),
      ),
      child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _curIndex,
            elevation: 0,
            selectedFontSize: 1,
            unselectedFontSize: 1,
            backgroundColor: Colors.transparent,
            selectedItemColor: Color3.theme,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.mail_lock), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "发布"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline), label: "我的")
            ],
            onTap: (int index) {
              setState(() {
                if (index != 1) {
                  _curIndex = index;
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PushPage(),
                    ),
                  );
                }
              });
            },
          )),
    );
  }
}
