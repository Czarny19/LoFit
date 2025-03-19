part of 'recipes_list_bloc.dart';

enum RecipesListStatus { loading, empty, list }

@immutable
class RecipesListState extends Equatable {
  const RecipesListState({this.status = RecipesListStatus.loading, this.recipes = const []});

  final RecipesListStatus status;
  final List<RecipeBasicModel> recipes;

  RecipesListState copyWith({RecipesListStatus? status, List<RecipeBasicModel>? recipes}) {
    return RecipesListState(status: status ?? this.status, recipes: recipes ?? this.recipes);
  }

  @override
  List<Object> get props => [status, recipes];
}
