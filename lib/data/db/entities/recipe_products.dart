part of '../database.dart';

class RecipeProducts extends Table {
  IntColumn get recipe => integer().references(Recipes, #id)();

  IntColumn get product => integer().references(Products, #id)();

  IntColumn get quantity => integer()();
}
