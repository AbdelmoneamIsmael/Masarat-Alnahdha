import 'dart:async';

import 'package:masarat_alnahdha/features/cart/data/models/cart_model.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_event.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masarat_alnahdha/gen/assets.gen.dart';

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
    CartModel(
      availableQuantity: 8,
      category: 'أطباق رئيسية',
      description:
          "بتنجان طازج عالي الجودة من مزارع الرافيل، مثالي للطهي والقلي ويتميز بمذاقه اللذيذ.",

      imageUrl: Assets.exProductsNoBg.btngan.path,
      price: 180,
      productId: 1,
      quantity: 2,
      title: 'بتنجان الرافيل',
    ),
    CartModel(
      availableQuantity: 10,
      category: 'أطباق رئيسية',
      imageUrl: Assets.exProductsNoBg.mshkl.path,
      price: 120,
      productId: 2,
      quantity: 1,
      description:
          "تشكيلة خضروات طازجة متنوعة من مزارع الرافيل، جاهزة للأكلات الصحية والمميزة.",
      title: 'مشكل الرافيل',
    ),
    CartModel(
      title: "قاس الرافيل",
      description:
          "قاس طازج من أجود المحاصيل، غني بالقيمة الغذائية ومناسب لجميع الأطباق الشرقية.",
      availableQuantity: 6,
      category: 'أطباق رئيسية',
      imageUrl: Assets.exProductsNoBg.qas.path,
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

  // void init() {
  //   for (var element in products) {
  //     cartItems.add(
  //       CartModel(
  //         size: element.productSizes.first.size!,
  //         productId: element.id!,
  //         title: element.name!,
  //         availableQuantity: element.productSizes.first.availableAmount!,
  //         price: element.productSizes.first.price!,
  //         imageUrl: element.productDocuments.first.imageUrl ?? '',
  //         quantity: 1,
  //         productSizeId: element.productSizes.first.id!,
  //       ),
  //     );
  //   }
  // }

  // void removeCartItem(CartModel cartItem) {
  //   cartItems.remove(cartItem);
  //   add(GetBillDetails());
  // }

  // void addCartItem(CartModel cartItem) {
  //   if (cartItem.quantity < cartItem.availableQuantity) {
  //     cartItem.quantity += 1;
  //   }
  //   add(GetBillDetails());
  // }

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
