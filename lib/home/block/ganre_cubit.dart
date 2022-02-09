import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/home/block/ganre_state.dart';

import '../../main.dart';

class GanreMovieCubit extends Cubit<GanreState> {
  GanreMovieCubit() : super(InitialState()) {
    createGanreMovieList();
  }

  //MovieDB movieDB = getIt<ApiMovieDb>();

  void createGanreMovieList() async {
    try {
      emit(LoadingState());
      print('ganre 1');

      await getIt<MovieDao>().createGanreList();

      print('ganre 3');
      emit(LoadedState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
