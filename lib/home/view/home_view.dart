import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/home/widget/ganre_display/ganre_page.dart';
import 'package:individual_project/home/widget/now_playing/now_playing_page.dart';
import 'package:individual_project/home/widget/popular_movie/popular_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieDB'),
      ),
      body: _homebody(),
    );
  }

  Widget _homebody(){
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Now Playing', style: TextStyle(fontSize: 25),),
                  NowPlayingPage(),
                  Text('Popular', style: TextStyle(fontSize: 20),),
                  PopularPage(selectedGanre: 0),
                  GanrePage(),
                ],
        ),
      ),
    );
  }



}
