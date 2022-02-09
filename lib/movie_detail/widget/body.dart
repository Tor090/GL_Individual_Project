import 'package:flutter/material.dart';
import 'package:individual_project/constant/constant.dart';
import 'package:individual_project/constant/style.dart';
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
        children: [
          movie.backdropPath == null
              ? Image.asset(
                  Constant.kHomeBackgroundPhoto,
                  fit: BoxFit.fill,
                )
              : Image.network(
                  '${movie.backdropPath}',
                  fit: BoxFit.fill,
                ),
          ButtonBack(
            onTap: () => Navigator.pop(context),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.26),
            padding: DefaultStyle.movieDetailPadding,
            // height: 500,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: DefaultStyle.movieDetailContainerRadius,
                topRight: DefaultStyle.movieDetailContainerRadius,
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
                      width: size.width / 2,
                      height: 50,
                      child: Flexible(
                        child: Text('${movie.title} ${movie.releaseDate}',
                            style: DefaultStyle.movieDetailHeaderStyle),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                const Text('Overview',
                    style: DefaultStyle.movieDetailHeaderStyle),
                Text(
                  movie.overview,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                movie.movieScreenshot.isNotEmpty
                    ? const Text('Screenshots',
                        style: DefaultStyle.movieDetailHeaderStyle)
                    : const SizedBox(height: 1),
                SizedBox(
                  height: 155,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const VerticalDivider(
                      color: Colors.transparent,
                      width: 5,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: movie.movieScreenshot.length,
                    itemBuilder: (context, index) {
                      Screenshot image = movie.movieScreenshot[index];
                      return Card(
                        elevation: 3,
                        borderOnForeground: true,
                        child: ClipRRect(
                          borderRadius: DefaultStyle.movieBorder,
                          child: Image.network(
                            '${Constant.kphoto}${image.filePath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Cast', style: DefaultStyle.movieDetailHeaderStyle),
                movie.castList.isNotEmpty
                    ? SizedBox(
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
                            Cast cast = movie.castList[index];
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, personDetailPage,
                                    arguments: cast.id);
                              },
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 3,
                                    borderOnForeground: true,
                                    child: ClipRRect(
                                      borderRadius: DefaultStyle.movieBorder,
                                      child: cast.profilePath == null
                                          ? Image.asset(
                                              Constant.kNoPhoto,
                                              height: Constant
                                                  .kMovieDetailCastImageSize,
                                              width: Constant
                                                  .kMovieDetailCastImageSize,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              '${cast.profilePath}',
                                              height: Constant
                                                  .kMovieDetailCastImageSize,
                                              width: Constant
                                                  .kMovieDetailCastImageSize,
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
                      )
                    : SizedBox(
                        height: 1,
                      ),
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: 8,
            child: ClipRRect(
              child: Image.network(
                '${Constant.kphoto}${movie.posterPath}',
                //fit: BoxFit.fill,
                height: 220,
                width: 170,
              ),
              borderRadius: DefaultStyle.circularBorder,
            ),
          ),
        ],
      ),
    );
  }
}
