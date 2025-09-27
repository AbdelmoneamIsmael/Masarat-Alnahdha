
import 'package:equatable/equatable.dart';

abstract class CartScreenState extends Equatable {}

class CartScreenInitial extends CartScreenState {
    @override
  List<Object?> get props => [];
}

class GetBillDetailsState extends CartScreenState {
    @override
  List<Object?> get props => [];
}
class CalcTotalState extends CartScreenState {
   final num totalPrice;
  CalcTotalState({required this.totalPrice});
  @override
  List<Object?> get props => [totalPrice];
}

class CantApplayDiscount extends CartScreenState {
  final String message;
  CantApplayDiscount({required this.message});
  @override
  List<Object?> get props => [message];
}

class LoadingGettingCoupon extends CartScreenState {
    @override
  List<Object?> get props => [];
}

class SuccessGettingCoupon extends CartScreenState {
    @override
  List<Object?> get props => [];
}

class ErrorGettingCoupon extends CartScreenState {
  String message;
  ErrorGettingCoupon({required this.message});
  @override
  List<Object?> get props => [message];
}
class OrderCreatedState extends CartScreenState {
  // OrderModel orderModel;
  OrderCreatedState(
    // {required this.orderModel}
    );
      @override
  List<Object?> get props => [];
}
