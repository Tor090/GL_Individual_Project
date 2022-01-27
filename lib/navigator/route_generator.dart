import 'package:flutter/material.dart';
import 'package:individual_project/home/view/home_view.dart';
import 'package:individual_project/movie_detail/view/movie_detail_page.dart';
import 'package:individual_project/navigator/routes.dart';
import 'package:individual_project/person_detail/view/person_detail_page.dart';
import 'package:individual_project/search/view/search_page.dart';

class RouteGenerator{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;

    if (name == null) {
      return RouteGenerator.onUnknownRoute(settings);
    }

    switch (name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => HomeView(),);

      case movieDetailPage:
        return MaterialPageRoute(
            builder: (_) => MovieDetailPage(movieId: settings.arguments as int));

      case personDetailPage:
        return PageRouteBuilder(
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              alignment: Alignment.center,
              scale: Tween<double>(begin: 0.5, end: 1).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.bounceIn,
                ),
              ),
              child: child,
            );
          },
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return PersonDetailPage(personId: settings.arguments as int);
          });

        // return MaterialPageRoute(
        //     builder: (_) => PersonDetailPage(personId: settings.arguments as int,));

      case searchMoviePage:
        return MaterialPageRoute(
            builder: (_) => SearchMoviePage(query: settings.arguments as String,));

      default:
        return RouteGenerator.onUnknownRoute(settings);
    }
}
  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Page not found'),
        ),
      );
    });
  }
}