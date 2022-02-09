import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:individual_project/service/moviedb.dart';

import '../../main.dart';
import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({required this.selectedGanre}) : super(InitialState()) {
    createMovieList(selectedGanre: selectedGanre);
  }

  final int selectedGanre;
  MovieDB movieDB = getIt<ApiMovieDb>();

  void createMovieList({required int selectedGanre}) async {
    try {
      emit(LoadingState());

      await getIt<MovieDao>().createMovieList(selectedGanre: selectedGanre);

      emit(LoadedState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
