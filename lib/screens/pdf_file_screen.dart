import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFFileScreen extends StatelessWidget {
  final String filePath;
  final String fileName;

  PDFFileScreen({
    Key? key,
    required this.filePath,
    required this.fileName,
  }) : super(key: key);

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    debugPrint("File path of PDF Viewer: $filePath");
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
      ),
      body: SizedBox(
        child: SfPdfViewer.file(File(filePath), key: _pdfViewerKey),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
