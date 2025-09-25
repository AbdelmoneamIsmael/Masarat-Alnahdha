import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/generated/app_icons.dart';
import '../../core/themes/styles/app_text_style.dart';
import '../../core/widgets/primary_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    this.onPressed,
  });

  final String errorMessage;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.errorIcon, fit: BoxFit.scaleDown),
          Text(
            'حدث خطأ ما!',
            style: AppTextStyle.simiBold16(
              context,
            ).copyWith(fontSize: 20, color: Colors.red),
          ),
          Text(errorMessage, style: AppTextStyle.bold14h24(context)),
          const SizedBox(height: 10),
          PrimaryButton(
            text: 'إعادة تحميل الصفحة',
            onPressed: onPressed ?? () {},
            // height: 45,
          ),
        ],
      ),
    );
  }
}
