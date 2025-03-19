import 'package:equatable/equatable.dart' show Equatable;
import 'package:intl/intl.dart';

class MealModel extends Equatable {
  const MealModel({required this.id, required this.name, required this.time, required this.isActive});

  final int id;
  final String name;
  final int time;
  final bool isActive;

  MealModel copyWith({int? id, String? name, int? time, bool? isActive}) {
    return MealModel(
      id: id ?? this.id,
      name: name ?? this.name,
      time: time ?? this.time,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object> get props => [id, name, time, isActive];

  String? get formattedTime {
    if (time < 0) {
      return null;
    }

    final dateTime = DateTime.now().copyWith(hour: (time / 60).round(), minute: time % 60);
    return DateFormat.Hm().format(dateTime);
  }
}
