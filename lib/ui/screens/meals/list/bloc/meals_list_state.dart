part of 'meals_list_bloc.dart';

@immutable
class MealsListState extends Equatable {
  const MealsListState({this.meals = const [], this.displayedDate});

  final List<MealModel> meals;

  final DateTime? displayedDate;

  MealsListState copyWith({List<MealModel>? meals, DateTime? displayedDate}) {
    return MealsListState(meals: meals ?? this.meals, displayedDate: displayedDate ?? this.displayedDate);
  }

  @override
  List<Object?> get props => [meals, displayedDate];
}
