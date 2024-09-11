import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFPage extends StatefulWidget {
  final String title;
  final String path;

  const PDFPage(
    this.path, {
    super.key,
    this.title = "查看文档",
  });

  @override
  State<PDFPage> createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  String headerText = '';
  String url = '';
  // String _destPath = '';

  @override
  void initState() {
    super.initState();

    setState(() {
      headerText = widget.title;
    });
  }

  void downPdf() async {
    // print(_destPath);
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
      body: url.isEmpty
          ? Container()
          : PDFView(
              filePath: url,
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: true,
              pageSnap: true,
              fitPolicy: FitPolicy.BOTH,
              onRender: (_pages) {
                setState(() {
                  // pages = _pages;
                  // isReady = true;
                });
              },
              onError: (error) {
                print('err -----> ${error.toString()}');
              },
              onPageError: (page, error) {
                print('-------> $page: ${error.toString()}');
              },
              onPageChanged: (page, total) {
                print('page change: $page/$total');
              },
            ),
    );
  }
}
