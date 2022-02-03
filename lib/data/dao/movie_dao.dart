import 'package:floor/floor.dart';
import 'package:individual_project/model/movie.dart';

@dao
abstract class MovieDao {
  @Query('SELECT * FROM Movie Where label = :query AND ganre = :selectedGanre')
  Stream<List<Movie>> findPopularMovie(String query, int selectedGanre);

  @Query('SELECT * FROM Movie')
  Stream<List<Movie>> findAllMovie();

  @insert
  Future<void> insertMovie(Movie movie);

  @insert
  Future<List<int>> insertListMovie(List<Movie> movie);

  @Query('DELETE FROM Movie')
  Future<void> deleteAllMovies();

  @transaction
  Future<void> replaceMovies(List<Movie> movie) async {
    await deleteAllMovies();
    await insertListMovie(movie);
  }

}