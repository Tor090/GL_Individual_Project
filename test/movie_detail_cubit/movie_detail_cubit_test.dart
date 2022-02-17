import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:individual_project/model/cast.dart';
import 'package:individual_project/model/movie_detail.dart';
import 'package:individual_project/model/screenshot.dart';
import 'package:individual_project/movie_detail/bloc/movie_detail_cubit.dart';
import 'package:individual_project/movie_detail/bloc/movie_detail_state.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_detail_cubit_test.mocks.dart';

@GenerateMocks([ApiMovieDb])
void main() {
  late MockApiMovieDb mockApiMovieDB;
  late MovieDetailCubit movieDetailCubit;

  setUp(() {
    mockApiMovieDB = MockApiMovieDb();
    movieDetailCubit = MovieDetailCubit(movieDB: mockApiMovieDB);
  });

  tearDown(() {
    movieDetailCubit.close();
  });

  test('initial state is correct', () {
    expect(movieDetailCubit.state, InitialState());
  });

  group('Bloc test', () {
    final MovieDetail mockDetail =
        MovieDetail(id: 123, overview: 'Overview', releaseDate: '2022');
    mockDetail.movieScreenshot = [const Screenshot(filePath: 'path')];
    mockDetail.castList = [Cast(name: 'test1', profilePath: 'path', id: 1)];
    blocTest<MovieDetailCubit, MovieDetailState>(
      'emits [LoadingState(), LoadedState(mockDetail)] when getMovieDetail is added and succeeds',
      build: () {
        when(mockApiMovieDB.getMovieDetail(mockDetail.id))
            .thenAnswer((_) async => Future.value(mockDetail));
        return movieDetailCubit;
      },
      act: (cubit) => cubit.createMovieDetailList(movieId: mockDetail.id),
      expect: () => [LoadingState(), LoadedState(mockDetail)],
    );

    blocTest<MovieDetailCubit, MovieDetailState>(
      'emits [LoadingState, ErrorState] when getMovieDetail is throw exception',
      build: () {
        when(mockApiMovieDB.getMovieDetail(mockDetail.id))
            .thenThrow(Exception('We have problem'));
        return movieDetailCubit;
      },
      act: (cubit) => cubit.createMovieDetailList(movieId: mockDetail.id),
      expect: () => [LoadingState(), ErrorState()],
    );
  });
}
