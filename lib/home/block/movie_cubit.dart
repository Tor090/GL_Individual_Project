import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/service/api_moviedb.dart';

class MovieCubit extends Cubit<List<Movie>>{
  MovieCubit() : super([]);


  void createPopularMovieList({int selectedGanre = 0, String query = ''}) async{
    List<Movie> movieList;
    if (selectedGanre == 0 && query == 'popular'){
      movieList = await getPopularMovie();
      emit(movieList);
    } else if (selectedGanre == 0 && query == 'now_playing'){
        movieList = await getNowPlayingMovie();
        emit(movieList);
    } else{
        movieList = await getMovieByGanre(selectedGanre);
        emit(movieList);
    }
  }

}