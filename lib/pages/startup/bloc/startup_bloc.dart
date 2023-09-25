import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papers_test_app/models/subject_model.dart';

import '../../../repositories/app_repository.dart';

part 'startup_event.dart';
part 'startup_state.dart';

class StartUpBloc extends Bloc<StartUpEvent, StartUpState> {
  final AppRepository appRepository;

  StartUpBloc({required this.appRepository}) : super(StartUpInitialState()) {
    on<StartUpLoadEvent>(onStartUpLoadEvent);
    on<StartUpOlevelButtonPressedEvent>(onStartUpOlevelButtonPressedEvent);
    on<StartUpAlevelButtonPressedEvent>(onStartUpAlevelButtonPressedEvent);
  }

  FutureOr<void> onStartUpLoadEvent(
    StartUpLoadEvent event,
    Emitter<StartUpState> emit,
  ) async {
    emit(StartUpLoadingState());
    try {
      final olevelData = await appRepository.prepareOlevelData();
      final alevelData = await appRepository.prepareAlevelData();
      if (olevelData.isNotEmpty && alevelData.isNotEmpty) {
        final data = {
          "olevel": olevelData,
          "alevel": alevelData,
        };
        emit(StartUpSuccessState(data: data));
      } else {
        emit(const StartUpFailureState("error while loading data"));
      }
    } catch (e) {
      debugPrint("error while loading data : $e");
      emit(StartUpFailureState(e.toString()));
    }
  }

  FutureOr<void> onStartUpOlevelButtonPressedEvent(
    StartUpOlevelButtonPressedEvent event,
    Emitter<StartUpState> emit,
  ) {
    emit(StartUpOlevelButtonPressedState(subjects: event.subjects));
  }

  FutureOr<void> onStartUpAlevelButtonPressedEvent(
    StartUpAlevelButtonPressedEvent event,
    Emitter<StartUpState> emit,
  ) {
    emit(StartUpAlevelButtonPressedState(subjects: event.subjects));
  }
}
