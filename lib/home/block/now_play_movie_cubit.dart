import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/service/api_moviedb.dart';

class NowPlayMovieCubit extends Cubit<List<Movie>>{
  NowPlayMovieCubit() : super([]);

  void createNowPlayMovieList() async{
    List<Movie> movieList = await getNowPlayingMovie();
    emit(movieList);
  }

}