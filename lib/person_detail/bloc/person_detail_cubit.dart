import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/person.dart';
import 'package:individual_project/person_detail/bloc/person_detail_state.dart';
import 'package:individual_project/service/api_moviedb.dart';

class PersonDetailCubit extends Cubit<PersonDetailState>{
  PersonDetailCubit({required this.personId}) : super(InitialState()){
    createMovieDetailList(personId: personId);
  }

  final int personId;
  void createMovieDetailList({required int personId}) async{
    emit(LoadingState());
    Person person = await getPerson(personId);
    emit(LoadedState(person));
  }

}