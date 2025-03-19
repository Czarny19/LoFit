import 'package:lofit/data/db/database.dart';
import 'package:lofit/data/model/recipe_model.dart';
import 'package:lofit/data/services/recipes_service.dart';

class RecipesRepository {
  RecipesRepository(Database db) {
    _recipeService = RecipesService(db);
  }

  late final RecipesService _recipeService;

  List<RecipeBasicModel> _recipes = const [];

  List<RecipeBasicModel> get recipes => _recipes;

  Future<void> loadRecipes() async {
    _recipes = await _recipeService.getRecipes();
  }

  Future<void> addRecipe(RecipeDetailsModel recipe) async {
    final id = await _recipeService.createRecipe(recipe);
    _recipes = [..._recipes, recipe.copyWith(id: id)];
  }

  Future<void> updateRecipe(RecipeDetailsModel recipe) async {
    final index = _recipes.indexOf(_recipes.firstWhere((test) => test.id == recipe.id));
    _recipes[index] = recipe;
    _recipes = [..._recipes];

    _recipeService.updateRecipe(recipe);
  }

  Future<void> deleteRecipe(RecipeBasicModel recipe) async {
    _recipes = [..._recipes]..remove(recipe);
    _recipeService.deleteRecipe(recipe.id);
  }
}
