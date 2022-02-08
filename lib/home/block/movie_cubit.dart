import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/model/ganre_movie_id.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:individual_project/service/moviedb.dart';

import '../../main.dart';
import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState>{
  MovieCubit({required this.selectedGanre})
      : super(InitialState()){
    createMovieList(selectedGanre: selectedGanre);
  }

  final int selectedGanre;
  MovieDB movieDB = getIt<ApiMovieDb>();


  void createMovieList({required int selectedGanre}) async{
    try{
    emit(LoadingState());
    List<Movie> movieList;
    // getIt<MovieDao>().deleteAllMovies();
    // getIt<MovieDao>().deleteAllGanre();
    // getIt<MovieDao>().deleteAllGanreAndMovies();
    if (selectedGanre == 2){
      movieList = await movieDB.getPopularMovie();
      print('try1');
    } else if (selectedGanre == 1){
        movieList = await movieDB.getNowPlayingMovie();
        print('try2');
    } else{
        movieList = await movieDB.getMovieByGanre(selectedGanre);
        print('try3');
    }
    getIt<MovieDao>().insertListMovie(movieList);
    print('insert m + try to GandM');
    movieList.forEach((element) {
      getIt<MovieDao>().insertGanreAndMovie(
          GanreAndMovie(
              ganreId: selectedGanre,
              movieId: element.id));
    });
      print('tryeeeeeee');
    emit(LoadedState());
    }catch(e){
      emit(ErrorState());
    }
  }

}