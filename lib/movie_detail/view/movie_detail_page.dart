import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:individual_project/movie_detail/bloc/movie_detail_cubit.dart';
import 'package:individual_project/movie_detail/view/movie_detail_view.dart';
import 'package:individual_project/service/api_moviedb.dart';

class MovieDetailPage extends StatelessWidget {
  final int movieId;
  const MovieDetailPage({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) =>
        MovieDetailCubit(movieId: movieId, movieDB: GetIt.instance.get<ApiMovieDb>()),
    child: const MovieDetailView());
  }
}
