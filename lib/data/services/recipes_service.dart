import 'package:drift/drift.dart';
import 'package:lofit/data/db/database.dart';
import 'package:lofit/data/model/recipe_model.dart';

class RecipesService {
  const RecipesService(this._db);

  final Database _db;

  Future<List<RecipeBasicModel>> getRecipes() async {
    return (await _db.managers.recipes.get())
        .map(
          (recipe) =>
              RecipeBasicModel(id: recipe.id, name: recipe.name, kcal: recipe.kcal, timeToMake: recipe.timeToMake),
        )
        .toList();
  }

  Future<int> createRecipe(RecipeDetailsModel recipe) async {
    return _db.transaction(() async {
      return await _db.managers.recipes.create(
        (o) => o(name: recipe.name, kcal: recipe.kcal, timeToMake: recipe.timeToMake),
        mode: InsertMode.insert,
      );
    });
  }

  Future<void> updateRecipe(RecipeDetailsModel recipe) async {
    return _db.transaction(() async {
      await _db.managers.recipes
          .filter((f) => f.id.equals(recipe.id))
          .update((o) => o(name: Value(recipe.name), kcal: Value(recipe.kcal), timeToMake: Value(recipe.timeToMake)));
    });
  }

  Future<void> deleteRecipe(int recipeId) async {
    return _db.transaction(() async {
      await _db.managers.meals.filter((f) => f.id.equals(recipeId)).delete();
    });
  }
}
