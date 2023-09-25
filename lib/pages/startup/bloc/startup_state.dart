part of 'startup_bloc.dart';

//simple states

sealed class StartUpState extends Equatable {
  const StartUpState();

  @override
  List<Object> get props => [];
}

final class StartUpInitialState extends StartUpState {}

final class StartUpLoadingState extends StartUpState {}

final class StartUpSuccessState extends StartUpState {
  final Map<dynamic, dynamic> data;

  const StartUpSuccessState({required this.data});

  @override
  List<Object> get props => [data];
}

final class StartUpFailureState extends StartUpState {
  final String message;

  const StartUpFailureState(this.message);

  @override
  List<Object> get props => [message];
}

//action states

sealed class StartUpActionState extends StartUpState {}

class StartUpOlevelButtonPressedState extends StartUpActionState {
  final List<SubjectModel> subjects;

  StartUpOlevelButtonPressedState({required this.subjects});

  @override
  List<Object> get props => [subjects];
}

class StartUpAlevelButtonPressedState extends StartUpActionState {
  final List<SubjectModel> subjects;

  StartUpAlevelButtonPressedState({required this.subjects});

  @override
  List<Object> get props => [subjects];
}
