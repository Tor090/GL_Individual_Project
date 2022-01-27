import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/movie_detail/bloc/movie_detail_cubit.dart';
import 'package:individual_project/movie_detail/bloc/movie_detail_state.dart';
import 'package:individual_project/movie_detail/widget/body.dart';

class MovieDetailView extends StatelessWidget {
  MovieDetailView({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).backgroundColor,
      body: BlocBuilder<MovieDetailCubit,MovieDetailState>(

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
            final movie = state.movieDetail;
            return  Body(movie: movie);
          }else{
            return Container();
          }
        },
      ),
    );
  }
}





