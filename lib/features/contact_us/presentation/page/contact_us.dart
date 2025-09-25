import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/custom_app_bar.dart';
import 'package:masarat_alnahdha/core/widgets/custom_text_field.dart';
import 'package:masarat_alnahdha/core/widgets/primary_button.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(
        centerTitle: true,
        title: 'تواصل معنا',
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(13),
          child: Image.asset(AppImage.dividerImage),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            18.verticalSpace,
            Text(
              'أبق على تواصل معنا في حالة وجود أي استفسار',
              style: AppTextStyle.regular16(context),
            ),
            16.verticalSpace,
            SizedBox(
              height: 75.h,
              child: CustomTextField(hintText: 'الاسم'),
            ),
            SizedBox(
              height: 75.h,
              child: CustomTextField(hintText: 'رقم التليفون'),
            ),
            SizedBox(
              height: 75.h,
              child: CustomTextField(hintText: 'البريد الإلكتروني'),
            ),
            CustomTextField(minLine: 6, hintText: 'ماذا تود أن تخبرنتا'),
            25.verticalSpace,
            PrimaryButton(isMax: true, text: 'ارسال', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
