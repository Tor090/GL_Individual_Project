import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/service/api_moviedb.dart';

class PopularMovieCubit extends Cubit<List<Movie>>{
  PopularMovieCubit() : super([]);


  void createPopularMovieList({int selectedGanre = 0}) async{
    if (selectedGanre == 0){
    List<Movie> popularMovieList = await getPopularMovie();
    //MovieLoaded(movieList);
    //print('mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM==== ${popularMovieList.length}');
    emit(popularMovieList);
    }else{
      List<Movie> ganreMovieList = await getMovieByGanre(selectedGanre);
      emit(ganreMovieList);
    }
  }

}