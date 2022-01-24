import 'package:dio/dio.dart';
import 'package:individual_project/model/cast.dart';
import 'package:individual_project/model/ganre.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/model/movie_detail.dart';
import 'package:individual_project/model/person.dart';
import 'package:individual_project/model/screenshot.dart';


  Dio _dio = Dio();

  const String baseUrl = 'https://api.themoviedb.org/3';
  const String apiKey = 'api_key=4b0d45b575e726aa5813c161fdc13b17';

  Future<List<Movie>> getNowPlayingMovie() async {
    try {
      final url = '$baseUrl/movie/now_playing?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
       return movieList;
    } catch (error) {
      throw Exception(
          'Exception with error: $error');
    }
  }

Future<List<Movie>> getPopularMovie() async {
  try {
    final url = '$baseUrl/movie/popular?$apiKey';
    final response = await _dio.get(url);
    var movies = response.data['results'] as List;
    List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  } catch (error) {
    throw Exception(
        'Exception with error: $error');
  }
}

Future<List<Ganre>> getGenreList() async {
  try {
    final url = '$baseUrl/genre/movie/list?$apiKey';
    final response = await _dio.get(url);
    var genres = response.data['genres'] as List;
    List<Ganre> ganreList = genres.map((g) => Ganre.fromJson(g)).toList();
    return ganreList;
  } catch (error) {
    throw Exception(
        'Exception with error: $error');
  }
}

Future<List<Movie>> getMovieByGanre(int selectedGanre) async {
  try {
    final url = '$baseUrl/discover/movie?with_genres=$selectedGanre&$apiKey';
    final response = await _dio.get(url);
    var movies = response.data['results'] as List;
    List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  } catch (error) {
    throw Exception(
        'Exception with error: $error');
  }
}

Future<MovieDetail> getMovieDetail(int movieId) async {
  try {
    print(movieId);
    final response = await _dio.get('$baseUrl/movie/$movieId?$apiKey');
    MovieDetail movieDetail = MovieDetail.fromJson(response.data);
    movieDetail.movieScreenshot = await getMovieImage(movieId);
    movieDetail.castList = await getCastList(movieId);
    return movieDetail;
  } catch (error) {
    throw Exception(
        'Exception with error: $error');
  }
}

Future<List<Screenshot>> getMovieImage(int movieId) async {
  try {
    final response = await _dio.get('$baseUrl/movie/$movieId/images?$apiKey');
    var screenshots = response.data['backdrops'] as List;
    List<Screenshot> screenshotList = screenshots.map((m) => Screenshot.fromJson(m)).toList();
    return screenshotList;
  } catch (error, stacktrace) {
    throw Exception(
        'Exception with error: $error');
  }
}

Future<List<Cast>> getCastList(int movieId) async {
  try {
    final response =
    await _dio.get('$baseUrl/movie/$movieId/credits?$apiKey');
    var list = response.data['cast'] as List;
    List<Cast> castList = list
        .map((c) => Cast.fromJson(c)).toList();
    return castList;
  } catch (error) {
    throw Exception(
        'Exception with error cast: $error');
  }
}

Future<Person> getPerson(int personId) async{
  try {
    final response =
    await _dio.get('$baseUrl/person/$personId?$apiKey');
    Person person = Person.fromJson(response.data);
    return person;
  } catch (error) {
    throw Exception(
        'Exception with error cast: $error');
  }
}

Future<List<Movie>> getSearchMovieList(String query) async{
    try{
      final response =
      await _dio.get('$baseUrl/search/movie?$apiKey&query=$query');
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    }catch (error) {
      throw Exception('Exception with error: $error');
    }
}