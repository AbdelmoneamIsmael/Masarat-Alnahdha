import 'package:masarat_alnahdha/core/generated/app_icons.dart';
import 'package:masarat_alnahdha/core/widgets/custom_text_field.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_state.dart';
import 'package:masarat_alnahdha/features/cart/presentation/widgets/invoice_detail_item.dart';
import 'package:masarat_alnahdha/features/category_full_info/presentation/pages/category_full_info_screen.dart';
import 'package:masarat_alnahdha/features/check_out/presentation/manager/checkout_steps_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IvoiceDetailsViewAndCheeckout extends StatelessWidget {
  const IvoiceDetailsViewAndCheeckout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartScreenCubit, CartScreenState>(
      listener: (context, state) {
        if (state is CantApplayDiscount) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is ErrorGettingCoupon) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is OrderCreatedState) {
          // if (state.orderModel.orderItems.isNotEmpty) {
          //   GoRouter.of(context)
          //       .push(PagesKeys.paymentMethodPage, extra: state.orderModel);
          // } else {
          //   ScaffoldMessenger.of(context)
          //     ..removeCurrentSnackBar()
          //     ..showSnackBar(
          //       const SnackBar(
          //         content: Text('لا يوجد منتجات في السلة'),
          //       ),
          //     );
          // }
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<CartScreenCubit>(context);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            border: Border.all(color: Colors.grey.withValues(alpha: .4)),
          ),
          child: Column(
            children: [
              8.verticalSpace,
              CustomTextField(
                radius: 20,
                readOnly: !cubit.applayStatus,
                controller: cubit.discountController,
                hintText: 'ادخل كود الخصم',
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 3,
                  ),
                  child: TextButton(
                    onPressed: () {
                      // cubit.applayStatus
                      //     ? cubit.add(ApplyDiscount())
                      //     : cubit.add(RemoveDiscount());
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer,
                    ),
                    child: Text(
                      cubit.applayStatus ? "تطبيق" : "الغاء الخصم",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
              8.verticalSpace,
              InvoiceDetailItem(
                title: "المجموع",
                value: '${cubit.totalPrice} جم',
              ),
              InvoiceDetailItem(
                title: " اجمالي الخصم",
                value: '${cubit.totalDiscount} جم',
              ),
              InvoiceDetailItem(
                title: "اجرة الشحن والتوصيل",
                value: '${cubit.shipping} جم',
              ),
              const Divider(thickness: 1),
              InvoiceDetailItem(
                title: "اجمالي السعر",
                value: '${cubit.totalPriceWithShipping} د.ع',
              ),
              3.verticalSpace,
              LinearButton(
                title: "اتمام عملية الدفع",
                icon: AppIcons.marketIcon,
                onTap: () {
                  //---navigate to address page
                  BlocProvider.of<CheckoutStepsCubit>(
                    context,
                  ).changePageViewIndex(2);
                  BlocProvider.of<CheckoutStepsCubit>(
                    context,
                  ).pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                  // cubit.add(CreateOrder());

                  // showDialog(
                  //   context: context,
                  //   builder: (context) => const RelatedProductPage(),
                  // );
                },
                // backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        );
      },
    );
  }
}
