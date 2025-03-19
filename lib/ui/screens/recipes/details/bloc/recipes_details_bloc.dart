import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:lofit/data/model/recipe_model.dart';
import 'package:lofit/data/repositories/recipes_repository.dart';

part 'recipes_details_event.dart';

part 'recipes_details_state.dart';

class RecipesDetailsBloc extends Bloc<RecipesDetailsEvent, RecipesDetailsState> {
  RecipesDetailsBloc({required RecipesRepository recipesRepository})
    : _recipesRepository = recipesRepository,
      super(RecipesDetailsState()) {
    on<RecipesDetailsInit>(_onInit);
    on<RecipesDetailsNameChanged>(_onNameChanged);
    on<RecipesDetailsTimeToMakeChanged>(_onTimeToMakeChanged);
    on<RecipesDetailsStepAdded>(_onStepAdded);
    on<RecipesDetailsStepDeleted>(_onStepDeleted);
    on<RecipesDetailsStepChanged>(_onStepChanged);
  }

  final RecipesRepository _recipesRepository;

  void _onInit(RecipesDetailsInit event, Emitter<RecipesDetailsState> emit) async {
    if (event.recipeId > 0) {
      // TODO
    }

    emit(state.copyWith(recipe: RecipeDetailsModel(id: -1, name: '', kcal: 0, timeToMake: 0, steps: {})));
  }

  void _onNameChanged(RecipesDetailsNameChanged event, Emitter<RecipesDetailsState> emit) async {
    emit(state.copyWith(recipe: state.recipe?.copyWith(name: event.name)));
  }

  void _onTimeToMakeChanged(RecipesDetailsTimeToMakeChanged event, Emitter<RecipesDetailsState> emit) async {
    emit(state.copyWith(recipe: state.recipe?.copyWith(timeToMake: event.time)));
  }

  void _onStepAdded(RecipesDetailsStepAdded event, Emitter<RecipesDetailsState> emit) async {
    final recipe = state.recipe!;
    final steps = {...recipe.steps};
    steps[recipe.steps.length] = '';
    emit(state.copyWith(recipe: state.recipe!.copyWith(steps: steps)));
  }

  void _onStepDeleted(RecipesDetailsStepDeleted event, Emitter<RecipesDetailsState> emit) async {
    final recipe = state.recipe!;
    final steps = {...recipe.steps}..remove(recipe.steps.length - 1);
    emit(state.copyWith(recipe: state.recipe!.copyWith(steps: steps)));
  }

  void _onStepChanged(RecipesDetailsStepChanged event, Emitter<RecipesDetailsState> emit) async {
    final recipe = state.recipe!;
    final steps = {...recipe.steps};
    steps[event.index] = event.step;
    emit(state.copyWith(recipe: recipe.copyWith(steps: steps)));
  }
}
