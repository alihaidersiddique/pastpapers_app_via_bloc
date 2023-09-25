part of 'startup_bloc.dart';

sealed class StartUpEvent extends Equatable {
  const StartUpEvent();

  @override
  List<Object> get props => [];
}

class StartUpLoadEvent extends StartUpEvent {
  const StartUpLoadEvent();

  @override
  List<Object> get props => [];
}

class StartUpOlevelButtonPressedEvent extends StartUpEvent {
  final List<SubjectModel> subjects;

  const StartUpOlevelButtonPressedEvent({required this.subjects});

  @override
  List<Object> get props => [subjects];
}

class StartUpAlevelButtonPressedEvent extends StartUpEvent {
  final List<SubjectModel> subjects;

  const StartUpAlevelButtonPressedEvent({required this.subjects});

  @override
  List<Object> get props => [subjects];
}
