import 'package:floor/floor.dart';

import 'ganre.dart';
import 'movie.dart';

@Entity(
  tableName: 'GanreAndMovie',
  foreignKeys: [
    ForeignKey(
      childColumns: ['ganreId'],
      parentColumns: ['id'],
      entity: Ganre,
    ),
    ForeignKey(
        childColumns: ['movieId'],
        parentColumns: ['id'],
        entity: Movie)
  ],
)
class GanreAndMovie{
  @PrimaryKey(autoGenerate: true)
  final int? uid;
  final int ganreId;
  final int movieId;

  GanreAndMovie({this.uid, required this.ganreId, required this.movieId});
}