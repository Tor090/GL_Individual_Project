import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/movie_cubit.dart';
import 'package:individual_project/home/block/movie_state.dart';
import 'package:individual_project/model/movie.dart';

import '../horisontal_display.dart';

class MovieView extends StatelessWidget {
  final double height, width;
  const MovieView({Key? key,
    required this.height,
    required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            List<Movie> movies = state.movieList;
            return HorisontalDisplay(
                movies: movies, height: height, width: width);
          }else{
            return Container();
          }
        });
  }
}
