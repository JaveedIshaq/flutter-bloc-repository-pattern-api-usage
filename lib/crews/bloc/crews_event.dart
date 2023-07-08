part of 'crews_bloc.dart';

abstract class CrewsEvent extends Equatable {
  const CrewsEvent();

  @override
  List<Object> get props => [];
}

class GetCrewsDataEvent extends CrewsEvent {
  const GetCrewsDataEvent();

  @override
  List<Object> get props => [];
}
