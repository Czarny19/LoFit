part of 'recipes_details_bloc.dart';

@immutable
sealed class RecipesDetailsEvent {
  const RecipesDetailsEvent();
}

class RecipesDetailsInit extends RecipesDetailsEvent {
  const RecipesDetailsInit(this.recipeId);

  final int recipeId;
}

class RecipesDetailsNameChanged extends RecipesDetailsEvent {
  const RecipesDetailsNameChanged(this.name);

  final String name;
}

class RecipesDetailsTimeToMakeChanged extends RecipesDetailsEvent {
  const RecipesDetailsTimeToMakeChanged(this.time);

  final int time;
}

class RecipesDetailsStepAdded extends RecipesDetailsEvent {}

class RecipesDetailsStepDeleted extends RecipesDetailsEvent {}

class RecipesDetailsStepChanged extends RecipesDetailsEvent {
  const RecipesDetailsStepChanged(this.index, this.step);

  final int index;

  final String step;
}

class RecipesDetailsSaved extends RecipesDetailsEvent {}
