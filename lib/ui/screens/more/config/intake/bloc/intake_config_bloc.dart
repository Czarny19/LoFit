import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:lofit/data/model/pref_model.dart';
import 'package:lofit/data/repositories/global_repository.dart';

part 'intake_config_event.dart';

part 'intake_config_state.dart';

class IntakeConfigBloc extends Bloc<IntakeConfigEvent, IntakeConfigState> {
  IntakeConfigBloc({required GlobalRepository prefsRepository})
    : _prefsRepository = prefsRepository,
      super(const IntakeConfigState()) {
    on<IntakeConfigInit>(_onInit);
    on<IntakeConfigUpdatedKcal>(_onKcalUpdated);
    on<IntakeConfigUpdatedProteins>(_onProteinsUpdated);
    on<IntakeConfigUpdatedFats>(_onFatsUpdated);
    on<IntakeConfigUpdatedCarbs>(_onCarbsUpdated);
    on<IntakeConfigSaved>(_onSaved);
  }

  final GlobalRepository _prefsRepository;

  void _onInit(IntakeConfigInit event, Emitter<IntakeConfigState> emit) async {
    emit(state.copyWith(prefs: _prefsRepository.prefs, status: IntakeConfigStatus.view));
  }

  void _onKcalUpdated(IntakeConfigUpdatedKcal event, Emitter<IntakeConfigState> emit) {
    emit(state.copyWith(prefs: state.prefs.copyWith(dailyKcal: event.kcal)));
  }

  void _onProteinsUpdated(IntakeConfigUpdatedProteins event, Emitter<IntakeConfigState> emit) {
    emit(state.copyWith(prefs: state.prefs.copyWith(dailyProteins: event.proteins)));
  }

  void _onFatsUpdated(IntakeConfigUpdatedFats event, Emitter<IntakeConfigState> emit) {
    emit(state.copyWith(prefs: state.prefs.copyWith(dailyFats: event.fats)));
  }

  void _onCarbsUpdated(IntakeConfigUpdatedCarbs event, Emitter<IntakeConfigState> emit) {
    emit(state.copyWith(prefs: state.prefs.copyWith(dailyCarbs: event.carbs)));
  }

  void _onSaved(IntakeConfigSaved event, Emitter<IntakeConfigState> emit) async {
    emit(state.copyWith(status: IntakeConfigStatus.saving));
    await _prefsRepository.updatePrefs(state.prefs);
    emit(state.copyWith(status: IntakeConfigStatus.finished));
  }
}
