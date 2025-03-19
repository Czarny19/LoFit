part of 'more_list_bloc.dart';

@immutable
sealed class MoreListEvent {
  const MoreListEvent();
}

class MoreListInit extends MoreListEvent {}
