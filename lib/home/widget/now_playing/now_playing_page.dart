import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/now_play_movie_cubit.dart';
import 'package:individual_project/home/widget/now_playing/now_playing_view.dart';

class NowPlayingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => NowPlayMovieCubit(),
     child: NowPlayingView());
  }
}