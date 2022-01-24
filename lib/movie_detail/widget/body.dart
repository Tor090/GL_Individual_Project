import 'package:flutter/material.dart';
import 'package:individual_project/model/cast.dart';
import 'package:individual_project/model/movie_detail.dart';
import 'package:individual_project/model/screenshot.dart';
import 'package:individual_project/person_detail/view/person_detail_page.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.movie
  }) : super(key: key);

  final MovieDetail movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Budget: ${movie.budget}\$',
                  style: TextStyle(fontSize: 22),
                ),
                VerticalDivider(),
                Text(
                    'Rating: ${movie.voteAverage}',
                    style: TextStyle(fontSize: 22)
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('Overview', style: TextStyle(fontSize: 22),),
            SizedBox(height: 10),
            Text(movie.overview!, style: TextStyle(fontSize: 18),),
            SizedBox(height: 10),
            Text('Screenshots', style: TextStyle(fontSize: 22),),
            SizedBox(height: 10),
            Container(
              height: 155,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    VerticalDivider(
                      color: Colors.transparent,
                      width: 5,
                    ),
                scrollDirection: Axis.horizontal,
                itemCount: movie.movieScreenshot.length,
                itemBuilder: (context, index) {
                  Screenshot image =
                  movie.movieScreenshot[index];
                  return Container(
                    child: Card(
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
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text('Actors', style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Container(
              height: 150,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    VerticalDivider(
                      color: Colors.transparent,
                      width: 5,
                    ),
                scrollDirection: Axis.horizontal,
                itemCount: movie.movieScreenshot.length,
                itemBuilder: (context, index) {
                  Cast cast =
                  movie.castList[index];
                  if(cast.profilePath == null){
                    return const Text('No photo');
                  }
                  return InkWell(
                    onTap:() { Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonDetailPage(personId: cast.id),
                      ),
                    );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
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
                              child: Image.network(
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
