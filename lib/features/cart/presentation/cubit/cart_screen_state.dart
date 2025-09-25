
abstract class CartScreenState {}

class CartScreenInitial extends CartScreenState {}

class GetBillDetailsState extends CartScreenState {}

class CantApplayDiscount extends CartScreenState {
  final String message;
  CantApplayDiscount({required this.message});
}

class LoadingGettingCoupon extends CartScreenState {}

class SuccessGettingCoupon extends CartScreenState {}

class ErrorGettingCoupon extends CartScreenState {
  String message;
  ErrorGettingCoupon({required this.message});
}
class OrderCreatedState extends CartScreenState {
  // OrderModel orderModel;
  OrderCreatedState(
    // {required this.orderModel}
    );
}
