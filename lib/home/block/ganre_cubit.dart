import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/data/database/database.dart';
import 'package:individual_project/home/block/ganre_state.dart';
import 'package:individual_project/model/ganre.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:individual_project/service/moviedb.dart';

import '../../main.dart';

class GanreMovieCubit extends Cubit<GanreState>{
  GanreMovieCubit() : super(InitialState()){
    createGanreMovieList();
  }

  MovieDB movieDB = getIt<ApiMovieDb>();

  void createGanreMovieList() async{
    try{
    emit(LoadingState());
    print('ganre 1');
    List<Ganre> ganreMovieList = await movieDB.getGenreList();
    getIt<MovieDao>().insertListGanre(ganreMovieList);
    print('ganre 3');
    emit(LoadedState(ganreMovieList));
    }catch(e){
      emit(ErrorState());
    }
  }

}