import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/popular_movie_cubit.dart';
import 'package:individual_project/home/widget/popular_movie/popular_view.dart';

class PopularPage extends StatelessWidget {
  int selectedGanre;
  PopularPage({Key? key, required this.selectedGanre}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print(selectedGanre);
    return BlocProvider(create: (_) => PopularMovieCubit()..createPopularMovieList(selectedGanre: selectedGanre),
      child: PopularView(selectedGanre: selectedGanre));
  }
}