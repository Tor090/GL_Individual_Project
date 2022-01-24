import 'package:equatable/equatable.dart';
import 'package:individual_project/model/person.dart';

abstract class PersonDetailState extends Equatable {}

class InitialState extends PersonDetailState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PersonDetailState {
  @override
  List<Object> get props => [];
}

class LoadedState extends PersonDetailState {
  LoadedState(this.person);

  final Person person;

  @override
  List<Object> get props => [person];
}

class ErrorState extends PersonDetailState {
  @override
  List<Object> get props => [];
}