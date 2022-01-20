import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/now_play_movie_cubit.dart';
import 'package:individual_project/model/movie.dart';

import '../horisontal_display.dart';

class NowPlayingView extends StatefulWidget {
  const NowPlayingView({Key? key}) : super(key: key);

  @override
  _NowPlayingViewState createState() => _NowPlayingViewState();
}

class _NowPlayingViewState extends State<NowPlayingView> {
  NowPlayMovieCubit nowPlayMovieCubit = NowPlayMovieCubit();

  @override
  void initState() {
    nowPlayMovieCubit.createNowPlayMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayMovieCubit,List<Movie>>(
        bloc: nowPlayMovieCubit,
        builder: (context, state) {
          List<Movie> movies = state;

          return  HorisontalDisplay(movies: movies, height: 2.25, width: 1.25);
        });;
  }
}
