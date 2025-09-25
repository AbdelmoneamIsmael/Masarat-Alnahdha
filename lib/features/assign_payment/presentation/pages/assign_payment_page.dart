import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/widgets/primary_button.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/features/assign_payment/presentation/manager/assign_payment_cubit.dart';
import 'package:masarat_alnahdha/features/assign_payment/presentation/manager/assign_payment_state.dart';
import 'package:masarat_alnahdha/features/assign_payment/presentation/widget/payment_item.dart';
import 'package:masarat_alnahdha/features/check_out/presentation/manager/checkout_steps_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignPaymentPage extends StatelessWidget {
  const AssignPaymentPage({super.key});
  static const List<PaymentItemModel> paymentList = [
    PaymentItemModel(
      paymentImage: AppImage.cacheondelevary,
      paymentName: 'كاش عند الاستلام',
    ),
    PaymentItemModel(
      paymentImage: AppImage.vodavoneLogo,
      paymentName: 'فودافون كاش',
    ),
    PaymentItemModel(paymentImage: AppImage.visaLogo, paymentName: 'فيزا كاش'),
    PaymentItemModel(
      paymentImage: AppImage.masterCard,
      paymentName: 'ماستر كاش',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssignPaymentCubit(),
      child: BlocBuilder<AssignPaymentCubit, AssignPaymentState>(
        builder: (context, state) {
          final cubit = context.read<AssignPaymentCubit>();
          return ScreenWrapper(
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: PrimaryButton(
                text: 'التالى',
                onPressed: () {
                  BlocProvider.of<CheckoutStepsCubit>(
                    context,
                  ).changePageViewIndex(3);
                  BlocProvider.of<CheckoutStepsCubit>(
                    context,
                  ).pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
            body: ListView.builder(
              itemCount: paymentList.length,
              padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => cubit.changeSelectedPaymentIndex(index),
                child: PaymentItem(
                  paymentModel: PaymentItemModel(
                    paymentImage: paymentList[index].paymentImage,
                    paymentName: paymentList[index].paymentName,
                    isSelected: cubit.selectedPaymentIndex == index,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PaymentItemModel {
  final String paymentImage;
  final String paymentName;
  // final String paymentData;
  final bool? isSelected;
  const PaymentItemModel({
    required this.paymentImage,
    this.isSelected,
    required this.paymentName,
  });
}
