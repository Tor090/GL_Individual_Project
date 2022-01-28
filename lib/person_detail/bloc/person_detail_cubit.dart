import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/person.dart';
import 'package:individual_project/person_detail/bloc/person_detail_state.dart';
import 'package:individual_project/service/moviedb.dart';

class PersonDetailCubit extends Cubit<PersonDetailState>{
  PersonDetailCubit({required this.personId, required this.movieDB}) : super(InitialState()){
    createMovieDetailList(personId: personId);
  }

  MovieDB movieDB;

  final int personId;
  void createMovieDetailList({required int personId}) async{
    emit(LoadingState());
    Person person = await movieDB.getPerson(personId);
    emit(LoadedState(person));
  }

}