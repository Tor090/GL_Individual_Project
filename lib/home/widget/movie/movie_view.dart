import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/home/block/movie_cubit.dart';
import 'package:individual_project/home/block/movie_state.dart';
import 'package:individual_project/model/movie.dart';

import '../../../main.dart';
import '../horisontal_display.dart';

class MovieView extends StatelessWidget {
  final double height, width;
  final int selectedGanre;
  final String query;
  const MovieView({Key? key,
    required this.height,
    required this.width,
    required this.selectedGanre,
    required this.query
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return stream();
  }

  Widget stream(){
  final dao = getIt<MovieDao>();
  //dao.deleteAllMovies();
  return StreamBuilder<List<Movie>>(
  stream: dao.findPopularMovie(query,selectedGanre),
  builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
  if(snapshot.hasData){
  List<Movie> movies = snapshot.data!;
  return HorisontalDisplay(
  movies: movies, height: height, width: width);
  } else {
  return bloc();
  }
  });
}

Widget bloc(){
  return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),);
        } else if (state is ErrorState) {
          return const Center(
            child: Icon(Icons.close),);
        } else if (state is LoadedState) {
          return stream();
        }else{
          return Container();
        }
      });
  }
}


