import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/service/moviedb.dart';

import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({required this.movieDB, required this.movieDao})
      : super(InitialState());

  final MovieDB movieDB;
  final MovieDao movieDao;

  void createMovieList({required int selectedGanre}) async {
    try {
      emit(LoadingState());

      await movieDao.createMovieList(
          apiMovieDb: movieDB, selectedGanre: selectedGanre);

      emit(LoadedState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
