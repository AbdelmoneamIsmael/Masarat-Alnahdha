import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/features/onboarding/presentation/controller/onbording_controller.dart';
import 'package:masarat_alnahdha/features/onboarding/presentation/controller/onbording_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnbordingController, OnbordingState>(
      builder: (context, state) {
        final controller = context.read<OnbordingController>();
        return PageView.builder(
          controller: controller.pageController,
          onPageChanged: (value) {
            controller.changePage(value);
          },
          itemCount: onboardingIcons.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .5,
                  child: Center(
                    child: Image.asset(
                      onboardingIcons[index],
                      // width: 280.responsiveHeight,
                    ),
                  ),
                ),
                SizedBox(height: 31),
                Text(
                  onboardTitle[index],
                  style: AppTextStyle.regular16(context).copyWith(
                    fontSize: 35,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  onboardText[index],
                  style: AppTextStyle.regular14(context),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}

const onboardingIcons = [
  'assets/images/onboard1.png',
  'assets/images/onboard2.png',
  'assets/images/onboard3.png',
];

const onboardTitle = [
  'إختيارات غير محدوده',
  "اطلب فى اى وقت",
  "توصيل لباب المنزل",
];
const onboardText = [
  "اكتشف تشكيلة واسعة من المنتجات , تسوق بسهولة من هاتفك واحصل على جميع احتياجاتك دون عناء تابع أحدث المنتجات واحصل على العروض المميزة من خلال تطبيقناً. ",
  "تابع أحدث المنتجات واحصل على العروض المميزة من خلال تطبيقناً, وفر وقتك وجهدك مع تجربة سلسة وذكية و استمتع بعروض يومية وتخفيضات خاصة على المنتجات الأكثر طلبًا.",
  "خدمة توصيل سريعة وآمنة تضمن وصول منتجاتك بحالة ممتازة تطبيقنا يوفر لك خيارات دفع متعددة تناسب جميع احتياجاتك كل ما تحتاجه من مكونات في مكان واحد وفر وقتك وجهدك مع تجربة سلسة وذكية.",
];
