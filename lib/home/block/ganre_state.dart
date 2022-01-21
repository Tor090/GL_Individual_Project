import 'package:equatable/equatable.dart';
import 'package:individual_project/model/ganre.dart';


abstract class GanreState extends Equatable {}

class InitialState extends GanreState {
  @override
  List<Object> get props => [];
}

class LoadingState extends GanreState {
  @override
  List<Object> get props => [];
}

class LoadedState extends GanreState {
  LoadedState(this.ganreMovieList);

  final List<Ganre> ganreMovieList;

  @override
  List<Object> get props => [ganreMovieList];
}

class ErrorState extends GanreState {
  @override
  List<Object> get props => [];
}