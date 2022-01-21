import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/service/api_moviedb.dart';

import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState>{
  MovieCubit({required this.selectedGanre, required this.query}) : super(InitialState()){
    createMovieList(selectedGanre: selectedGanre, query: query);
  }

  final int selectedGanre;
  final String query;

  void createMovieList({int selectedGanre = 0, String query = ''}) async{
    emit(LoadingState());
    List<Movie> movieList;
    if (selectedGanre == 0 && query == 'popular'){
      movieList = await getPopularMovie();
      //emit(movieList);
    } else if (selectedGanre == 0 && query == 'now_playing'){
        movieList = await getNowPlayingMovie();
       // emit(movieList);
    } else{
        movieList = await getMovieByGanre(selectedGanre);
        //emit(movieList);
    }
    emit(LoadedState(movieList));
  }

}