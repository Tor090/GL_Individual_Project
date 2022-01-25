import 'package:flutter/material.dart';
import 'package:individual_project/home/widget/ganre_display/ganre_page.dart';
import 'package:individual_project/home/widget/movie/movie_page.dart';
import 'package:individual_project/search/view/search_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _homebody(context),
    );
  }

  Widget _search(BuildContext context){
    String searchText = '';
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: 50,
        width: MediaQuery.of(context).size.width/1.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                ),
                onChanged: (text){searchText = text;
                print(searchText);},
              ),
            ),
            IconButton(onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => SearchMoviePage(query: searchText),
              ),
            );
            },
                icon: Icon(Icons.search)),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            width: 1,
          )
        ),
      ),
    );
  }

  Widget _homebody(BuildContext context){
    return SafeArea(
      child: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _search(context),
                    Text('Now Playing', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    MoviePage(selectedGanre: 0,query: 'now_playing',height: 2,width: 1.7,),
                    Text('Popular', style: TextStyle(fontSize: 20),),
                    MoviePage(selectedGanre: 0,query: 'popular',height: 3,width: 1.7,),
                    GanrePage(height: 3,width: 1.7),
                  ],
          ),
        ),
      ),
    );
  }

}
