import 'package:bloc/bloc.dart';
import 'package:blocwithapi/crews/data/crew_repository.dart';
import 'package:blocwithapi/crews/data/spacex_crew_model.dart';
import 'package:equatable/equatable.dart';

part 'crews_event.dart';
part 'crews_state.dart';

class CrewsBloc extends Bloc<CrewsEvent, CrewsState> {
  CrewRepository repository;

  CrewsBloc({required this.repository}) : super(CrewsInitial()) {
    on<GetCrewsDataEvent>((event, emit) async {
      emit(CrewsLoading());
      //
      try {
        final result = await repository.requestGetCrewsData();

        emit(CrewsLoaded(crewsData: result));
      } on Exception catch (e) {
        emit(
          CrewsError(errorMessage: e.toString()),
        );
      }
    });
  }
}
