import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/features/assign_payment/presentation/pages/assign_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.paymentModel});

  final PaymentItemModel paymentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: paymentModel.isSelected ?? false ? 2 : 1,
          color: paymentModel.isSelected ?? false
              ? Theme.of(context).colorScheme.surface
              : LightColors.greyColor,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(
              context,
            ).colorScheme.surface.withValues(alpha: .1),
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                paymentModel.paymentImage,
                fit: BoxFit.scaleDown,
                // width: 90,
                // height: 90,
              ),
            ),
          ),
          20.horizontalSpace,
          Column(
            // spacing: 2,
            children: [
              Text(
                paymentModel.paymentName,
                style: AppTextStyle.bold16(context),
              ),
              // Text(
              //   'Assign Address',
              //   style: AppTextStyle.regular14h21(
              //     context,
              //   ).copyWith(color: LightColors.greyColor),
              // ),
              // Text(
              //   'Assign Address',
              //   style: AppTextStyle.regular14h21(
              //     context,
              //   ).copyWith(color: LightColors.greyColor),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
