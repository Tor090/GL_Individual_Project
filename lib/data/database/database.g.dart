// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Movie` (`id` INTEGER NOT NULL, `posterPath` TEXT NOT NULL, `title` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Ganre` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `GanreAndMovie` (`uid` INTEGER PRIMARY KEY AUTOINCREMENT, `ganreId` INTEGER NOT NULL, `movieId` INTEGER NOT NULL, FOREIGN KEY (`ganreId`) REFERENCES `Ganre` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`movieId`) REFERENCES `Movie` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _movieInsertionAdapter = InsertionAdapter(
            database,
            'Movie',
            (Movie item) => <String, Object?>{
                  'id': item.id,
                  'posterPath': item.posterPath,
                  'title': item.title
                },
            changeListener),
        _ganreInsertionAdapter = InsertionAdapter(
            database,
            'Ganre',
            (Ganre item) => <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _ganreAndMovieInsertionAdapter = InsertionAdapter(
            database,
            'GanreAndMovie',
            (GanreAndMovie item) => <String, Object?>{
                  'uid': item.uid,
                  'ganreId': item.ganreId,
                  'movieId': item.movieId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Movie> _movieInsertionAdapter;

  final InsertionAdapter<Ganre> _ganreInsertionAdapter;

  final InsertionAdapter<GanreAndMovie> _ganreAndMovieInsertionAdapter;

  @override
  Stream<List<Movie>> findMovieByGanre(int selectedGanre) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Movie Where id IN (SELECT movieId FROM GanreAndMovie WHERE ganreId = ?1)',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int,
            posterPath: row['posterPath'] as String,
            title: row['title'] as String),
        arguments: [selectedGanre],
        queryableName: 'Movie',
        isView: false);
  }

  @override
  Stream<List<Movie>> findAllMovie() {
    return _queryAdapter.queryListStream('SELECT * FROM Movie',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int,
            posterPath: row['posterPath'] as String,
            title: row['title'] as String),
        queryableName: 'Movie',
        isView: false);
  }

  @override
  Stream<List<Ganre>> findAllGanre() {
    return _queryAdapter.queryListStream('SELECT * FROM Ganre',
        mapper: (Map<String, Object?> row) =>
            Ganre(id: row['id'] as int, name: row['name'] as String),
        queryableName: 'Ganre',
        isView: false);
  }

  @override
  Future<void> deleteAllMovies() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Movie');
  }

  @override
  Future<void> deleteAllGanreAndMovies() async {
    await _queryAdapter.queryNoReturn('DELETE FROM GanreAndMovie');
  }

  @override
  Future<void> deleteAllGanre() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Ganre');
  }

  @override
  Future<void> insertMovie(Movie movie) async {
    await _movieInsertionAdapter.insert(movie, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertGanre(Ganre ganre) async {
    await _ganreInsertionAdapter.insert(ganre, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertGanreAndMovie(GanreAndMovie ganreAndMovie) async {
    await _ganreAndMovieInsertionAdapter.insert(
        ganreAndMovie, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertListMovie(List<Movie> movie) {
    return _movieInsertionAdapter.insertListAndReturnIds(
        movie, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertListGanre(List<Ganre> ganre) {
    return _ganreInsertionAdapter.insertListAndReturnIds(
        ganre, OnConflictStrategy.abort);
  }

  @override
  Future<void> replaceMovies(List<Movie> movie) async {
    if (database is sqflite.Transaction) {
      await super.replaceMovies(movie);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.movieDao.replaceMovies(movie);
      });
    }
  }
}
