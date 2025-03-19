import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lofit/data/model/pref_model.dart';
import 'package:lofit/data/repositories/global_repository.dart';

part 'more_list_event.dart';

part 'more_list_state.dart';

class MoreListBloc extends Bloc<MoreListEvent, MoreListState> {
  MoreListBloc({required GlobalRepository prefsRepository})
    : _prefsRepository = prefsRepository,
      super(const MoreListState()) {
    on<MoreListInit>(_onInit);
  }

  final GlobalRepository _prefsRepository;

  void _onInit(MoreListInit event, Emitter<MoreListState> emit) async {
    emit(state.copyWith(status: MoreListStatus.list, prefs: _prefsRepository.prefs));
  }
}
