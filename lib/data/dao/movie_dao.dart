import 'package:floor/floor.dart';
import 'package:individual_project/model/ganre.dart';
import 'package:individual_project/model/ganre_movie_id.dart';
import 'package:individual_project/model/movie.dart';

@dao
abstract class MovieDao {
  // @Query('SELECT * FROM Movie Where label = :query AND ganre = :selectedGanre')
  // Stream<List<Movie>> findPopularMovie(String query, int selectedGanre);

  // @Query('SELECT * FROM Movie INNER JOIN GanreAndMovie '
  //     'ON Movie.id = GanreAndMovie.movieId INNER JOIN Ganre'
  //     'On GanreAndMovie.ganreId = Ganre.id'
  //     'Where Ganre.id = :selectedGanre')
  // Stream<List<Movie>> findMovieByGanre(int selectedGanre);
  
  @Query('SELECT * FROM Movie Where id IN (SELECT movieId FROM GanreAndMovie WHERE ganreId = :selectedGanre)')
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

  @transaction
  Future<void> replaceMovies(List<Movie> movie) async {
    await deleteAllMovies();
    await insertListMovie(movie);
  }

}