part of '../database.dart';

class Foods extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get quantity => integer()();

  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();

  IntColumn get meal => integer().references(Meals, #id)();

  IntColumn get recipe => integer().nullable().references(Recipes, #id)();

  IntColumn get product => integer().nullable().references(Products, #id)();
}
