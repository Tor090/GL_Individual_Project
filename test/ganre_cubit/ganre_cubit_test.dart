import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/home/block/ganre/ganre_cubit.dart';
import 'package:individual_project/home/block/ganre/ganre_state.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'ganre_cubit_test.mocks.dart';

@GenerateMocks([ApiMovieDb, MovieDao])
void main() {
  late MockApiMovieDb mockApiMovieDB;
  late MockMovieDao mockMovieDao;
  late GanreMovieCubit ganreMovieCubit;

  setUp(() {
    mockApiMovieDB = MockApiMovieDb();
    mockMovieDao = MockMovieDao();
    ganreMovieCubit =
        GanreMovieCubit(movieDao: mockMovieDao, movieDB: mockApiMovieDB);
  });

  tearDown(() {
    ganreMovieCubit.close();
  });

  test('initial state is correct', () {
    expect(ganreMovieCubit.state, InitialState());
  });

  group('Bloc test', () {
    blocTest<GanreMovieCubit, GanreState>(
      'emits [LoadingState(), LoadedState()] when getGenreList is added and succeeds',
      build: () {
        return ganreMovieCubit;
      },
      act: (cubit) => cubit.createGanreMovieList(),
      expect: () => [LoadingState(), LoadedState()],
    );

    blocTest<GanreMovieCubit, GanreState>(
      'emits [LoadingState, ErrorState] when getMovieDetail is throw exception',
      build: () {
        when(mockMovieDao.createGanreList(apiMovieDb: mockApiMovieDB))
            .thenThrow(Exception('We have problem'));
        return ganreMovieCubit;
      },
      act: (cubit) => cubit.createGanreMovieList(),
      expect: () => [LoadingState(), ErrorState()],
    );
  });
}
