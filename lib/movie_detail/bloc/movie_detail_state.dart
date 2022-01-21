import 'package:equatable/equatable.dart';
import 'package:individual_project/model/movie_detail.dart';

abstract class MovieDetailState extends Equatable {}

class InitialState extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class LoadedState extends MovieDetailState {
  LoadedState(this.movieDetail);

  final MovieDetail movieDetail;

  @override
  List<Object> get props => [movieDetail];
}

class ErrorState extends MovieDetailState {
  @override
  List<Object> get props => [];
}