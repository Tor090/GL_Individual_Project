import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/service/moviedb.dart';

import '../../main.dart';
import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState>{
  MovieCubit({required this.selectedGanre, required this.query, required this.movieDB})
      : super(InitialState()){
    createMovieList(selectedGanre: selectedGanre, query: query);
  }

  final int selectedGanre;
  final String query;
  MovieDB movieDB;

  //final dao = getIt.get<AppDatabase>();

  void createMovieList({required int selectedGanre, required String query}) async{
    try{
      print('try');
    emit(LoadingState());
    List<Movie> movieList;
    if (selectedGanre == 0 && query == 'popular'){
      movieList = await movieDB.getPopularMovie();
      print('try1');
      //emit(movieList);
    } else if (selectedGanre == 0 && query == 'now_playing'){
        movieList = await movieDB.getNowPlayingMovie();
        print('try2');
       // emit(movieList);
    } else{
        movieList = await movieDB.getMovieByGanre(selectedGanre);
        print('try3');
        //emit(movieList);
    }

    // movieList.forEach((element) async {
    //   await getIt<MovieDao>().insertMovie(element);
    // });
      print('try111');
    //getIt<MovieDao>().replaceMovies(movieList);
    getIt<MovieDao>().insertListMovie(movieList);
      print('tryeeeeeee');
    emit(LoadedState(movieList));
    }catch(e){
      emit(ErrorState());
    }
  }

}