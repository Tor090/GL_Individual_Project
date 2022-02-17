import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/home/block/ganre/ganre_state.dart';
import 'package:individual_project/service/moviedb.dart';

class GanreMovieCubit extends Cubit<GanreState> {
  GanreMovieCubit({required this.movieDB, required this.movieDao})
      : super(InitialState());
  // {
  //   createGanreMovieList();
  // }

  MovieDB movieDB;
  MovieDao movieDao;

  void createGanreMovieList() async {
    try {
      emit(LoadingState());
      print('ganre 1');

      await movieDao.createGanreList(apiMovieDb: movieDB);

      print('ganre 3');
      emit(LoadedState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
