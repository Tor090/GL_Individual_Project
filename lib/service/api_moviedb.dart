import 'package:dio/dio.dart';
import 'package:individual_project/model/cast.dart';
import 'package:individual_project/model/ganre.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/model/movie_detail.dart';
import 'package:individual_project/model/person.dart';
import 'package:individual_project/model/screenshot.dart';
import 'package:individual_project/service/moviedb.dart';

class ApiMovieDb extends MovieDB{
  final _dio = Dio();

  @override
  Future<List<Movie>> getNowPlayingMovie() async {
    try {
      const url = '${MovieDB.baseUrl}/movie/now_playing?${MovieDB.apiKey}';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      movieList.forEach((element) {
        element.ganre = 0;
        element.label = 'now_playing';
      });
      return movieList;
    } catch (error) {
      throw Exception(
          'Exception with error: $error');
    }
  }

  @override
  Future<List<Movie>> getPopularMovie() async {
    try {
      const url = '${MovieDB.baseUrl}/movie/popular?${MovieDB.apiKey}';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      movieList.forEach((element) {
        element.ganre = 0;
        element.label = 'popular';
      });

      return movieList;
    } catch (error) {
      throw Exception(
          'Exception with error: $error');
    }
  }

  @override
  Future<List<Ganre>> getGenreList() async {
    try {
      const url = '${MovieDB.baseUrl}/genre/movie/list?${MovieDB.apiKey}';
      final response = await _dio.get(url);
      var genres = response.data['genres'] as List;
      List<Ganre> ganreList = genres.map((g) => Ganre.fromJson(g)).toList();

      return ganreList;
    } catch (error) {
      throw Exception(
          'Exception with error: $error');
    }
  }

  @override
  Future<List<Movie>> getMovieByGanre(int selectedGanre) async {
    try {
      final url = '${MovieDB.baseUrl}/discover/movie?with_genres=$selectedGanre&${MovieDB.apiKey}';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      movieList.forEach((element) {
        element.ganre = selectedGanre;
        element.label = 'ganre';
      });

      return movieList;
    } catch (error) {
      throw Exception(
          'Exception with error: $error');
    }
  }

  @override
  Future<MovieDetail> getMovieDetail(int movieId) async {
    try {
      final response = await _dio.get('${MovieDB.baseUrl}/movie/$movieId?${MovieDB.apiKey}');
      MovieDetail movieDetail = MovieDetail.fromJson(response.data);
      movieDetail.movieScreenshot = await getMovieImage(movieId);
      movieDetail.castList = await getCastList(movieId);
      return movieDetail;
    } catch (error) {
      throw Exception(
          'Exception with error: $error');
    }
  }

  @override
  Future<List<Screenshot>> getMovieImage(int movieId) async {
    try {
      final response = await _dio.get('${MovieDB.baseUrl}/movie/$movieId/images?${MovieDB.apiKey}');
      var screenshots = response.data['backdrops'] as List;
      List<Screenshot> screenshotList = screenshots.map((m) => Screenshot.fromJson(m)).toList();
      return screenshotList;
    } catch (error) {
      throw Exception(
          'Exception with error: $error');
    }
  }

  @override
  Future<List<Cast>> getCastList(int movieId) async {
    try {
      final response =
      await _dio.get('${MovieDB.baseUrl}/movie/$movieId/credits?${MovieDB.apiKey}');
      var list = response.data['cast'] as List;
      List<Cast> castList = list
          .map((c) => Cast.fromJson(c)).toList();

      return castList;
    } catch (error) {
      throw Exception(
          'Exception with error cast: $error');
    }
  }

  @override
  Future<Person> getPerson(int personId) async{
    try {
      final response =
      await _dio.get('${MovieDB.baseUrl}/person/$personId?${MovieDB.apiKey}');
      Person person = Person.fromJson(response.data);
      return person;
    } catch (error) {
      throw Exception(
          'Exception with error: $error');
    }
  }

  @override
  Future<List<Movie>> getSearchMovieList(String query) async{
    try{
      final response =
      await _dio.get('${MovieDB.baseUrl}/search/movie?${MovieDB.apiKey}&query=$query');
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      print(movieList);
      return movieList;
    }catch (error) {
      throw Exception('Exception with error: $error');
    }
  }
}


