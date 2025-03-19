part of '../database.dart';

class RecipeSteps extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get recipe => integer().references(Recipes, #id)();

  IntColumn get index => integer()();

  TextColumn get step => text()();
}
