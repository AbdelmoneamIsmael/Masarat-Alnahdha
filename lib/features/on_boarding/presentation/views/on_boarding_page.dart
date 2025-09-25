import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/primary_button.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  bool isAiSelected = false;
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset('assets/images/backGround.png'),
              Image.asset(
                'assets/images/forground.png',
                fit: BoxFit.scaleDown,
                width: 300,
                height: 230,
              ),
            ],
          ),
          50.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Text(
                  'قم باختيار طريقة التسوق المفضلة',
                  style: AppTextStyle.bold18(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.surface),
                ),
                25.verticalSpace,
                GestureDetector(
                  onTap: () => setState(() => isAiSelected = !isAiSelected),
                  child: OnbordingOptionsView(isAiSelected: isAiSelected),
                ),
                25.verticalSpace,
                PrimaryButton(
                  text: 'تأكيد الاختيار',
                  onPressed: () {
                    GoRouter.of(context).go(PagesKeys.loginPage);
                  },
                  isMax: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnbordingOptionsView extends StatelessWidget {
  const OnbordingOptionsView({super.key, required this.isAiSelected});
  final bool isAiSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 200),
            // height: 170.h,
            decoration: BoxDecoration(
              color: Color(0xffDFF1FF), //#FFFFFFD9,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: isAiSelected
                    ? Theme.of(context).colorScheme.surface
                    : Color(0xffD9D9D9),
                width: isAiSelected ? 3 : 2,
              ),
            ),
            child: Image.asset(AppImage.onbordingAiOption),
          ),
        ),
        20.horizontalSpace,
        Expanded(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 200),
            // height: 170.h,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFD9), //#FFFFFFD9,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: isAiSelected
                    ? Color(0xffD9D9D9)
                    : Theme.of(context).colorScheme.surface,
                width: isAiSelected ? 2 : 3,
              ),
            ),
            child: Image.asset(AppImage.onbordingNormalOption),
          ),
        ),
      ],
    );
  }
}
