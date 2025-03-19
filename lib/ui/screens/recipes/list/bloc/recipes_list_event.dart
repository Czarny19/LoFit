part of 'recipes_list_bloc.dart';

@immutable
sealed class RecipesListEvent {
  const RecipesListEvent();
}

class RecipesListInit extends RecipesListEvent {}
