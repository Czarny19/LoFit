part of '../database.dart';

class Recipes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  IntColumn get kcal => integer()();

  IntColumn get timeToMake => integer()();

  TextColumn get picturePath => text().nullable()();
}
