part of 'recipes_details_bloc.dart';

@immutable
class RecipesDetailsState extends Equatable {
  const RecipesDetailsState({this.recipe});

  final RecipeDetailsModel? recipe;

  RecipesDetailsState copyWith({RecipeDetailsModel? recipe}) {
    return RecipesDetailsState(recipe: recipe ?? this.recipe);
  }

  @override
  List<Object?> get props => [recipe];
}
