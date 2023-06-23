part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeDataSuccess extends  HomeState {
  final HomeResponse homeResponse;

  HomeDataSuccess(this.homeResponse);
}

class LoadingHomeState extends  HomeState {}
