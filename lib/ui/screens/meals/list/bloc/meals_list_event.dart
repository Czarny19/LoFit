part of 'meals_list_bloc.dart';

@immutable
sealed class MealsListEvent {
  const MealsListEvent();
}

class MealsListInit extends MealsListEvent {}

class MealsListMovedToNextDay extends MealsListEvent {}

class MealsListMovedToPrevDay extends MealsListEvent {}

class MealsListDateSelected extends MealsListEvent {
  const MealsListDateSelected(this.selectedDate);

  final DateTime selectedDate;
}
