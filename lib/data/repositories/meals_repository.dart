import 'package:lofit/data/db/database.dart';
import 'package:lofit/data/model/meal_model.dart';
import 'package:lofit/data/services/meals_service.dart';

class MealsRepository {
  MealsRepository(Database db) {
    _mealsService = MealsService(db);
  }

  late final MealsService _mealsService;

  List<MealModel> _activeMeals = const [];
  List<MealModel> _notActiveMeals = const [];

  List<MealModel> get activeMeals => _activeMeals;

  List<MealModel> get allMeals => _activeMeals + _notActiveMeals;

  Future<void> loadMeals() async {
    _activeMeals = await _mealsService.getMeals(true);
    _notActiveMeals = await _mealsService.getMeals(false);
  }

  Future<void> addMeal(MealModel meal) async {
    final id = await _mealsService.createMeal(meal);

    if (meal.isActive) {
      _activeMeals = [..._activeMeals, meal.copyWith(id: id)];
    } else {
      _notActiveMeals = [..._notActiveMeals, meal.copyWith(id: id)];
    }
  }

  Future<void> updateMeal(MealModel meal) async {
    if (meal.isActive) {
      final index = _activeMeals.indexOf(_activeMeals.firstWhere((test) => test.id == meal.id));
      _activeMeals[index] = meal;
      _activeMeals = [..._activeMeals];
    } else {
      final index = _notActiveMeals.indexOf(_notActiveMeals.firstWhere((test) => test.id == meal.id));
      _notActiveMeals[index] = meal;
      _notActiveMeals = [..._notActiveMeals];
    }

    _mealsService.updateMeal(meal);
  }

  Future<void> deleteMeal(MealModel meal) async {
    if (meal.isActive) {
      _activeMeals = [..._activeMeals]..remove(meal);
    } else {
      _notActiveMeals = [..._notActiveMeals]..remove(meal);
    }

    _mealsService.deleteMeal(meal.id);
  }
}
