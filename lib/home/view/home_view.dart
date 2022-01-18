import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/home/block/now_play_movie_cubit.dart';
import 'package:individual_project/model/movie.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieDB'),
      ),
      body: _homebody(context),
    );
  }

  Widget _homebody(BuildContext context){
    NowPlayMovieCubit cubit = NowPlayMovieCubit();
    return LayoutBuilder(
        builder: (context, constraints) {
          cubit.createMovieList();
          return Column(
            //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<NowPlayMovieCubit,List<Movie>>(
                              bloc: cubit,
                                builder: (context, state) {
                                  List<Movie> movies = state;
                                  print('MOOOOOOOO ${movies.length}');
                                   return Expanded(
                                     child: ListView.builder(
                                       //shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: movies.length,
                                          itemBuilder: (context, index) {
                                            Movie movie = movies[index];
                                            return GestureDetector(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Stack(
                                                  alignment: Alignment.bottomLeft,

                                                  children: [
                                                    ClipRRect(
                                                      child: Image.network(
                                                        'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                                                        height:
                                                          MediaQuery.of(context).size.height /3,
                                                        width:
                                                          MediaQuery.of(context).size.width / 1.25,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      borderRadius: const BorderRadius.all(
                                                          Radius.circular(10)),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                      ),
                                   );
                                }),
            ],
          );
          },
          );
  }
}
