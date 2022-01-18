import 'package:dio/dio.dart';
import 'package:individual_project/model/movie.dart';


  Dio _dio = Dio();

  const String baseUrl = 'https://api.themoviedb.org/3';
  const String apiKey = 'api_key=4b0d45b575e726aa5813c161fdc13b17';

  Future<List<Movie>> getNowPlayingMovie() async {
    try {
      final url = '$baseUrl/movie/now_playing?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      // print(movieList);
      // print('SUCCES');
       return movieList;
    } catch (error) {
      throw Exception(
          'Exception with error: $error');
    }
  }
