import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:individual_project/home/block/movie_cubit.dart';
import 'package:individual_project/home/widget/movie/movie_view.dart';
import 'package:individual_project/main.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:individual_project/service/moviedb.dart';

class MoviePage extends StatelessWidget {
  final int selectedGanre;
  final double height, width;
  const MoviePage({Key? key,
    required this.selectedGanre,
    required this.height,
    required this.width}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) =>
        MovieCubit(
            selectedGanre: selectedGanre,
            //movieDB: getIt<ApiMovieDb>()
           ),
      child: MovieView(
          selectedGanre: selectedGanre,
          height: height,
          width: width,

      ));
  }
}