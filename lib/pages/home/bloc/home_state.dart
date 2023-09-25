part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

//simple states

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadSuccessState extends HomeState {
  final List<SubjectModel> subjects;

  const HomeLoadSuccessState({required this.subjects});

  @override
  List<Object> get props => [subjects];
}

final class HomeLoadFailureState extends HomeState {
  final String message;

  const HomeLoadFailureState({required this.message});

  @override
  List<Object> get props => [message];
}

//action states
sealed class HomeActionState extends HomeState {}

class HomeEachSubjectPressedState extends HomeActionState {
  final SubjectModel subject;

  HomeEachSubjectPressedState({required this.subject});

  @override
  List<Object> get props => [subject];
}

class HomeEachSubjectBookmarkPressedState extends HomeActionState {
  final SubjectModel subject;

  HomeEachSubjectBookmarkPressedState({required this.subject});

  @override
  List<Object> get props => [subject];
}

class HomeSearchButtonPressedState extends HomeActionState {
  final String query;

  HomeSearchButtonPressedState({required this.query});

  @override
  List<Object> get props => [query];
}

class HomeBookmarksButtonPressedState extends HomeActionState {}
