import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/ganre_state.dart';
import 'package:individual_project/model/ganre.dart';
import 'package:individual_project/service/moviedb.dart';

class GanreMovieCubit extends Cubit<GanreState>{
  GanreMovieCubit({required this.movieDB}) : super(InitialState()){
    createGanreMovieList();
  }

  MovieDB movieDB;

  void createGanreMovieList() async{
    try{
    emit(LoadingState());
    List<Ganre> ganreMovieList = await movieDB.getGenreList();
    emit(LoadedState(ganreMovieList));
    }catch(e){
      emit(ErrorState());
    }
  }

}