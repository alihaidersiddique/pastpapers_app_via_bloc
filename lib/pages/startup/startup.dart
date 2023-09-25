import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papers_test_app/pages/home/home.dart';
import 'package:papers_test_app/pages/startup/bloc/startup_bloc.dart';
import 'package:papers_test_app/utils/app_colors.dart';
import 'package:papers_test_app/utils/app_texts.dart';

import 'widgets/startup_widgets.dart';

class Startup extends StatelessWidget {
  const Startup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StartUpBloc, StartUpState>(
        listenWhen: (previous, current) => current is StartUpActionState,
        buildWhen: (previous, current) => current is! StartUpActionState,
        listener: (context, listeningState) {
          if (listeningState is StartUpOlevelButtonPressedState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(
                  level: "O-Level",
                  subjects: listeningState.subjects,
                ),
              ),
            );
          } else if (listeningState is StartUpAlevelButtonPressedState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(
                  level: "A-Level",
                  subjects: listeningState.subjects,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case StartUpLoadingState:
              return const Center(child: CircularProgressIndicator());

            case StartUpSuccessState:
              final successState = state as StartUpSuccessState;

              return ColoredBox(
                color: AppColors.primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCourseWidget(
                      AppText.oLogo,
                      AppText.olevels,
                      () {
                        context.read<StartUpBloc>().add(
                              StartUpOlevelButtonPressedEvent(
                                subjects: successState.data["olevel"],
                              ),
                            );
                      },
                    ),
                    const SizedBox(height: 20.0),
                    buildCourseWidget(
                      AppText.aLogo,
                      AppText.alevels,
                      () {
                        context.read<StartUpBloc>().add(
                              StartUpAlevelButtonPressedEvent(
                                subjects: successState.data["alevel"],
                              ),
                            );
                      },
                    ),
                  ],
                ),
              );

            case StartUpFailureState:
              final errorState = state as StartUpFailureState;
              return Center(
                child: Text("Error found:\n ${errorState.message}"),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
