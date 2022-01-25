import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/search/bloc/search_cubit.dart';
import 'package:individual_project/search/view/search_view.dart';

class SearchMoviePage extends StatelessWidget {
  final String query;
  const SearchMoviePage({Key? key,
    required this.query}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => SearchMovieCubit(query: query),
        child: SearchMovieView());
  }
}