import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/ganre_state.dart';
import 'package:individual_project/model/ganre.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:individual_project/service/moviedb.dart';

class GanreMovieCubit extends Cubit<GanreState>{
  GanreMovieCubit() : super(InitialState()){
    createGanreMovieList();
  }

  MovieDB movieDB = ApiMovieDb();

  void createGanreMovieList() async{
    emit(LoadingState());
    List<Ganre> ganreMovieList = await movieDB.getGenreList();
    emit(LoadedState(ganreMovieList));
  }

}