import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individual_project/model/movie_detail.dart';
import 'package:individual_project/movie_detail/bloc/movie_detail_cubit.dart';
import 'package:individual_project/movie_detail/bloc/movie_detail_state.dart';
import 'package:individual_project/movie_detail/widget/body.dart';
import 'package:individual_project/movie_detail/widget/button_back.dart';
import 'package:individual_project/movie_detail/widget/cut_rectangle.dart';

class MovieDetailView extends StatelessWidget {
  MovieDetailView({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailCubit,MovieDetailState>(
        //bloc: movieDetailCubit,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final movie = state.movieDetail;
            final size = MediaQuery.of(context).size;
            return CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                    pinned: true,
                    delegate: AppBarSliver(
                        size: size,
                        maxExtended: size.height * 0.35,
                        minExtended: kToolbarHeight,
                        movie: movie)),
                SliverToBoxAdapter(
                  child: Body(movie: movie),
                ),
              ],
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}


class AppBarSliver extends SliverPersistentHeaderDelegate{
  const AppBarSliver({
    required this.movie,
    required this.maxExtended,
    required this.minExtended,
    required this.size,
  });
  final double maxExtended;
  final double minExtended;
  final Size size;
  final MovieDetail movie;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / maxExtended;
    final uploadlimit = 13 / 100;
    final valueback = (1 - percent - 0.77).clamp(0, uploadlimit);
    final fixrotation = pow(percent, 1.5);

    final card = CoverCard(
      size: size,
      percent: percent,
      uploadlimit: uploadlimit,
      valueback: valueback,
      url: movie.posterPath!,
    );

    final bottomsliverbar = CustomBottomSliverBar(
      size: size,
      fixrotation: fixrotation,
      percent: percent,
      movie: movie,
    );

    return Container(
      child: Stack(
        children: [
          BackgroundSliver(url: movie.backdropPath!),
          if (percent > uploadlimit) ...[
            card,
            bottomsliverbar,
          ] else ...[
            bottomsliverbar,
            card,
          ],
          ButtonBack(
            size: size,
            percent: percent,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxExtended;

  @override
  // TODO: implement minExtent
  double get minExtent => minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class CustomBottomSliverBar extends StatelessWidget {
  const CustomBottomSliverBar({
    Key? key,
    required this.size,
    required this.fixrotation,
    required this.percent,
    required this.movie,
  }) : super(key: key);
  final Size size;
  final num fixrotation;
  final double percent;
  final MovieDetail movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: -size.width * fixrotation.clamp(0, 0.35),
        right: 0,
        child: Container(
          height: size.height * 0.12,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: CutRectangle(),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.34, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: percent > 0.13
                              ? size.width * pow(percent, 5.5).clamp(0.0, 0.2)
                              : 0,
                          top: size.height *
                              (percent > 0.48
                                  ? pow(percent, 10.5).clamp(0.0, 0.06)
                                  : 0.0)),
                      child: Text(
                        '${movie.title} (${movie.releaseDate?.substring(0,4)})',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}

class CoverCard extends StatelessWidget {
  const CoverCard({
    Key? key,
    required this.size,
    required this.percent,
    required this.uploadlimit,
    required this.valueback,
    required this.url,
  }) : super(key: key);
  final Size size;
  final double percent;
  final double uploadlimit;
  final num valueback;
  final String url;
  final double angleForCard = 6.5;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.15,
      left: size.width / 24,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.identity()
          ..rotateZ(percent > uploadlimit
              ? (valueback * angleForCard)
              : percent * angleForCard),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: size.width * 0.27,
          height: size.height * 0.18,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network('https://image.tmdb.org/t/p/w500/$url',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}


class BackgroundSliver extends StatelessWidget {
  const BackgroundSliver({
    required this.url,
    Key? key,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      child: Image.network('https://image.tmdb.org/t/p/w500/$url',
      fit: BoxFit.fill,),
    );
  }
}