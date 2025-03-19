part of 'meals_config_bloc.dart';

@immutable
sealed class MealsConfigEvent {
  const MealsConfigEvent();
}

class MealsConfigInit extends MealsConfigEvent {}
