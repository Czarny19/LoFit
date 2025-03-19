part of 'more_list_bloc.dart';

enum MoreListStatus { loading, list }

@immutable
class MoreListState extends Equatable {
  const MoreListState({this.status = MoreListStatus.loading, this.prefs = emptyPrefs});

  final MoreListStatus status;
  final PrefModel prefs;

  MoreListState copyWith({MoreListStatus? status, PrefModel? prefs}) {
    return MoreListState(status: status ?? this.status, prefs: prefs ?? this.prefs);
  }

  @override
  List<Object> get props => [status, prefs];
}
