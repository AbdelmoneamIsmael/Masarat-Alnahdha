import 'package:masarat_alnahdha/core/widgets/loading_over_lay.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_event.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_state.dart';
import 'package:masarat_alnahdha/features/cart/presentation/view/cart_items_list_view.dart';
import 'package:masarat_alnahdha/features/cart/presentation/view/invoice_details_view_and_cheekout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartScreenCubit(
        // cartItems:  BlocProvider.of<AppCubit>(context).cartList,
        // copounRepo: getIt.get<CopounRepo>(),
      ),
      // child: ScreenWrapper(
      // appBar: AppBar(title: const Text('عربة التسوق')),
      child: BlocConsumer<CartScreenCubit, CartScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          BlocProvider.of<CartScreenCubit>(context).add(CalcTotal());
          return Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  3.verticalSpace,
                  const CartItemsView(),
                  // 20.verticalSpace,
                  const IvoiceDetailsViewAndCheeckout(),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
              if (state is LoadingGettingCoupon) const LoadingOverlay(),
            ],
          );
        },
      ),
      // ),
    );
  }
}
