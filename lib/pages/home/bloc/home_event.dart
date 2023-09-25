part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoadEvent extends HomeEvent {
  final List<SubjectModel> subjects;

  const HomeLoadEvent({required this.subjects});

  @override
  List<Object> get props => [subjects];
}

class HomeEachSubjectPressedEvent extends HomeEvent {
  final SubjectModel subject;

  const HomeEachSubjectPressedEvent({required this.subject});

  @override
  List<Object> get props => [subject];
}

class HomeEachSubjectBookmarkPressedEvent extends HomeEvent {
  final SubjectModel subject;

  const HomeEachSubjectBookmarkPressedEvent({required this.subject});

  @override
  List<Object> get props => [subject];
}

class HomeSearchButtonPressedEvent extends HomeEvent {
  final String query;

  const HomeSearchButtonPressedEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class HomeBookmarksButtonPressedEvent extends HomeEvent {
  const HomeBookmarksButtonPressedEvent();

  @override
  List<Object> get props => [];
}
