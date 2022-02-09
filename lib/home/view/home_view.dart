import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:individual_project/constant/constant.dart';
import 'package:individual_project/constant/style.dart';
import 'package:individual_project/home/widget/ganre_display/ganre_page.dart';
import 'package:individual_project/home/widget/movie/movie_page.dart';
import 'package:individual_project/navigator/routes.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: _homebody(context),
    );
  }

  Widget _search(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        width: MediaQuery.of(context).size.width / 1.2,
        child: TextField(
          showCursor: false,
          style: DefaultStyle.whiteColorStyle,
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            hintStyle: DefaultStyle.whiteColorStyle,
            suffixIcon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, searchMoviePage,
                    arguments: _controller.text);
                _controller.text = '';
              },
              icon: const Icon(Icons.search),
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: DefaultStyle.circularBorder,
            border: Border.all(width: 1, color: Colors.white)),
      ),
    );
  }

  Widget _homebody(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.delayed(Duration(seconds: 1)),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(
                  sigmaY: Constant.kBlur, sigmaX: Constant.kBlur),
              child: Image.asset(Constant.kHomeBackgroundPhoto),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _search(context),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('Now Playing', style: DefaultStyle.headerStyle),
                  MoviePage(
                    selectedGanre: 1,
                    height: Constant.kNowPlayHeigh,
                    width: Constant.kMovieWidth,
                  ),
                  const Text(
                    'Popular',
                    style: TextStyle(fontSize: 20),
                  ),
                  MoviePage(
                    selectedGanre: 2,
                    height: Constant.kMovieHeigh,
                    width: Constant.kMovieWidth,
                  ),
                  GanrePage(
                      height: Constant.kMovieHeigh,
                      width: Constant.kMovieWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
