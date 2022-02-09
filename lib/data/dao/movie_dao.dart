import 'package:floor/floor.dart';
import 'package:individual_project/model/ganre.dart';
import 'package:individual_project/model/ganre_movie_id.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/service/api_moviedb.dart';

import '../../main.dart';

@dao
abstract class MovieDao {
  // @Query('SELECT * FROM Movie Where label = :query AND ganre = :selectedGanre')
  // Stream<List<Movie>> findPopularMovie(String query, int selectedGanre);

  // @Query('SELECT * FROM Movie INNER JOIN GanreAndMovie '
  //     'ON Movie.id = GanreAndMovie.movieId INNER JOIN Ganre'
  //     'On GanreAndMovie.ganreId = Ganre.id'
  //     'Where Ganre.id = :selectedGanre')
  // Stream<List<Movie>> findMovieByGanre(int selectedGanre);

  @Query(
      'SELECT * FROM Movie Where id IN (SELECT movieId FROM GanreAndMovie WHERE ganreId = :selectedGanre)')
  Stream<List<Movie>> findMovieByGanre(int selectedGanre);

  @Query('SELECT * FROM Movie')
  Stream<List<Movie>> findAllMovie();

  @Query('SELECT * FROM Ganre')
  Stream<List<Ganre>> findAllGanre();

  @insert
  Future<void> insertMovie(Movie movie);

  @insert
  Future<void> insertGanre(Ganre ganre);

  @insert
  Future<void> insertGanreAndMovie(GanreAndMovie ganreAndMovie);

  @insert
  Future<List<int>> insertListMovie(List<Movie> movie);

  @insert
  Future<List<int>> insertListGanre(List<Ganre> ganre);

  @Query('DELETE FROM Movie')
  Future<void> deleteAllMovies();

  @Query('DELETE FROM GanreAndMovie')
  Future<void> deleteAllGanreAndMovies();

  @Query('DELETE FROM Ganre')
  Future<void> deleteAllGanre();

  @Query('DELETE FROM Movie Where id = :id')
  Future<void> deleteMovieById(int id);

  @transaction
  Future<void> replaceMovies(List<Movie> movie) async {
    for (var element in movie) {
      await deleteMovieById(element.id);
      await insertMovie(element);
    }
  }

  Future<void> createGanreList() async {
    List<Ganre> ganreMovieList = await getIt<ApiMovieDb>().getGenreList();
    insertListGanre(ganreMovieList);
  }

  Future<void> createMovieList({required int selectedGanre}) async {
    try {
      List<Movie> movieList;
      if (selectedGanre == 2) {
        movieList = await getIt<ApiMovieDb>().getPopularMovie();
        print('try1');
      } else if (selectedGanre == 1) {
        movieList = await getIt<ApiMovieDb>().getNowPlayingMovie();
        print('try2');
      } else {
        movieList = await getIt<ApiMovieDb>().getMovieByGanre(selectedGanre);
        print('try3');
      }
      for (var element in movieList) {
        insertGanreAndMovie(
            GanreAndMovie(ganreId: selectedGanre, movieId: element.id));
      }

      replaceMovies(movieList);

      print('tryeeeeeee');
    } catch (e) {
      throw Exception('Error is $e');
    }
  }
}
