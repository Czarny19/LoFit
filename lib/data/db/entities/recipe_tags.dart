part of '../database.dart';

class RecipeTags extends Table {
  IntColumn get recipe => integer().references(Recipes, #id)();

  IntColumn get tag => integer().references(Tags, #id)();
}
