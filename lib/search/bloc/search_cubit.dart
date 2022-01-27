import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/search/bloc/search_state.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:individual_project/service/moviedb.dart';

class SearchMovieCubit extends Cubit<SearchState>{
  SearchMovieCubit({required this.query}) : super(InitialState()){
    createSearchMovieList(query: query);
  }

  MovieDB movieDB = ApiMovieDb();
  final String query;

  void createSearchMovieList({required String query}) async{
    emit(LoadingState());
    List<Movie> searcMovieList = await movieDB.getSearchMovieList(query);
    emit(LoadedState(searcMovieList));
  }

}