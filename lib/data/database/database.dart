import 'dart:async';
import 'package:floor/floor.dart';
import 'package:individual_project/data/dao/movie_dao.dart';
import 'package:individual_project/model/movie.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Movie])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;
}