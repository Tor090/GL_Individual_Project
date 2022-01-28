import 'package:flutter/material.dart';
import 'package:individual_project/model/cast.dart';
import 'package:individual_project/model/movie_detail.dart';
import 'package:individual_project/model/screenshot.dart';
import 'package:individual_project/navigator/routes.dart';

import 'button_back.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieDetail movie;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
              children: [movie.backdropPath == null ?
                  Image.asset('assets/moviedb.png',
                  fit: BoxFit.fill,) :
                Image.network('https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
                  fit: BoxFit.fill,),
                ButtonBack(
                  onTap: () => Navigator.pop(context),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.26),
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: size.width/2,
                              height: 50,
                              child: Flexible(
                                child: Text('${movie.title} (${movie.releaseDate?.substring(0,4)})',
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 120,),
                        const Text('Overview', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        Text(movie.overview!, style: const TextStyle(fontSize: 18),),
                        const SizedBox(height: 10),
                        movie.movieScreenshot.isNotEmpty ?
                        const Text('Screenshots', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),) :
                        const SizedBox(height: 1,),
                        SizedBox(
                          height: 155,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const VerticalDivider(
                                  color: Colors.transparent,
                                  width: 5,
                                ),
                            scrollDirection: Axis.horizontal,
                            itemCount: movie.movieScreenshot.length,
                            itemBuilder: (context, index) {
                              Screenshot image =
                              movie.movieScreenshot[index];
                              return Card(
                                elevation: 3,
                                borderOnForeground: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${image.imagePath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Cast', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 130,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const VerticalDivider(
                                  color: Colors.transparent,
                                  width: 5,
                                ),
                            scrollDirection: Axis.horizontal,
                            itemCount: movie.castList.length,
                            itemBuilder: (context, index) {
                              Cast cast =
                              movie.castList[index];
                              return InkWell(
                                onTap:() {
                                  Navigator.pushNamed(
                                      context,
                                      personDetailPage,
                                      arguments: cast.id);
                                },
                                child: Column(
                                    children: [
                                      Card(
                                        elevation: 3,
                                        borderOnForeground: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: cast.profilePath == null ?
                                          Image.asset('assets/no_photo.jpg',
                                            height: 80,
                                            width: 80,
                                            fit: BoxFit.cover,):
                                          Image.network(
                                            'https://image.tmdb.org/t/p/w500${cast.profilePath}',
                                            height: 80,
                                            width: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Flexible(child: Text(cast.name)),
                                    ],
                                  ),

                              );
                            },
                          ),
                        ),
                      ],
                 ),
                ),
                      Positioned(
                        top: 150,
                        left: 8,
                        child:
                            ClipRRect(
                              child: Image.network('https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                                //fit: BoxFit.fill,
                                height: 220,
                                width: 170,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                      ),
              ],
            ),
    );
  }
}
