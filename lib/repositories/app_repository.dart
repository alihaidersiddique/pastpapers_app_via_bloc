import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:papers_test_app/models/paper_model.dart';
import 'package:papers_test_app/models/subject_model.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class AppRepository {
  Future<List<SubjectModel>> prepareOlevelData() async {
    final box = await Hive.openBox('appBox');
    if (box.containsKey('olevels')) {
      return List<SubjectModel>.from(box.get('olevels'));
    } else {
      final jsonData = await root_bundle.rootBundle
          .loadString("assets/olevel_subjects.json");

      final data = List<SubjectModel>.from(
          json.decode(jsonData).map((x) => SubjectModel.fromJson(x)));

      await box.put('olevels', data);

      return List<SubjectModel>.from(box.get('olevels'));
    }
  }

  Future<List<SubjectModel>> prepareAlevelData() async {
    final box = await Hive.openBox('appBox');
    if (box.containsKey('alevels')) {
      return List<SubjectModel>.from(box.get('alevels'));
    } else {
      final jsonData = await root_bundle.rootBundle
          .loadString("assets/alevel_subjects.json");

      final data = List<SubjectModel>.from(
          json.decode(jsonData).map((x) => SubjectModel.fromJson(x)));

      await box.put('alevels', data);

      return List<SubjectModel>.from(box.get('alevels'));
    }
  }

  Future<void> updateFilePath(
    String courseName,
    String year,
    String paperName,
    String filePath,
  ) async {
    final box = await Hive.openBox('myBox');

    final data = box.get('myData');

    if (data is List<dynamic>) {
      final subjectModels = data.cast<SubjectModel>();
      for (final subject in subjectModels) {
        if (subject.courseName == courseName) {
          for (final yearlyPaper in subject.yearlyPapers) {
            if (yearlyPaper.year == year) {
              for (int i = 0; i < yearlyPaper.papers.length; i++) {
                if (yearlyPaper.papers[i].name == paperName) {
                  final updatedPaper = PaperModel(
                    course: yearlyPaper.papers[i].course,
                    type: yearlyPaper.papers[i].type,
                    name: yearlyPaper.papers[i].name,
                    paper: yearlyPaper.papers[i].paper,
                    variant: yearlyPaper.papers[i].variant,
                    season: yearlyPaper.papers[i].season,
                    year: yearlyPaper.papers[i].year,
                    link: yearlyPaper.papers[i].link,
                    filePath: filePath,
                  );
                  yearlyPaper.papers[i] = updatedPaper;
                  break;
                }
              }
              break;
            }
          }
          break;
        }
      }
      await box.put('myData', subjectModels);
    }
    debugPrint("pdf path added...");

    // await box.close();
  }

  Future<String> downloadPDF(String url, String fileName) async {
    EasyLoading.show(status: 'Downloading Paper');

    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final appDir = await getApplicationDocumentsDirectory();
    final file = File('${appDir.path}/$fileName');
    await file.writeAsBytes(bytes);

    EasyLoading.dismiss();
    debugPrint("pdf downloaded...");
    return file.path;
  }
}
