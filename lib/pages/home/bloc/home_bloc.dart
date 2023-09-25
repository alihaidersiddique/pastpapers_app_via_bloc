import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papers_test_app/models/subject_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoadEvent>(onHomeLoadEvent);
    on<HomeEachSubjectPressedEvent>(onHomeEachSubjectPressedEvent);
    on<HomeEachSubjectBookmarkPressedEvent>(
      onHomeEachSubjectBookmarkPressedEvent,
    );
    on<HomeSearchButtonPressedEvent>(onHomeSearchButtonPressedEvent);
    on<HomeBookmarksButtonPressedEvent>(onHomeBookmarksButtonPressedEvent);
  }

  FutureOr<void> onHomeLoadEvent(
    HomeLoadEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeLoadingState());
    try {
      emit(HomeLoadSuccessState(subjects: event.subjects));
    } catch (e) {
      emit(HomeLoadFailureState(message: e.toString()));
    }
  }

  FutureOr<void> onHomeEachSubjectPressedEvent(
    HomeEachSubjectPressedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeEachSubjectPressedState(subject: event.subject));
  }

  FutureOr<void> onHomeEachSubjectBookmarkPressedEvent(
    HomeEachSubjectBookmarkPressedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeEachSubjectBookmarkPressedState(subject: event.subject));
  }

  FutureOr<void> onHomeSearchButtonPressedEvent(
    HomeSearchButtonPressedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeSearchButtonPressedState(query: event.query));
  }

  FutureOr<void> onHomeBookmarksButtonPressedEvent(
    HomeBookmarksButtonPressedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeBookmarksButtonPressedState());
  }
}
