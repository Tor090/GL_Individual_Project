import 'package:individual_project/model/cast.dart';
import 'package:individual_project/model/ganre.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/model/movie_detail.dart';
import 'package:individual_project/model/person.dart';
import 'package:individual_project/model/screenshot.dart';

abstract class MovieDB{
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'api_key=4b0d45b575e726aa5813c161fdc13b17';

  Future<List<Movie>> getNowPlayingMovie();
  Future<List<Movie>> getPopularMovie();
  Future<List<Ganre>> getGenreList();
  Future<List<Movie>> getMovieByGanre(int selectedGanre);
  Future<MovieDetail> getMovieDetail(int movieId);
  Future<List<Screenshot>> getMovieImage(int movieId);
  Future<List<Cast>> getCastList(int movieId);
  Future<Person> getPerson(int personId);
  Future<List<Movie>> getSearchMovieList(String query);
}