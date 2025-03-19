part of '../database.dart';

class Meals extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  IntColumn get time => integer().clientDefault(() => 480)();

  BoolColumn get isActive => boolean().clientDefault(() => true)();
}
