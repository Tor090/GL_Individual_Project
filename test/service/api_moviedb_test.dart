import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:individual_project/service/api_moviedb.dart';

GetIt getIt = GetIt.instance;
void main() {
  setUpAll(() {
    getIt.registerLazySingleton<ApiMovieDb>(() => ApiMovieDb());
  });

  test('getNowPlayingMovie return a value', () async {
    final result = await getIt<ApiMovieDb>().getNowPlayingMovie();
    expect(result.isNotEmpty, true);
  });
  test('getGenreList return a value', () async {
    final result = await getIt<ApiMovieDb>().getGenreList();
    expect(result.isNotEmpty, true);
  });
  test('getPopularMovie return a value', () async {
    final result = await getIt<ApiMovieDb>().getPopularMovie();
    expect(result.isNotEmpty, true);
  });
  test('getMovieByGanre return a value', () async {
    final result = await getIt<ApiMovieDb>().getMovieByGanre(28);
    expect(result.isNotEmpty, true);
  });
  group('MovieDetailMethods', () {
    final movieId = 524434;
    test('getMovieByGanre return a value', () async {
      final result = await getIt<ApiMovieDb>().getMovieDetail(movieId);
      expect(result.id, movieId);
      expect(result.movieScreenshot.isNotEmpty, true);
      expect(result.castList.isNotEmpty, true);
    });
    test('getMovieImage return a value', () async {
      final result = await getIt<ApiMovieDb>().getMovieImage(movieId);
      expect(result.isNotEmpty, true);
    });
    test('getMovieImage return a value', () async {
      final result = await getIt<ApiMovieDb>().getCastList(movieId);
      expect(result.isNotEmpty, true);
    });
  });
  test('getSearchMovieList return a value', () async {
    final result = await getIt<ApiMovieDb>().getSearchMovieList('Spider');
    expect(result.every((element) => element.title.contains('Spider')), true);
  });
}
