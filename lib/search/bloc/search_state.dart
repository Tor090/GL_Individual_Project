import 'package:equatable/equatable.dart';
import 'package:individual_project/model/movie.dart';


abstract class SearchState extends Equatable {}

class InitialState extends SearchState {
  @override
  List<Object> get props => [];
}

class LoadingState extends SearchState {
  @override
  List<Object> get props => [];
}

class LoadedState extends SearchState {
  LoadedState(this.searchMovieList);

  final List<Movie> searchMovieList;

  @override
  List<Object> get props => [searchMovieList];
}

class ErrorState extends SearchState {
  @override
  List<Object> get props => [];
}