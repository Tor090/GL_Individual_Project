import 'package:equatable/equatable.dart';
import 'package:individual_project/model/movie.dart';

abstract class MovieState extends Equatable {}

class InitialState extends MovieState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MovieState {
  @override
  List<Object> get props => [];
}

class LoadedState extends MovieState {
  //LoadedState(this.movieList);

  //final List<Movie> movieList;

  @override
  List<Object> get props => [];
}

class ErrorState extends MovieState {
  @override
  List<Object> get props => [];
}