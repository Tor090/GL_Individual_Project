import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/constant/style.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/movie_detail/view/movie_detail_page.dart';
import 'package:individual_project/search/bloc/search_cubit.dart';
import 'package:individual_project/search/bloc/search_state.dart';

class SearchMovieView extends StatelessWidget {
  const SearchMovieView({required this.query, Key? key}) : super(key: key);

  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SearchMovieCubit, SearchState>(
        builder: (context, state) {
          if (state is InitialState) {
            BlocProvider.of<SearchMovieCubit>(context)
                .createSearchMovieList(query: query);
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
          }
          if (state is LoadedState) {
            List<Movie> movies = state.searchMovieList;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                Movie movie = movies[index];
                return Card(
                  elevation: 5,
                  borderOnForeground: true,
                  child: InkWell(
                    onTap: () {
                      print(movie.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailPage(movieId: movies[index].id),
                        ),
                      );
                    },
                    child: ClipRRect(
                      child: Image.network(
                        movie.posterPath,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: DefaultStyle.movieBorder,
                    ),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
