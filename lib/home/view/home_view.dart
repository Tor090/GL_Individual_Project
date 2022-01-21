import 'package:flutter/material.dart';
import 'package:individual_project/home/widget/ganre_display/ganre_page.dart';
import 'package:individual_project/home/widget/movie/movie_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _homebody(),
    );
  }

  Widget _homebody(){
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Now Playing', style: TextStyle(fontSize: 25),),
                  MoviePage(selectedGanre: 0,query: 'now_playing',height: 2,width: 1.7,),
                  Text('Popular', style: TextStyle(fontSize: 20),),
                  MoviePage(selectedGanre: 0,query: 'popular',height: 3,width: 1.7,),
                  GanrePage(query: '',height: 3,width: 1.7),
                ],
        ),
      ),
    );
  }

}
