part of 'crews_bloc.dart';

abstract class CrewsState extends Equatable {
  const CrewsState();

  @override
  List<Object> get props => [];
}

class CrewsInitial extends CrewsState {}

class CrewsLoading extends CrewsState {}

class CrewsLoaded extends CrewsState {
  final List<SpaceXCrew> crewsData;

  const CrewsLoaded({
    required this.crewsData,
  });

  @override
  List<Object> get props => [crewsData];
}

class CrewsError extends CrewsState {
  final String errorMessage;

  const CrewsError({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
