import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFLinkScreen extends StatelessWidget {
  final String link;
  final String fileName;

  PDFLinkScreen({
    Key? key,
    required this.link,
    required this.fileName,
  }) : super(key: key);

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    debugPrint("link of PDF Viewer: $link");
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
      ),
      body: SizedBox(
        child: SfPdfViewer.network(link, key: _pdfViewerKey),
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
