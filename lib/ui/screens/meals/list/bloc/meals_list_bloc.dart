import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:lofit/data/model/meal_model.dart';
import 'package:lofit/data/repositories/meals_repository.dart';

part 'meals_list_event.dart';

part 'meals_list_state.dart';

class MealsListBloc extends Bloc<MealsListEvent, MealsListState> {
  MealsListBloc({required MealsRepository mealsRepository})
    : _mealsRepository = mealsRepository,
      super(const MealsListState()) {
    on<MealsListInit>(_onInit);
    on<MealsListMovedToNextDay>(_onMovedToNextDay);
    on<MealsListMovedToPrevDay>(_onMovedToPrevDay);
    on<MealsListDateSelected>(_onDateSelected);
  }

  final MealsRepository _mealsRepository;

  void _onInit(MealsListInit event, Emitter<MealsListState> emit) async {
    emit(state.copyWith(meals: _mealsRepository.activeMeals, displayedDate: DateTime.now()));
  }

  void _onMovedToNextDay(MealsListMovedToNextDay event, Emitter<MealsListState> emit) async {
    emit(state.copyWith(displayedDate: state.displayedDate?.add(Duration(days: 1))));
  }

  void _onMovedToPrevDay(MealsListMovedToPrevDay event, Emitter<MealsListState> emit) async {
    emit(state.copyWith(displayedDate: state.displayedDate?.subtract(Duration(days: 1))));
  }

  void _onDateSelected(MealsListDateSelected event, Emitter<MealsListState> emit) async {
    emit(state.copyWith(displayedDate: event.selectedDate));
  }
}
