import 'package:flutter/material.dart';
import 'package:flutter_app/pages/bottom_tab2.dart';
import 'package:get/route_manager.dart';

import 'configs/constant.dart';
import 'pages/bottom_tab.dart';

void main() {
  runApp(const Launch());
}

class Launch extends StatelessWidget {
  const Launch({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      color: Colors.white,
      home: const LaunchPage(),
    );
  }
}

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchState();
}

class _LaunchState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();
    // 倒计时3秒
    Future.delayed(const Duration(seconds: 3), () {
      gotoHome();
    });
  }

  void gotoHome() {
    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => const MainTabPage()));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const BottomTab()));
  }

  @override
  Widget build(context) {
    var screen = MediaQuery.of(context).size;
    Constants.screenWidth = screen.width;
    Constants.screenHeight = screen.height;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset('lib/assets/imgs/empty.png',
          width: double.infinity, height: double.infinity, fit: BoxFit.fill),
    );
  }
}
