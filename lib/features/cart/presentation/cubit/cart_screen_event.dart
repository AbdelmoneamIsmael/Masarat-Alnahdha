 
abstract class CartScreenEvent {}

class GetBillDetails extends CartScreenEvent {}
class CalcTotal extends CartScreenEvent {}
class ApplyDiscount extends CartScreenEvent {}
class RemoveDiscount extends CartScreenEvent {}
class CreateOrder extends CartScreenEvent {

}