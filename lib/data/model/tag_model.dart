import 'package:equatable/equatable.dart' show Equatable;

enum TagColor {
  green(0xFF32A852),
  red(0xFFB51919),
  blue(0xFF1938B5);

  const TagColor(this.value);

  final int value;
}

class TagModel extends Equatable {
  const TagModel({required this.id, required this.name, required this.color});

  final int id;
  final String name;
  final int color;

  TagModel copyWith({int? id, String? name, int? color}) {
    return TagModel(id: id ?? this.id, name: name ?? this.name, color: color ?? this.color);
  }

  @override
  List<Object> get props => [id, name, color];
}
