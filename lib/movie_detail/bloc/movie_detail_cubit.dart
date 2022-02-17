import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie_detail.dart';
import 'package:individual_project/service/moviedb.dart';

import 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit({required this.movieDB}) : super(InitialState());
  // {
  //   createMovieDetailList(movieId: movieId);
  // }

  final MovieDB movieDB;

  void createMovieDetailList({required int movieId}) async {
    try {
      emit(LoadingState());

      MovieDetail movieDetail = await movieDB.getMovieDetail(movieId);

      emit(LoadedState(movieDetail));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
