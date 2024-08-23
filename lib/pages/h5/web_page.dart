import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  String title = '';
  String path;

  WebPage(
    this.path, {
    super.key,
    this.title = '',
  });

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  String headerText = '';
  String url = '';

  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            _onLoaded();
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      );
    // ..loadRequest(Uri.parse('https://flutter.dev'));
    super.initState();
    print(widget.path);
    setState(() {
      headerText = widget.title;
      url = widget.path;
      controller.loadRequest(Uri.parse(widget.path));
    });
  }

  void _onLoaded() async {
    var value = await controller.getTitle();
    setState(() {
      headerText = value?.toString() ?? widget.title;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(headerText),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: WebViewWidget(controller: controller),
    );
  }
}
