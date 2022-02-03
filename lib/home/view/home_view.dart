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

  Widget _search(BuildContext context){

    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        width: MediaQuery.of(context).size.width/1.2,
        child: TextField(
                showCursor: false,
                style: whiteColorStyle,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  hintStyle: whiteColorStyle,
                  suffixIcon: IconButton(onPressed: (){
                    Navigator.pushNamed(context, searchMoviePage, arguments: _controller.text);
                    _controller.text = '';
                  },
                      icon: const Icon(Icons.search),
                    color: Colors.white,
                  ),
                ),
              ),
        decoration: BoxDecoration(
          borderRadius: circularBorder,
          border: Border.all(
            width: 1,
            color: Colors.white
          )
        ),
      ),
    );
  }

  Widget _homebody(BuildContext context){
    return SingleChildScrollView(
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaY: kBlur,sigmaX: kBlur),
              child: Image.asset(kHomeBackgroundPhoto),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _search(context),
                  const SizedBox(height: 50,),
                  const Text(
                    'Now Playing',
                    style: headerStyle
                  ),
                  MoviePage(
                    //key: UniqueKey(),
                    selectedGanre: 0,
                    query: 'now_playing',
                    height: kNowPlayHeigh,
                    width: kMovieWidth,),
                  const Text('Popular', style: TextStyle(fontSize: 20),),
                   MoviePage(
                     //key: UniqueKey(),
                     selectedGanre: 0,
                     query: 'popular',
                     height: kMovieHeigh,
                     width: kMovieWidth,),
                  const GanrePage(height: kMovieHeigh,width: kMovieWidth),
                ],
              ),
            ),
          ],
        ),

    );
  }

}
