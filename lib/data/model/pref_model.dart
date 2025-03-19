import 'package:equatable/equatable.dart' show Equatable;

class PrefModel extends Equatable {
  const PrefModel({
    required this.userName,
    required this.dailyKcal,
    required this.dailyProteins,
    required this.dailyFats,
    required this.dailyCarbs,
  });

  final String userName;
  final int dailyKcal;
  final int dailyProteins;
  final int dailyFats;
  final int dailyCarbs;

  PrefModel copyWith({String? userName, int? dailyKcal, int? dailyProteins, int? dailyFats, int? dailyCarbs}) {
    return PrefModel(
      userName: userName ?? this.userName,
      dailyKcal: dailyKcal ?? this.dailyKcal,
      dailyProteins: dailyProteins ?? this.dailyProteins,
      dailyFats: dailyFats ?? this.dailyFats,
      dailyCarbs: dailyCarbs ?? this.dailyCarbs,
    );
  }

  @override
  List<Object> get props => [userName, dailyKcal, dailyProteins, dailyFats, dailyCarbs];

  int get totalPercentage {
    if (dailyKcal == 0) {
      return 0;
    }

    final proteinsTotalPercentage = (((dailyProteins * 4) / dailyKcal) * 100).round();
    final fatsTotalPercentage = (((dailyFats * 9) / dailyKcal) * 100).round();
    final carbsTotalPercentage = (((dailyCarbs * 4) / dailyKcal) * 100).round();

    return proteinsTotalPercentage + fatsTotalPercentage + carbsTotalPercentage;
  }
}

const emptyPrefs = PrefModel(userName: '', dailyKcal: 2000, dailyProteins: 150, dailyFats: 67, dailyCarbs: 200);
