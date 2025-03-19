part of '../database.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get barcode => integer()();

  TextColumn get name => text()();

  IntColumn get kcal => integer()();

  RealColumn get proteins => real()();

  RealColumn get carbs => real()();

  RealColumn get fats => real()();

  BoolColumn get isFavorite => boolean().clientDefault(() => false)();

  BoolColumn get isCustom => boolean().clientDefault(() => false)();
}
