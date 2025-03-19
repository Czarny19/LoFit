part of '../database.dart';

class Prefs extends Table {
  TextColumn get userName => text()();

  IntColumn get dailyKcal => integer()();

  IntColumn get dailyProteins => integer()();

  IntColumn get dailyFats => integer()();

  IntColumn get dailyCarbs => integer()();

  @override
  Set<Column> get primaryKey => {userName};
}
