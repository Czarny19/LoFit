part of 'meals_config_bloc.dart';

enum MealsConfigStatus { loading, view, saving, finished }

@immutable
class MealsConfigState extends Equatable {
  const MealsConfigState({this.status = MealsConfigStatus.loading, this.meals = const []});

  final MealsConfigStatus status;

  final List<MealModel> meals;

  // final List<MealModel> newMeals;

  MealsConfigState copyWith({MealsConfigStatus? status, List<MealModel>? meals}) {
    return MealsConfigState(status: status ?? this.status, meals: meals ?? this.meals);
  }

  @override
  List<Object> get props => [status, meals];
}
