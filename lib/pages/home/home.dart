import 'package:flutter/material.dart';
import 'package:papers_test_app/models/subject_model.dart';
import 'package:papers_test_app/screens/paper_items_screen.dart';
import 'package:papers_test_app/screens/widgets/add_bar_widget.dart';
import 'package:papers_test_app/screens/widgets/app_drawer_widget.dart';
import 'package:papers_test_app/screens/widgets/medium_text_widget.dart';
import 'package:papers_test_app/screens/widgets/subject_tile_widget.dart';
import 'package:papers_test_app/utils/app_colors.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
    required this.level,
    required this.subjects,
  }) : super(key: key);

  final List<SubjectModel> subjects;

  final String level;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawerWidget(),
      appBar: AppBar(
        title: _isSearching
            ? _buildSearchField()
            : Text(
                widget.level,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
        actions: [
          IconButton(
            icon: _isSearching
                ? const Icon(Icons.close)
                : const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });

              if (!_isSearching) {
                _searchController.clear();
                // _filteredSubjectsController
                //     .updateFilteredSubjects(widget.subjects);
              }
            },
          ),
          IconButton(
            onPressed: () {
              //   Get.toNamed(
              //   AppText.subjectsBookmarked,
              //   arguments: widget.level,
              // );
            },
            icon: const Icon(Icons.collections_bookmark_outlined),
          ),
        ],
      ),
      body: SizedBox(
        child: ListView.separated(
          padding: const EdgeInsets.all(20.0),
          separatorBuilder: (context, index) => const SizedBox(height: 20.0),
          itemCount: widget.subjects.length,
          itemBuilder: (context, index) {
            final subject = widget.subjects[index];

            return SubjectTileWidget(
              courseCode: MediumTextWidget(text: subject.courseCode.toString()),
              courseName: MediumTextWidget(
                text: subject.courseName,
                color: Colors.white,
              ),
              bookmarkIcon: IconButton(
                onPressed: () {
                  // _loadDataController.updateBookmarkStatus(
                  //   subject,
                  //   !subject.isBookmarked,
                  //   _filteredSubjectsController.filteredSubjects,
                  // );
                },
                icon: const Icon(
                  Icons.bookmark_border,
                  color: AppColors.primaryColor,
                ),
              ),
              onTap: () {
                //   Get.toNamed(
                //   AppText.paperItems,
                //   arguments: [
                //     subject.yearlyPapers,
                //     widget.level,
                //     "${subject.courseName} (${subject.courseCode})",
                //   ],
                // );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaperItemsScreen(
                      yearlyPapers: subject.yearlyPapers,
                      level: subject.level,
                      course: subject.courseName,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: const AddBarWidget(),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      cursorColor: Colors.white,
      autofocus: true,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
      onChanged: (value) {
        // _filteredSubjectsController
        //     .updateFilteredSubjects(widget.subjects.where((subject) {
        //   final titleLower = subject.courseName.toLowerCase();
        //   final courseCode = subject.courseCode.toString();
        //   final searchLower = value.toLowerCase();

        //   return titleLower.contains(searchLower) ||
        //       courseCode.contains(searchLower);
        // }).toList());
      },
    );
  }
}
