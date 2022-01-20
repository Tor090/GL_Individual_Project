import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/ganre.dart';
import 'package:individual_project/service/api_moviedb.dart';

class GanreMovieCubit extends Cubit<List<Ganre>>{
  GanreMovieCubit() : super([]);


  void createGanreMovieList() async{
    List<Ganre> ganreMovieList = await getGenreList();

    emit(ganreMovieList);
  }

}