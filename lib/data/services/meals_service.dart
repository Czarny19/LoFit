import 'package:drift/drift.dart';
import 'package:lofit/data/db/database.dart';
import 'package:lofit/data/model/meal_model.dart';

class MealsService {
  const MealsService(this._db);

  final Database _db;

  Future<List<MealModel>> getMeals(bool active) async {
    return (await _db.managers.meals.filter((f) => f.isActive.equals(active)).get())
        .map((meal) => MealModel(id: meal.id, name: meal.name, time: meal.time, isActive: meal.isActive))
        .toList();
  }

  Future<int> createMeal(MealModel meal) async {
    return await _db.managers.meals.create(
      (o) => o(name: meal.name, time: Value(meal.time), isActive: Value(meal.isActive)),
      mode: InsertMode.insert,
    );
  }

  Future<void> updateMeal(MealModel meal) async {
    await _db.managers.meals
        .filter((f) => f.id.equals(meal.id))
        .update((o) => o(name: Value(meal.name), time: Value(meal.time), isActive: Value(meal.isActive)));
  }

  Future<void> deleteMeal(int mealId) async {
    await _db.managers.meals.filter((f) => f.id.equals(mealId)).delete();
  }
}
