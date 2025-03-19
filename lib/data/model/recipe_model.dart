import 'package:equatable/equatable.dart' show Equatable;

class RecipeBasicModel extends Equatable {
  const RecipeBasicModel({required this.id, required this.name, required this.kcal, required this.timeToMake});

  final int id;
  final String name;
  final int kcal;
  final int timeToMake;

  RecipeBasicModel copyWith({int? id, String? name, int? kcal, int? timeToMake}) {
    return RecipeBasicModel(
      id: id ?? this.id,
      name: name ?? this.name,
      kcal: kcal ?? this.kcal,
      timeToMake: timeToMake ?? this.timeToMake,
    );
  }

  @override
  List<Object> get props => [id, name, kcal, timeToMake];

  // String? get formattedTime {
  //   if (time < 0) {
  //     return null;
  //   }
  //
  //   final dateTime = DateTime.now().copyWith(hour: (time / 60).round(), minute: time % 60);
  //   return DateFormat.Hm().format(dateTime);
  // }
}

class RecipeDetailsModel extends RecipeBasicModel {
  const RecipeDetailsModel({
    required super.id,
    required super.name,
    required super.kcal,
    required super.timeToMake,
    required this.steps,
  });

  final Map<int, String> steps;

  @override
  RecipeDetailsModel copyWith({int? id, String? name, int? kcal, int? timeToMake, Map<int, String>? steps}) {
    return RecipeDetailsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      kcal: kcal ?? this.kcal,
      timeToMake: timeToMake ?? this.timeToMake,
      steps: steps ?? this.steps,
    );
  }

  @override
  List<Object> get props => [id, name, kcal, timeToMake, steps];

  // String? get formattedTime {
  //   if (time < 0) {
  //     return null;
  //   }
  //
  //   final dateTime = DateTime.now().copyWith(hour: (time / 60).round(), minute: time % 60);
  //   return DateFormat.Hm().format(dateTime);
  // }
}
