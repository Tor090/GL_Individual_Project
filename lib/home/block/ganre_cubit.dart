import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/ganre_state.dart';
import 'package:individual_project/model/ganre.dart';
import 'package:individual_project/service/api_moviedb.dart';

class GanreMovieCubit extends Cubit<GanreState>{
  GanreMovieCubit() : super(InitialState()){
    createGanreMovieList();
  }


  void createGanreMovieList() async{
    emit(LoadingState());
    List<Ganre> ganreMovieList = await getGenreList();
    emit(LoadedState(ganreMovieList));
  }

}