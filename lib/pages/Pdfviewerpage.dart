import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class PDFViewerPage extends StatefulWidget {
  final String pdfAssetPath;
  final String bookTitle;

  const PDFViewerPage({
    super.key,
    required this.pdfAssetPath,
    required this.bookTitle,
  });

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  String? localFilePath;

  @override
  void initState() {
    super.initState();
    _preparePDF();
  }

  Future<void> _preparePDF() async {
    final file = await _loadPDFAsset(widget.pdfAssetPath);
    setState(() {
      localFilePath = file.path;
    });
  }

  Future<File> _loadPDFAsset(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/book.pdf');
    return await tempFile.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookTitle),
        backgroundColor: Colors.amber,
      ),
      body: localFilePath != null
          ? PDFView(
        filePath: localFilePath,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: true,
        pageFling: true,
        onRender: (_pages) {
          setState(() {});
        },
        onError: (error) {
        },
        onPageError: (page, error) {
        },
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  PDFView({String? filePath, required bool enableSwipe, required bool swipeHorizontal, required bool autoSpacing, required bool pageFling, required Null Function(dynamic _pages) onRender, required Null Function(dynamic error) onError, required Null Function(dynamic page, dynamic error) onPageError}) {}

  getTemporaryDirectory() {}
}
