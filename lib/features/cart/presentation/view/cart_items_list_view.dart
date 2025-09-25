import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_state.dart';
import 'package:masarat_alnahdha/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsView extends StatefulWidget {
  const CartItemsView({super.key});

  @override
  State<CartItemsView> createState() => _CartItemsViewState();
}

class _CartItemsViewState extends State<CartItemsView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1), // Duration for each slide
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-0.3, 0.0), // Slide to halfway
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.forward().then((_) {
      _controller.reverse().then((_) {
        _controller.forward().then((_) {
          _controller
              .reverse(); // Slide back only once after the second forward
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CartScreenCubit, CartScreenState>(
        builder: (context, state) {
          final cartCubit = BlocProvider.of<CartScreenCubit>(context);
          return cartCubit.cartItems.isEmpty
              ? Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      children: [
                        Image.asset(AppImage.emptyCart),
                        const SizedBox(height: 20),
                        const Text('لا يوجد منتجات في السلة'),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return index == 0
                        ? SlideTransition(
                            position: _offsetAnimation,
                            child: CartItem(
                              onDismissed: (p0) {
                                // cartCubit
                                //     .removeCartItem(cartCubit.cartItems[index]);
                              },
                              cartItem: cartCubit.cartItems[index],
                              onAdd: () {
                                // cartCubit
                                //     .addCartItem(cartCubit.cartItems[index]);
                              },
                              onSubtract: () {
                                // cartCubit.subtractCartItem(
                                //     cartCubit.cartItems[index]);
                              },
                            ),
                          )
                        : CartItem(
                            onDismissed: (p0) {
                              // cartCubit
                              //     .removeCartItem(cartCubit.cartItems[index]);
                            },
                            cartItem: cartCubit.cartItems[index],
                            onAdd: () {
                              // cartCubit.addCartItem(cartCubit.cartItems[index]);
                            },
                            onSubtract: () {
                              // cartCubit
                              // .subtractCartItem(cartCubit.cartItems[index]);
                            },
                          );
                  },
                  itemCount: cartCubit.cartItems.length,
                );
        },
      ),
    );
  }
}
