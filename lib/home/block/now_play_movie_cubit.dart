import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/service/api_moviedb.dart';

class NowPlayMovieCubit extends Cubit<List<Movie>>{
  NowPlayMovieCubit() : super([]);

  List<Movie> movieList = [];

  void createMovieList() async{
    movieList = await getNowPlayingMovie();
    //MovieLoaded(movieList);
    print('mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM==== ${movieList.length}');
    emit(movieList);
  }

}