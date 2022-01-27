import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:individual_project/home/widget/ganre_display/ganre_page.dart';
import 'package:individual_project/home/widget/movie/movie_page.dart';
import 'package:individual_project/navigator/routes.dart';
import 'package:individual_project/search/view/search_page.dart';





class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  TextEditingController _controller = TextEditingController();

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
        padding: EdgeInsets.only(left: 10),
        height: 50,
        width: MediaQuery.of(context).size.width/1.2,
        child: Expanded(
              child: TextField(
                showCursor: false,
                style: TextStyle(color: Colors.white),
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: IconButton(onPressed: (){
                    Navigator.pushNamed(context, searchMoviePage, arguments: _controller.text);
                    _controller.text = '';
                  },
                      icon: Icon(Icons.search),
                    color: Colors.white,
                  ),
                ),
              ),
            ),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
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
              imageFilter: ImageFilter.blur(sigmaY: 15,sigmaX: 15),
              child: Image.asset('assets/moviedb.png'),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _search(context),
                  SizedBox(height: 50,),
                  Text(
                    'Now Playing',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  MoviePage(selectedGanre: 0,query: 'now_playing',height: 2,width: 1.7,),
                  Text('Popular', style: TextStyle(fontSize: 20),),
                  MoviePage(selectedGanre: 0,query: 'popular',height: 3,width: 1.7,),
                  GanrePage(height: 3,width: 1.7),
                ],
              ),
            ),
          ],
        ),

    );
  }

}
