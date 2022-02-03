import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'data/database/database.dart';
import 'navigator/route_generator.dart';

GetIt getIt = GetIt.instance;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final apiMovieDb = ApiMovieDb();
  GetIt.instance.registerSingleton(apiMovieDb);

  final database = await $FloorAppDatabase.databaseBuilder('movie1.db').build();
  final dao = database.movieDao;
  getIt.registerSingleton<MovieDao>(dao);

  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(color: Colors.teal[900]),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        appBarTheme: AppBarTheme(color: Colors.teal[900]),
            // New
      ),
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      onUnknownRoute: RouteGenerator.onUnknownRoute,
      //home: HomeView(),
    );
  }
}
