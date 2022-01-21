import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie_detail.dart';
import 'package:individual_project/movie_detail/bloc/movie_detail_cubit.dart';
import 'package:individual_project/movie_detail/bloc/movie_detail_state.dart';

class MovieDetailView extends StatelessWidget {
  //final int movieId;
  MovieDetailView({Key? key }) : super(key: key);

//  MovieDetailCubit movieDetailCubit = MovieDetailCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: BlocBuilder<MovieDetailCubit,MovieDetailState>(
        //bloc: movieDetailCubit,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final movie = state.movieDetail;
            return Column(
              children: [
                Image.network('https://image.tmdb.org/t/p/w500/${movie.backdropPath}',),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Image.network('https://image.tmdb.org/t/p/w500/${movie.posterPath}',width: 100, height: 150,),
                  Flexible(child: Text('${movie.title}', style: TextStyle(fontSize: 24),)),
                ],),

              ],
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
