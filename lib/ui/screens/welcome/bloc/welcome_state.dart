part of 'welcome_bloc.dart';

enum WelcomeStatus { loading, skip, start, form, saving, finished }

@immutable
class WelcomeState extends Equatable {
  const WelcomeState({this.status = WelcomeStatus.loading, this.newPrefs = emptyPrefs});

  final WelcomeStatus status;
  final PrefModel newPrefs;

  WelcomeState copyWith({WelcomeStatus? status, PrefModel? newPrefs}) {
    return WelcomeState(status: status ?? this.status, newPrefs: newPrefs ?? this.newPrefs);
  }

  @override
  List<Object> get props => [status, newPrefs];
}
