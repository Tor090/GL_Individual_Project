import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:individual_project/search/bloc/search_cubit.dart';
import 'package:individual_project/search/view/search_view.dart';
import 'package:individual_project/service/api_moviedb.dart';

class SearchMoviePage extends StatelessWidget {
  final String query;
  const SearchMoviePage({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
            SearchMovieCubit(movieDB: GetIt.instance.get<ApiMovieDb>()),
        child: SearchMovieView(query: query));
  }
}
