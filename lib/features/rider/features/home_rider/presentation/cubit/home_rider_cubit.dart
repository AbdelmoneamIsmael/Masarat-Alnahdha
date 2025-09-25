import 'package:masarat_alnahdha/features/rider/features/home_rider/domain/repositories/order_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_rider_state.dart';

class HomeRiderCubit extends Cubit<HomeRiderState> {
  HomeRiderCubit() : super(HomeRiderInitial());
  bool acceptOrder = false;
  List<RiderOrder> orders = <RiderOrder>[
    RiderOrder(
      id: 'order_123',
      orderNumber: 'ORD-2024-001',
      restaurant: Restaurant(
        imageUrl:
            "https://marketplace.canva.com/EAFpeiTrl4c/2/0/1600w/canva-abstract-chef-cooking-restaurant-free-logo-a1RYzvS1EFo.jpg",
        id: 'rest_456',
        name: 'مطعم الشرق الأوسط', // اسم المطعم
        phoneNumber: '+964771234567',
        address: Address(
          city: 'بغداد',
          district: 'المنصور',
          street: 'شارع 14 رمضان',
          details: 'مجاور مطعم الدانوب',
        ),
      ),
      items: [
        OrderItem(id: 'item_1', name: 'منسف', price: 25000, quantity: 2),
        OrderItem(id: 'item_2', name: 'سلطة', price: 5000, quantity: 1),
      ],
      status: OrderStatus.pendingApproval, // قيد الموافقة
      paymentStatus: PaymentStatus.notCollected, // لم يتم التحصيل بعد
      deliveryAddress: Address(
        city: 'بغداد',
        district: 'المنصور',
        street: 'شارع 14 رمضان',
        details: 'مجاور مطعم الدانوب',
      ),
      orderDate: DateTime.now(),
      estimatedDeliveryTime: DateTime.now().add(Duration(minutes: 45)),
      deliveryFee: 3000,
      taxAmount: 2000,
    ),
    // الطلب الأول
    RiderOrder(
      id: 'order_124',
      orderNumber: 'ORD-2024-002',
      restaurant: Restaurant(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsn7rvIjpKqisrl3H7Fp_LxDHJDH4ewop_bdyfICvvvgLZ3NIeCWGyKsT53RZKCnigLnk&usqp=CAU",
        id: 'rest_457',
        name: 'بيتزا إيطاليا',
        phoneNumber: '+9647701112233',
        address: Address(
          city: 'بغداد',
          district: 'زيونة',
          street: 'شارع فلسطين',
          details: 'مقابل مول النخيل',
        ),
      ),
      items: [
        OrderItem(
          id: 'item_3',
          name: 'بيتزا مارجريتا',
          price: 15000,
          quantity: 1,
        ),
        OrderItem(id: 'item_4', name: 'بطاطا مقلية', price: 4000, quantity: 2),
        OrderItem(id: 'item_5', name: 'بيبسي', price: 1000, quantity: 2),
      ],
      status: OrderStatus.preparing,
      paymentStatus: PaymentStatus.fullyPaid,
      deliveryAddress: Address(
        city: 'بغداد',
        district: 'زيونة',
        street: 'شارع فلسطين',
        details: 'مقابل مول النخيل',
      ),
      orderDate: DateTime.now(),
      estimatedDeliveryTime: DateTime.now().add(Duration(minutes: 30)),
      deliveryFee: 2500,
      taxAmount: 1500,
    ),

    // الطلب الثاني
    RiderOrder(
      id: 'order_125',
      orderNumber: 'ORD-2024-003',
      restaurant: Restaurant(
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/052/792/818/non_2x/restaurant-logo-design-vector.jpg",
        id: 'rest_458',
        name: 'كباب أربيل',
        phoneNumber: '+964773445566',
        address: Address(
          city: 'بغداد',
          district: 'كرادة',
          street: 'شارع العرصات',
          details: 'قرب مطعم السدة',
        ),
      ),
      items: [
        OrderItem(id: 'item_6', name: 'كباب عراقي', price: 12000, quantity: 3),
        OrderItem(id: 'item_7', name: 'خبز تنور', price: 1000, quantity: 3),
        OrderItem(id: 'item_8', name: 'لبن', price: 2000, quantity: 2),
      ],
      status: OrderStatus.delivering,
      paymentStatus: PaymentStatus.notCollected,
      deliveryAddress: Address(
        city: 'بغداد',
        district: 'كرادة',
        street: 'شارع العرصات',
        details: 'قرب مطعم السدة',
      ),
      orderDate: DateTime.now(),
      estimatedDeliveryTime: DateTime.now().add(Duration(minutes: 40)),
      deliveryFee: 2000,
      taxAmount: 1000,
    ),

    // الطلب الثالث
    RiderOrder(
      id: 'order_126',
      orderNumber: 'ORD-2024-004',
      restaurant: Restaurant(
        imageUrl:
            "https://media.istockphoto.com/id/981368726/vector/restaurant-food-drinks-logo-fork-knife-background-vector-image.jpg?s=612x612&w=0&k=20&c=9M26CBkCyEBqUPs3Ls5QCjYLZrB9sxwrSFmnAmNCopI=",
        id: 'rest_459',
        name: 'مطعم الياسمين',
        phoneNumber: '+964772998877',
        address: Address(
          city: 'بغداد',
          district: 'الأعظمية',
          street: 'شارع الضباط',
          details: 'قرب جامع الإمام الأعظم',
        ),
      ),
      items: [
        OrderItem(id: 'item_9', name: 'برياني دجاج', price: 10000, quantity: 2),
        OrderItem(id: 'item_10', name: 'شوربة عدس', price: 3000, quantity: 1),
        OrderItem(id: 'item_11', name: 'سلطة خضراء', price: 2500, quantity: 1),
      ],
      status: OrderStatus.delivered,
      paymentStatus: PaymentStatus.fullyPaid,
      deliveryAddress: Address(
        city: 'بغداد',
        district: 'الأعظمية',
        street: 'شارع الضباط',
        details: 'قرب جامع الإمام الأعظم',
      ),
      orderDate: DateTime.now(),
      estimatedDeliveryTime: DateTime.now().add(Duration(minutes: 50)),
      deliveryFee: 3500,
      taxAmount: 2000,
    ),
  ];
  RiderOrder? selectedOrder;
  void changeAcceptOrdersState(RiderOrder order) {
    selectedOrder = order;
    acceptOrder = !acceptOrder;

    emit(ChangeOrderState());
  }
}
