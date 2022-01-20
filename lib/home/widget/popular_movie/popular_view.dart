import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/popular_movie_cubit.dart';
import 'package:individual_project/model/movie.dart';

import '../horisontal_display.dart';

class PopularView extends StatefulWidget {
  final int selectedGanre;
  const PopularView({Key? key, required this.selectedGanre}) : super(key: key);

  @override
  _PopularViewState createState() => _PopularViewState(selectedGanre);
}

class _PopularViewState extends State<PopularView> {
  late int selectedGanre;
  _PopularViewState(this.selectedGanre);
  PopularMovieCubit popularMovieCubit = PopularMovieCubit();

  @override
  void initState() {

    popularMovieCubit.createPopularMovieList(selectedGanre: selectedGanre);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieCubit,List<Movie>>(
        bloc: popularMovieCubit,
        builder: (context, state) {
          List<Movie> movies = state;
          return  HorisontalDisplay(movies: movies, height: 3, width: 1.7);
        });
  }
}
