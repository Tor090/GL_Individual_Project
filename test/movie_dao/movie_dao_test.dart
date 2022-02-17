import 'package:flutter_test/flutter_test.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/data/database/database.dart';
import 'package:individual_project/model/ganre.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_dao_test.mocks.dart';

@GenerateMocks([ApiMovieDb])
void main() {
  late AppDatabase database;
  late MovieDao movieDao;
  late MockApiMovieDb mockApiMovieDB;

  setUp(() async {
    mockApiMovieDB = MockApiMovieDb();
    database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
    movieDao = database.movieDao;
  });

  tearDown(() async {
    await database.close();
  });

  group('Work with Ganre table', () {
    final ganreList = [
      Ganre(id: 1, name: 'ganre1'),
      Ganre(id: 2, name: 'ganre2')
    ];

    test('Insert and find ganres', () async {
      when(mockApiMovieDB.getGenreList())
          .thenAnswer((_) => Future.value(ganreList));
      await movieDao.createGanreList(apiMovieDb: mockApiMovieDB);

      final actual = await movieDao.findAllGanre().first;
      expect(actual, equals(ganreList));
    });
  });

  group('Simple test db', () {
    test('Find movies without write to DB', () async {
      final actual = await movieDao.findAllMovie();

      expect(actual, emits(<List<Movie>>[]));
    });

    test('Insert and get movie', () async {
      final movieList = [
        Movie(id: 1, posterPath: 'path1', title: 'test1'),
        Movie(id: 2, posterPath: 'path2', title: 'test2')
      ];
      for (var element in movieList) {
        await movieDao.insertMovie(element);
      }
      final actual = await movieDao.findAllMovie().first;
      expect(actual, equals(movieList));
    });
  });

  group('Movie and Ganre', () {
    test('GanreAndMovieTable', () async {
      final movieList = [
        Movie(id: 1, posterPath: 'path1', title: 'test1'),
        Movie(id: 2, posterPath: 'path2', title: 'test2')
      ];
      final ganreList = [
        Ganre(id: 1, name: 'ganre1'),
        Ganre(id: 2, name: 'ganre2')
      ];
      when(mockApiMovieDB.getGenreList())
          .thenAnswer((_) => Future.value(ganreList));
      when(mockApiMovieDB.getMovieByGanre(any))
          .thenAnswer((_) => Future.value(movieList));
      when(mockApiMovieDB.getPopularMovie())
          .thenAnswer((_) => Future.value(movieList));
      when(mockApiMovieDB.getNowPlayingMovie())
          .thenAnswer((_) => Future.value(movieList));
      await movieDao.createGanreList(apiMovieDb: mockApiMovieDB);
      await movieDao.createMovieList(
          apiMovieDb: mockApiMovieDB, selectedGanre: 2);

      final actual = await movieDao.findMovieByGanre(2).first;
      expect(actual, equals(movieList));
    });
  });
}
