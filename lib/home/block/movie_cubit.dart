import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/service/moviedb.dart';

import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState>{
  MovieCubit({required this.selectedGanre, required this.query, required this.movieDB})
      : super(InitialState()){
    createMovieList(selectedGanre: selectedGanre, query: query!);
  }

  final int selectedGanre;
  final String? query;
  MovieDB movieDB;

  void createMovieList({int selectedGanre = 0, String query = ''}) async{
    try{
    emit(LoadingState());
    List<Movie> movieList;
    if (selectedGanre == 0 && query == 'popular'){
      movieList = await movieDB.getPopularMovie();
      //emit(movieList);
    } else if (selectedGanre == 0 && query == 'now_playing'){
        movieList = await movieDB.getNowPlayingMovie();
       // emit(movieList);
    } else{
        movieList = await movieDB.getMovieByGanre(selectedGanre);
        //emit(movieList);
    }
    emit(LoadedState(movieList));
    }catch(e){
      emit(ErrorState());
    }
  }

}