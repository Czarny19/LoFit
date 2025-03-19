part of 'intake_config_bloc.dart';

@immutable
sealed class IntakeConfigEvent {
  const IntakeConfigEvent();
}

class IntakeConfigInit extends IntakeConfigEvent {}

class IntakeConfigUpdatedKcal extends IntakeConfigEvent {
  const IntakeConfigUpdatedKcal(this.kcal);

  final int kcal;
}

class IntakeConfigUpdatedProteins extends IntakeConfigEvent {
  const IntakeConfigUpdatedProteins(this.proteins);

  final int proteins;
}

class IntakeConfigUpdatedCarbs extends IntakeConfigEvent {
  const IntakeConfigUpdatedCarbs(this.carbs);

  final int carbs;
}

class IntakeConfigUpdatedFats extends IntakeConfigEvent {
  const IntakeConfigUpdatedFats(this.fats);

  final int fats;
}

class IntakeConfigSaved extends IntakeConfigEvent {}
