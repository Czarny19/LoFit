part of 'intake_config_bloc.dart';

enum IntakeConfigStatus { loading, view, saving, finished }

@immutable
class IntakeConfigState extends Equatable {
  const IntakeConfigState({this.status = IntakeConfigStatus.loading, this.prefs = emptyPrefs});

  final IntakeConfigStatus status;

  final PrefModel prefs;

  IntakeConfigState copyWith({IntakeConfigStatus? status, PrefModel? prefs}) {
    return IntakeConfigState(status: status ?? this.status, prefs: prefs ?? this.prefs);
  }

  @override
  List<Object> get props => [status, prefs];
}
