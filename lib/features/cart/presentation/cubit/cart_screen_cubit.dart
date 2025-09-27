import 'dart:async';

import 'package:masarat_alnahdha/features/cart/data/models/cart_model.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_event.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenCubit extends Bloc<CartScreenEvent, CartScreenState> {
  double totalPriceWithShipping = 0;
  double totalPrice = 0;
  bool applayStatus = true;
  double totalDiscount = 0;
  double discountPercentage = 0;
  double discountAmount = 0;
  double shipping = 0;
  num totalQuantity = 0;
  TextEditingController discountController = TextEditingController();
  // final CopounRepo copounRepo;
  final List<CartModel> cartItems = [
    //     CartModel(
    //   availableQuantity: 12,
    //   price: 6000,
    //   productId: 98,
    //   name: 'الصدور',
    //   description: "صدور دجاج طازجة ومغذية، مثالية للوجبات الصحية.",
    //   imageUrl: "assets/masarat/الصدور/4868979d-ff91-4e74-92ae-0e265851ca85.png",
    // ),
    // CartModel(
    //   availableQuantity: 35,
    //   price: 15000,
    //   productId: 97,
    //   name: "الوطنية",
    //   description: "دجاج الوطنية 1100 جرام بجودة مميزة وطعم شهي.",
    //   imageUrl: "assets/masarat/الوطنية/دجاج وطنية 1100.png",
    // ),
    // CartModel(
    //   availableQuantity: 50,
    //   price: 5000,
    //   productId: 96,
    //   name: 'خضراوات',
    //   description: "خضراوات طازجة متنوعة، جاهزة للطهي السريع.",
    //   imageUrl: "assets/masarat/خضراوات/5.1.1.1-Seara-French-Fries-1-KG-Front.png",
    // ),
    CartModel(
      availableQuantity: 8,
      category: 'أطباق رئيسية',
      description: "صدور دجاج طازجة ومغذية، مثالية للوجبات الصحية.",
      imageUrl:
          "assets/masarat/الصدور/4868979d-ff91-4e74-92ae-0e265851ca85.png",
      price: 180,
      productId: 1,
      quantity: 2,
      title: 'الصدور',
    ),

    CartModel(
      availableQuantity: 10,
      category: 'أطباق رئيسية',
      imageUrl: "assets/masarat/الوطنية/دجاج وطنية 1100.png",
      price: 120,
      productId: 2,
      quantity: 1,
      description: "دجاج الوطنية 1100 جرام بجودة مميزة وطعم شهي.",
      title: 'الوطنية',
    ),
    CartModel(
      title: "خضراوات",
      description: "خضراوات طازجة متنوعة، جاهزة للطهي السريع.",
      availableQuantity: 6,
      category: 'أطباق رئيسية',
      imageUrl:
          "assets/masarat/خضراوات/5.1.1.1-Seara-French-Fries-1-KG-Front.png",
      price: 150,
      productId: 3,
      quantity: 3,
    ),
  ];

  CartScreenCubit(
    // {
    // required this.copounRepo,
    // required this.cartItems,
    // }
  ) : super(CartScreenInitial()) {
    on<CartScreenEvent>((event, emit) {
      if (event is CalcTotal) {
        calculateTotalPrice(emit);
      }
    });

    // on<CartScreenEvent>(
    //   (event, emit) async {
    //     if (event is GetBillDetails) {
    //       calculateTotalBills(emit);
    //     }
    //     if (event is ApplyDiscount) {
    //       await applayCoupon(emit);
    //     }
    //     if (event is RemoveDiscount) {
    //       await removeCoupon(emit);
    //     }
    //     if (event is CreateOrder) {
    //       List<OrderItem> orderItems = [];
    //       for (var item in cartItems) {
    //         orderItems.add(
    //           OrderItem(
    //             productSizeId: item.productSizeId,
    //             quantity: item.quantity,
    //           ),
    //         );
    //       }
    //       OrderModel orderModel = OrderModel(
    //         addressId: -1,
    //         couponCode: discountController.text,
    //         orderItems: orderItems,
    //       );
    //       emit(OrderCreatedState(orderModel: orderModel));
    //     }
    //   },
    // );
    // init();

    // add(GetBillDetails());
  }
  @override
  Future<void> close() {
    discountController.dispose();

    return super.close();
  }

  // Future<void> applayCoupon(Emitter<CartScreenState> emit) async {
  //   if (discountController.text.isNotEmpty) {
  //     if (totalPriceWithShipping > 6500) {
  //       try {
  //         emit(LoadingGettingCoupon());
  //         var result = await copounRepo.applyDiscount(discountController.text);
  //         result.fold(
  //           (l) {
  //             return emit(
  //               ErrorGettingCoupon(message: l.message),
  //             );
  //           },
  //           (r) {
  //             switch (r.discountType) {
  //               case DiscountType.percentage:
  //                 discountPercentage = r.discountAmount!.toDouble() / 100;
  //                 discountAmount = 0;
  //                 break;
  //               case DiscountType.amount:
  //                 discountAmount = r.discountAmount!.toDouble();
  //                 discountPercentage = 0;
  //                 break;
  //             }
  //             applayStatus = false;
  //             add(GetBillDetails());
  //             return emit(
  //               SuccessGettingCoupon(),
  //             );
  //           },
  //         );
  //       } catch (e) {
  //         emit(
  //           ErrorGettingCoupon(message: e.toString()),
  //         );
  //       }
  //     } else {
  //       emit(
  //         CantApplayDiscount(
  //           message: " لا يمكنك استخدام الكوبون على السعر الأقل من 6500",
  //         ),
  //       );
  //     }
  //   } else {
  //     emit(
  //       CantApplayDiscount(
  //         message: " لا يمكنك استخدام الكوبون فارغا",
  //       ),
  //     );
  //   }
  // }

  // void calculateTotalBills(Emitter<CartScreenState> emit) {
  //   totalPrice = 0;
  //   shipping = 0;
  //   totalQuantity = 0;
  //   for (var element in cartItems) {
  //     totalPrice += element.price * element.quantity;
  //     totalQuantity += element.quantity;
  //   }
  //   if (totalPrice > 0) {
  //     shipping = 5000;
  //   }

  //   totalPriceWithShipping = totalPrice;
  //   totalDiscount =
  //       discountAmount + (totalPriceWithShipping * discountPercentage);
  //   totalPriceWithShipping = totalPriceWithShipping - totalDiscount + shipping;

  //   emit(GetBillDetailsState());
  // }

  void init() {
    add(CalcTotal());
  }

  // void removeCartItem(CartModel cartItem) {
  //   cartItems.remove(cartItem);
  //   add(GetBillDetails());
  // }

  void addCartItem(CartModel cartItem) {
    if (cartItem.quantity < cartItem.availableQuantity) {
      cartItem.quantity += 1;
    }
    add(GetBillDetails());
  }

  //calculate total price
  void calculateTotalPrice(Emitter<CartScreenState> emit) {
    totalPrice = 0;
    for (var element in cartItems) {
      totalPrice += element.price * element.selectedQuantity;
    }
    emit(CalcTotalState(totalPrice: totalPrice));
  }

  // @override
  // void emit(Emitter<CartScreenState> emit) {
  //   on<GetBillDetails>((event, emit) {
  //     calculateTotalBills(emit);
  //   });
  //   on<AddCartItem>((event, emit) {
  //     addCartItem(event.cartItem);
  //   });
  //   on<RemoveCartItem>((event, emit) {
  //     removeCartItem(event.cartItem);
  //   });

  // void subtractCartItem(CartModel cartItem) {
  //   if (cartItem.quantity > 1) {
  //     cartItem.quantity -= 1;
  //   }
  //   add(GetBillDetails());
  // }

  // removeCoupon(Emitter<CartScreenState> emit) {
  //   discountAmount = 0;
  //   discountPercentage = 0;
  //   applayStatus = true;
  //   add(GetBillDetails());
  // }
}
