// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:papers_test_app/models/yearly_paper_model.dart';
import 'package:papers_test_app/screens/lectures_screen.dart';
import 'package:papers_test_app/screens/notes_screen.dart';
import 'package:papers_test_app/screens/paper_years_screen.dart';
import 'package:papers_test_app/screens/widgets/add_bar_widget.dart';
import 'package:papers_test_app/screens/widgets/menu_tile_widget.dart';

import '../utils/app_colors.dart';
import '../utils/app_texts.dart';

class PaperItemsScreen extends StatelessWidget {
  const PaperItemsScreen({
    super.key,
    required this.yearlyPapers,
    required this.level,
    required this.course,
  });

  final List<YearlyPaperModel> yearlyPapers;
  final String level;
  final String course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            text: level,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: "\n$course",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          MenuTileWidget(
            title: "Pastpapers",
            icon: Icons.document_scanner_outlined,
            onTap: () {
              // Get.toNamed(
              //   AppText.paperYears,
              //   arguments: [yearlyPapers, level, course],
              // );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaperYearsScreen(
                    yearlyPapers: yearlyPapers,
                    level: level,
                    course: course,
                  ),
                ),
              );
            },
          ),
          MenuTileWidget(
            title: "Lectures",
            icon: Icons.video_collection_outlined,
            onTap: () {
              // Get.toNamed(
              //   AppText.lectures,
              //   arguments: [level, course],
              // );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LecturesScreen(
                    level: level,
                    course: course,
                  ),
                ),
              );
            },
          ),
          MenuTileWidget(
            title: "Notes",
            icon: Icons.notes_outlined,
            onTap: () {
              // Get.toNamed(
              //   AppText.notes,
              //   arguments: [level, course],
              // );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesScreen(
                    level: level,
                    course: course,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const AddBarWidget(),
    );
  }
}
