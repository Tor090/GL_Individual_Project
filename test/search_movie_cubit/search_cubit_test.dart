import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:individual_project/model/movie.dart';
import 'package:individual_project/search/bloc/search_cubit.dart';
import 'package:individual_project/search/bloc/search_state.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_cubit_test.mocks.dart';

@GenerateMocks([ApiMovieDb])
void main() {
  late MockApiMovieDb mockApiMovieDB;
  late SearchMovieCubit searchMovieCubit;

  setUp(() {
    mockApiMovieDB = MockApiMovieDb();
    searchMovieCubit = SearchMovieCubit(movieDB: mockApiMovieDB);
  });

  tearDown(() {
    searchMovieCubit.close();
  });

  test('initial state is correct', () {
    expect(searchMovieCubit.state, InitialState());
  });

  group('Bloc test', () {
    final List<Movie> mockMovie = [
      Movie(id: 1, title: 'Test1', posterPath: 'Path1')
    ];
    blocTest<SearchMovieCubit, SearchState>(
      'emits [LoadingState(), LoadedState(mockDetail)] when getMovieDetail is added and succeeds',
      build: () {
        when(mockApiMovieDB.getSearchMovieList(any))
            .thenAnswer((_) async => Future.value(mockMovie));
        return searchMovieCubit;
      },
      act: (cubit) => cubit.createSearchMovieList(query: 'any'),
      expect: () => [LoadingState(), LoadedState(mockMovie)],
    );

    blocTest<SearchMovieCubit, SearchState>(
      'emits [LoadingState, ErrorState] when getMovieDetail is throw exception',
      build: () {
        when(mockApiMovieDB.getSearchMovieList(any))
            .thenThrow(Exception('We have problem'));
        return searchMovieCubit;
      },
      act: (cubit) => cubit.createSearchMovieList(query: 'query'),
      expect: () => [LoadingState(), ErrorState()],
    );
  });
}
