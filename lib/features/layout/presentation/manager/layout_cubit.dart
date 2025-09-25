// import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String customAdd = '';
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  // final ShoppingCartViewModel shoppingCart = Get.find<ShoppingCartViewModel>();
  PageController pageController = PageController(initialPage: 0);
  // GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  final GlobalKey widgetKey = GlobalKey();
  late Function(GlobalKey) runAddToCartAnimation;
  var cartQuantityItems = 0;

  void listClick(GlobalKey widgetKey) async {
    await runAddToCartAnimation(widgetKey);
    // await cartKey.currentState!.runCartAnimation(
    //   (++cartQuantityItems).toString(),
    // );
  }

  void initialize() {
    pageController = PageController(initialPage: currentIndex.value);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
