import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/movie_detail/view/movie_detail_page.dart';
import 'package:individual_project/search/bloc/search_cubit.dart';
import 'package:individual_project/search/bloc/search_state.dart';

class SearchMovieView extends StatelessWidget {
  const SearchMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
      ),
      body: BlocBuilder<SearchMovieCubit,SearchState>
        (builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is ErrorState) {
          return const Center(
            child: Icon(Icons.close),
          );
        } else if (state is LoadedState) {
          List<Movie> movies = state.searchMovieList;
          return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                Movie movie = movies[index];
                return Card(
                    elevation: 5,
                    borderOnForeground: true,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => MovieDetailPage(movieId: movie.id),
                          ),
                        );
                      },
                      child: ClipRRect(
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500/${movie.posterPath}',

                                fit: BoxFit.fill,
                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10)),
                            ),
                  ),
                );
              },
          );
        }else{
          return Container();
        }
        },
      ),
    );
  }
}
