import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie_detail.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:individual_project/service/moviedb.dart';

import 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState>{
  MovieDetailCubit({required this.movieId}) : super(InitialState()){
  createMovieDetailList(movieId: movieId);
  }

  MovieDB movieDB = ApiMovieDb();
  final int movieId;

  void createMovieDetailList({required int movieId}) async{
    emit(LoadingState());
    MovieDetail movieDetail = await movieDB.getMovieDetail(movieId);
    emit(LoadedState(movieDetail));
  }

}