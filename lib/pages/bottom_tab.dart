import 'package:flutter/material.dart';
import 'package:flutter_app/common/color.dart';
import 'package:flutter_app/configs/constant.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home/home.dart';
import 'my/my.dart';
import 'push/push.dart';

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
    var screen = MediaQuery.of(context).size;
    Constants.screenWidth = screen.width;
    Constants.screenHeight = screen.height;

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
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_max_rounded),
                  activeIcon: Icon(Icons.home_max_outlined),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.push_pin_rounded), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_add),
                  activeIcon: Icon(Icons.my_library_add_outlined),
                  label: "")
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
