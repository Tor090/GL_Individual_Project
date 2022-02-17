import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/search/bloc/search_state.dart';
import 'package:individual_project/service/moviedb.dart';

class SearchMovieCubit extends Cubit<SearchState> {
  SearchMovieCubit({required this.movieDB}) : super(InitialState());
  // {
  //   createSearchMovieList(query: query);
  // }

  MovieDB movieDB;
  //final String query;

  void createSearchMovieList({required String query}) async {
    try {
      emit(LoadingState());
      List<Movie> searchMovieList = await movieDB.getSearchMovieList(query);
      emit(LoadedState(searchMovieList));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
