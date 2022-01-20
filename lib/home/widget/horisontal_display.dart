import 'package:flutter/material.dart';
import 'package:individual_project/model/movie.dart';

class HorisontalDisplay extends StatelessWidget {
  List<Movie> movies;
  double height, width;
  HorisontalDisplay({Key? key, required this.movies, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              Movie movie = movies[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child:  ClipRRect(
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                      height:
                      MediaQuery.of(context).size.height / height,
                      width:
                      MediaQuery.of(context).size.width / width,
                      fit: BoxFit.fill,
                    ),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10)),

                ),
              );
            }
        //),
      ),
    );
  }
}