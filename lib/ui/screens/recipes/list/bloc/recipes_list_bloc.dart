import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:lofit/data/model/recipe_model.dart';
import 'package:lofit/data/repositories/recipes_repository.dart';

part 'recipes_list_event.dart';

part 'recipes_list_state.dart';

class RecipesListBloc extends Bloc<RecipesListEvent, RecipesListState> {
  RecipesListBloc({required RecipesRepository recipesRepository})
    : _recipesRepository = recipesRepository,
      super(RecipesListState()) {
    on<RecipesListInit>(_onInit);
  }

  final RecipesRepository _recipesRepository;

  void _onInit(RecipesListInit event, Emitter<RecipesListState> emit) async {
    final recipes = _recipesRepository.recipes;
    emit(state.copyWith(status: recipes.isEmpty ? RecipesListStatus.empty : RecipesListStatus.list, recipes: recipes));
  }
}
