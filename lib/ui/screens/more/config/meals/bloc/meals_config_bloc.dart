import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:lofit/data/model/meal_model.dart';
import 'package:lofit/data/repositories/meals_repository.dart';

part 'meals_config_event.dart';

part 'meals_config_state.dart';

class MealsConfigBloc extends Bloc<MealsConfigEvent, MealsConfigState> {
  MealsConfigBloc({required MealsRepository mealsRepository})
    : _mealsRepository = mealsRepository,
      super(MealsConfigState()) {
    on<MealsConfigInit>(_onInit);
  }

  final MealsRepository _mealsRepository;

  void _onInit(MealsConfigInit event, Emitter<MealsConfigState> emit) async {
    emit(state.copyWith(meals: _mealsRepository.allMeals, status: MealsConfigStatus.view));
  }
}
