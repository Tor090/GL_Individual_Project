import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/movie_cubit.dart';
import 'package:individual_project/model/movie.dart';

import '../horisontal_display.dart';

class MovieView extends StatefulWidget {
  final int selectedGanre;
  final String query;
  final double height, width;
  const MovieView({Key? key,
    required this.selectedGanre,
    required this.query,
    required this.height,
    required this.width}) : super(key: key);

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
   MovieCubit movieCubit = MovieCubit();

  @override
  void initState() {
    movieCubit.createPopularMovieList(selectedGanre: widget.selectedGanre, query: widget.query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit,List<Movie>>(
        bloc: movieCubit,
        builder: (context, state) {
          List<Movie> movies = state;
          return  HorisontalDisplay(movies: movies, height: widget.height, width: widget.width);
        });
  }
}
