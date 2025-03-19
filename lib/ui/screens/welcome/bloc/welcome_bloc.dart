import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lofit/data/model/meal_model.dart';
import 'package:lofit/data/model/pref_model.dart';
import 'package:lofit/data/model/tag_model.dart';
import 'package:lofit/data/repositories/global_repository.dart';
import 'package:lofit/data/repositories/meals_repository.dart';
import 'package:lofit/data/repositories/recipes_repository.dart';
import 'package:lofit/data/repositories/tags_repository.dart';
import 'package:lofit/l10n/gen/app_localizations.dart';

part 'welcome_event.dart';

part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc({
    required GlobalRepository globalRepository,
    required MealsRepository mealsRepository,
    required RecipesRepository recipeRepository,
    required TagsRepository tagsRepository,
  }) : _globalRepository = globalRepository,
       _mealsRepository = mealsRepository,
       _recipeRepository = recipeRepository,
       _tagsRepository = tagsRepository,
       super(const WelcomeState()) {
    on<WelcomeInit>(_onInit);
    on<WelcomeStarted>(_onStarted);
    on<WelcomeUpdatedUserName>(_onUserNameUpdated);
    on<WelcomeUpdatedKcal>(_onKcalUpdated);
    on<WelcomeUpdatedProteins>(_onProteinsUpdated);
    on<WelcomeUpdatedFats>(_onFatsUpdated);
    on<WelcomeUpdatedCarbs>(_onCarbsUpdated);
    on<WelcomeFormSaved>(_onFormSaved);
  }

  final GlobalRepository _globalRepository;
  final MealsRepository _mealsRepository;
  final RecipesRepository _recipeRepository;
  final TagsRepository _tagsRepository;

  void _onInit(WelcomeInit event, Emitter<WelcomeState> emit) async {
    await Future.delayed(const Duration(seconds: 1));

    if (await _globalRepository.prefsExist()) {
      await _globalRepository.loadPrefs();
      await _mealsRepository.loadMeals();
      await _recipeRepository.loadRecipes();
      await _tagsRepository.loadTags();
      emit(state.copyWith(status: WelcomeStatus.skip));
      return;
    }

    emit(state.copyWith(status: WelcomeStatus.start));
  }

  void _onStarted(WelcomeStarted event, Emitter<WelcomeState> emit) {
    emit(state.copyWith(status: WelcomeStatus.form));
  }

  void _onUserNameUpdated(WelcomeUpdatedUserName event, Emitter<WelcomeState> emit) {
    emit(state.copyWith(newPrefs: state.newPrefs.copyWith(userName: event.userName)));
  }

  void _onKcalUpdated(WelcomeUpdatedKcal event, Emitter<WelcomeState> emit) {
    emit(state.copyWith(newPrefs: state.newPrefs.copyWith(dailyKcal: event.kcal)));
  }

  void _onProteinsUpdated(WelcomeUpdatedProteins event, Emitter<WelcomeState> emit) {
    emit(state.copyWith(newPrefs: state.newPrefs.copyWith(dailyProteins: event.proteins)));
  }

  void _onFatsUpdated(WelcomeUpdatedFats event, Emitter<WelcomeState> emit) {
    emit(state.copyWith(newPrefs: state.newPrefs.copyWith(dailyFats: event.fats)));
  }

  void _onCarbsUpdated(WelcomeUpdatedCarbs event, Emitter<WelcomeState> emit) {
    emit(state.copyWith(newPrefs: state.newPrefs.copyWith(dailyCarbs: event.carbs)));
  }

  void _onFormSaved(WelcomeFormSaved event, Emitter<WelcomeState> emit) async {
    emit(state.copyWith(status: WelcomeStatus.saving));

    final l10n = event.l10n;

    await _mealsRepository.addMeal(MealModel(id: -1, name: l10n.defaultMealBreakfast, time: 480, isActive: true));
    await _mealsRepository.addMeal(MealModel(id: -1, name: l10n.defaultMealDinner, time: 720, isActive: true));
    await _mealsRepository.addMeal(MealModel(id: -1, name: l10n.defaultMealSupper, time: 1080, isActive: true));

    await _tagsRepository.addTag(TagModel(id: -1, name: l10n.defaultTagVegan, color: TagColor.green.value));
    await _tagsRepository.addTag(TagModel(id: -1, name: l10n.defaultTagQuick, color: TagColor.red.value));
    await _tagsRepository.addTag(TagModel(id: -1, name: l10n.defaultTagProteinRich, color: TagColor.blue.value));

    await _globalRepository.savePrefs(state.newPrefs);

    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(status: WelcomeStatus.finished));
  }
}
