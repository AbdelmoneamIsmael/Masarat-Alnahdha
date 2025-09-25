part of 'home_rider_cubit.dart';

abstract class HomeRiderState extends Equatable {
  const HomeRiderState();

  @override
  List<Object> get props => [];
}

class HomeRiderInitial extends HomeRiderState {}
class ChangeOrderState extends HomeRiderState {}
