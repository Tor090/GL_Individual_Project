import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/home/block/movie/movie_cubit.dart';
import 'package:individual_project/home/block/movie/movie_state.dart';
import 'package:individual_project/model/movie.dart';

import '../../../main.dart';
import '../horisontal_display.dart';

class MovieView extends StatelessWidget {
  final double height, width;
  final int selectedGanre;
  const MovieView({
    Key? key,
    required this.height,
    required this.width,
    required this.selectedGanre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return streamOutputMovie();
  }

  Widget streamOutputMovie() {
    final dao = getIt<MovieDao>();
    return StreamBuilder<List<Movie>>(
        stream: dao.findMovieByGanre(selectedGanre),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            print('movie in data');
            List<Movie> movies = snapshot.data!;
            return HorisontalDisplay(
                movies: movies, height: height, width: width);
          } else {
            return blocForAddDataToDB();
          }
        });
  }

  Widget blocForAddDataToDB() {
    return BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
      if (state is InitialState) {
        BlocProvider.of<MovieCubit>(context)
            .createMovieList(selectedGanre: selectedGanre);
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }
      if (state is LoadingState) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if (state is ErrorState) {
        return const Center(
          child: Icon(Icons.close),
        );
      } else if (state is LoadedState) {
        return streamOutputMovie();
      } else {
        return Container();
      }
    });
  }
}
