import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:individual_project/model/person.dart';
import 'package:individual_project/person_detail/bloc/person_detail_cubit.dart';
import 'package:individual_project/person_detail/bloc/person_detail_state.dart';
import 'package:individual_project/service/api_moviedb.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'person_detail_cubit_test.mocks.dart';

@GenerateMocks([ApiMovieDb])
void main() {
  late MockApiMovieDb mockApiMovieDB;
  late PersonDetailCubit personDetailCubit;

  setUp(() {
    mockApiMovieDB = MockApiMovieDb();
    personDetailCubit = PersonDetailCubit(movieDB: mockApiMovieDB);
  });

  tearDown(() {
    personDetailCubit.close();
  });

  test('initial state is correct', () {
    expect(personDetailCubit.state, InitialState());
  });

  group('Bloc test', () {
    final Person mockPerson = Person(
        id: 1,
        name: 'test1',
        biography: 'empty',
        birthday: '17-02-2022',
        gender: null,
        profilePath: '',
        popularity: null);
    blocTest<PersonDetailCubit, PersonDetailState>(
      'emits [LoadingState(), LoadedState(mockPerson)] when getPerson is added and succeeds',
      build: () {
        when(mockApiMovieDB.getPerson(any))
            .thenAnswer((_) async => Future.value(mockPerson));
        return personDetailCubit;
      },
      act: (cubit) => cubit.createMovieDetailList(personId: 1),
      expect: () => [LoadingState(), LoadedState(mockPerson)],
    );

    blocTest<PersonDetailCubit, PersonDetailState>(
      'emits [LoadingState, ErrorState] when getMovieDetail is throw exception',
      build: () {
        when(mockApiMovieDB.getPerson(any))
            .thenThrow(Exception('We have problem'));
        return personDetailCubit;
      },
      act: (cubit) => cubit.createMovieDetailList(personId: 1),
      expect: () => [LoadingState(), ErrorState()],
    );
  });
}
