import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/now_play_movie_cubit.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => NowPlayMovieCubit())
    ], child: HomeView());
  }
}