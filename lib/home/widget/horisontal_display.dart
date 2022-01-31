import 'package:flutter/material.dart';
import 'package:individual_project/constant/constant.dart';
import 'package:individual_project/constant/style.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/navigator/routes.dart';


class HorisontalDisplay extends StatelessWidget {
  final List<Movie> movies;
  final double height, width;
  const HorisontalDisplay({Key? key, required this.movies, required this.height, required this.width}) : super(key: key);


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
                child:  InkWell(
                  onTap: (){
                    print(movie.id);
                    Navigator.pushNamed(context, movieDetailPage, arguments: movie.id);
                  },
                  child: Card(
                    elevation: 5,
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                        child: Image.network(
                          '${movie.posterPath}',
                          height:
                          MediaQuery.of(context).size.height / height,
                          width:
                          MediaQuery.of(context).size.width / width,
                          fit: BoxFit.fill,
                         
                        ),
                        borderRadius: movieBorder,

                    ),
                  ),
                ),
              );
            }
        //),
      ),
    );
  }
}
