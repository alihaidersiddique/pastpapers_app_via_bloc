import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:papers_test_app/pages/startup/bloc/startup_bloc.dart';
import 'package:papers_test_app/repositories/app_repository.dart';
import 'package:papers_test_app/models/paper_model.dart';
import 'package:papers_test_app/models/subject_model.dart';
import 'package:papers_test_app/models/yearly_paper_model.dart';
import 'package:papers_test_app/pages/startup/startup.dart';
import 'package:papers_test_app/theme.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SubjectModelAdapter());
  Hive.registerAdapter(PaperModelAdapter());
  Hive.registerAdapter(YearlyPaperModelAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(create: (context) => AppRepository()),
        BlocProvider(
          create: (context) => StartUpBloc(
            appRepository: RepositoryProvider.of<AppRepository>(context),
          )..add(const StartUpLoadEvent()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const Startup(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
