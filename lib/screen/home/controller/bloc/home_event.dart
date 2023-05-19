part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class ValueGet extends HomeEvent{}
class ValueGetSucces extends HomeEvent{}