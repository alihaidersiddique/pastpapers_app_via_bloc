// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:papers_test_app/models/paper_model.dart';
import 'package:papers_test_app/screens/pdf_file_screen.dart';
import 'package:papers_test_app/screens/pdf_link_screen.dart';
import 'package:papers_test_app/utils/app_colors.dart';

class PaperCard extends StatelessWidget {
  PaperModel paper;

  PaperCard({
    required this.paper,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () {
          if (paper.filePath.isEmpty) {
            debugPrint(paper.filePath);
            debugPrint("opening pdf from link");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PDFLinkScreen(
                  link: paper.link,
                  fileName: paper.name,
                ),
              ),
            );

            // BlocProvider.of<DataBloc>(context).add(
            //   LoadPDFEvent(
            //     courseName: paper.course,
            //     year: paper.course,
            //     paperName: paper.name,
            //     link: paper.link,
            //     fileName: paper.name,
            //   ),
            // );
          } else {
            debugPrint("opening pdf from filePath");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PDFFileScreen(
                  filePath: paper.filePath,
                  fileName: paper.name,
                ),
              ),
            );
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                color: AppColors.primaryColor,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  '${paper.season} ${paper.year}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Text(
              paper.type,
              textScaleFactor: 2.0,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Paper ${paper.paper}'),
                  Text('Variant ${paper.variant}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
