import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    // var padding = MediaQuery.of(context).padding;
    // Constants.ScreenTop = padding.top;
    // Constants.ScreenBottom = padding.bottom;
    return const HomeLayout();
    // MaterialApp(
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
    //     useMaterial3: true,
    //   ),
    //   home: const HomeLayout(),
    //   builder: EasyLoading.init(),
    // );
  }
}

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late final AppLifecycleListener _listener;
  int _curIndex = 0;
  bool inited = false;

  @override
  void initState() {
    super.initState();

    initAccount();
    _requestPermissions();
  }

  @override
  void dispose() {
    // _listener.dispose();
    super.dispose();
  }

  void _homeEvent(data) {
    print(data);
    var action = data['action'];
    switch (action) {
      case 'login':
        initAccount();
        break;
      case 'gotoLogin':
        setState(() {
          _curIndex = 0;
        });
        break;
      case 'resetLogin':
        initAccount();
        break;
      default:
        break;
    }
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

  void initAccount() async {}

  // Listen to the app lifecycle state changes
  void _onStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.resumed:
        initAccount();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.paused:
        break;
    }
  }

  @override
  Widget build(context) {
    var screen = MediaQuery.of(context).size;
    // Constants.screenWidth = screen.width;
    // Constants.screenHeight = screen.height;

    return Scaffold(
      body: IndexedStack(
        index: _curIndex,
        children: [
          const Text('首页'),
          const Text('发布'),
          const Text('我的'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '发布',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
        currentIndex: _curIndex,
        selectedItemColor: Colors.amber,
        onTap: (index) {
          setState(() {
            _curIndex = index;
          });
        },
      ),
    );
  }
}
