import 'package:masarat_alnahdha/features/address/presentation/page/assign_address_page.dart';
import 'package:masarat_alnahdha/features/cart/presentation/pages/cart_page.dart';
import 'package:masarat_alnahdha/features/check_out/presentation/manager/checkout_steps_cubit.dart';
import 'package:masarat_alnahdha/features/check_out/presentation/manager/checkout_steps_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutStepsPage extends StatelessWidget {
  const CheckoutStepsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutStepsCubit(),
      child: BlocBuilder<CheckoutStepsCubit, CheckoutStepsState>(
        builder: (context, state) {
          final cubit = context.read<CheckoutStepsCubit>();
          return SafeArea(
            top: true,
            bottom: false,
            right: false,
            left: false,
            child: Column(
              children: [
                15.verticalSpace,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Text(
                //       'عربة التسوق',
                //       style: AppTextStyle.bold14h24(context).copyWith(
                //         color: cubit.pageViewIndex == 1
                //             ? Theme.of(context).colorScheme.surface
                //             : null,
                //       ),
                //     ),
                //     CupertinoButton(
                //       padding: EdgeInsets.zero,
                //       onPressed: () {
                //         UiHelper.showSnakBar(
                //           message:
                //               'يرجى تأكيد المنتجات بالعربة اولا ثم حدد التالى لتحديد العنوان',
                //           context: context,
                //           type: MotionToastType.warning,
                //         );
                //       },
                //       minimumSize: Size.zero,
                //       child: Text(
                //         'العنوان   ',
                //         style: AppTextStyle.bold14h24(context).copyWith(
                //           color: cubit.pageViewIndex == 2
                //               ? Theme.of(context).colorScheme.surface
                //               : null,
                //         ),
                //       ),
                //     ),
                //     CupertinoButton(
                //       padding: EdgeInsets.zero,
                //       onPressed: () {
                //         UiHelper.showSnakBar(
                //           message:
                //               'يرجى تأكيد المنتجات بالعربة و تحديد العنوان اولا ثم حدد التالى لتحديد طريقة الدفع',
                //           context: context,
                //           type: MotionToastType.warning,
                //         );
                //       },
                //       minimumSize: Size.zero,
                //       child: Text(
                //         'الدفع       ',
                //         style: AppTextStyle.bold14h24(context).copyWith(
                //           color: cubit.pageViewIndex == 3
                //               ? Theme.of(context).colorScheme.surface
                //               : null,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // // StepProgress(
                //   padding: EdgeInsets.zero,
                //   // height: 15,
                //   margin: EdgeInsets.zero,
                //   currentStep: cubit.pageViewIndex,
                //   totalSteps: 4,
                //   visibilityOptions: StepProgressVisibilityOptions.lineOnly,
                //   // controller: cubit.stepProgressController,
                //   highlightOptions:
                //       StepProgressHighlightOptions.highlightCurrentLine,
                //   onStepChanged: (currentIndex) {
                //     cubit.changePageViewIndex(currentIndex);
                //   },
                //   // onStepLineTapped: (index) {
                //   //   debugPrint('onStepLineTapped: $index');
                //   // },
                //   theme: StepProgressThemeData(
                //     stepLineSpacing: 6,
                //     defaultForegroundColor: Color.fromARGB(255, 55, 55, 55),
                //     activeForegroundColor: Theme.of(
                //       context,
                //     ).colorScheme.surface,
                //     stepLineStyle: StepLineStyle(
                //       lineThickness: 9,
                //       borderRadius: Radius.circular(2),
                //     ),
                //   ),
                // ),
                //----end of steper
                Expanded(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: cubit.pageController,
                    children: [
                      CartPage(),
                      AssignAddressPage(),
                      // AssignPaymentPage(),
                      // Center(
                      //   child: TextButton(
                      //     onPressed: () {
                      //       cubit.changePageViewIndex(3);
                      //       cubit.pageController.nextPage(
                      //         duration: Duration(milliseconds: 500),
                      //         curve: Curves.easeIn,
                      //       );
                      //     },
                      //     child: Text('Step 2'),
                      //   ),
                      // ),
                      // Center(
                      //   child: TextButton(
                      //     onPressed: () {
                      //       cubit.changePageViewIndex(4);
                      //     },
                      //     child: Text('Step 3'),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
