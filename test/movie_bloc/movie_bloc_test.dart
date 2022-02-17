import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/home/block/movie/movie_cubit.dart';
import 'package:individual_project/home/block/movie/movie_state.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_bloc_test.mocks.dart';

@GenerateMocks([ApiMovieDb, MovieDao])
void main() {
  late MockApiMovieDb mockApiMovieDB;
  late MockMovieDao mockMovieDao;
  late MovieCubit movieCubit;

  setUp(() {
    mockApiMovieDB = MockApiMovieDb();
    mockMovieDao = MockMovieDao();
    movieCubit = MovieCubit(movieDao: mockMovieDao, movieDB: mockApiMovieDB);
  });

  tearDown(() {
    movieCubit.close();
  });

  test('initial state is correct', () {
    expect(movieCubit.state, InitialState());
  });

  group('Bloc test', () {
    final movieList = [
      Movie(id: 1, posterPath: 'path1', title: 'test1'),
      Movie(id: 2, posterPath: 'path2', title: 'test2')
    ];
    blocTest<MovieCubit, MovieState>(
      'emits [LoadingState(), LoadedState()] when getGenreList is added and succeeds',
      build: () {
        return movieCubit;
      },
      act: (cubit) => cubit.createMovieList(selectedGanre: 1),
      expect: () => [LoadingState(), LoadedState()],
    );

    blocTest<MovieCubit, MovieState>(
      'emits [LoadingState, ErrorState] when getMovieDetail is throw exception',
      build: () {
        when(mockMovieDao.createMovieList(
                apiMovieDb: mockApiMovieDB, selectedGanre: 1))
            .thenThrow(Exception('We have problem'));
        return movieCubit;
      },
      act: (cubit) => cubit.createMovieList(selectedGanre: 1),
      expect: () => [LoadingState(), ErrorState()],
    );
  });
}
