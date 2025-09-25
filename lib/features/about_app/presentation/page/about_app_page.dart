import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/custom_app_bar.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(
        centerTitle: true,
        title: 'نبذة عن التطبيق',
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(13),
          child: Image.asset(AppImage.dividerImage),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            38.verticalSpace,
            AppLogo(),
            24.verticalSpace,
            Text(
              r'مطعمنا يقدم لك تجربة متكاملة عبر ثلاثة أقسام رئيسية: قسم اللحوم بأجود الأصناف، قسم الفواكه بأطعمها الطبيعية، و قسم الخضار الطازجة والصحية. كل ما تحتاجه في مكان واحد وبجودة عالية. ',
              style: AppTextStyle.regular14(context),
            ),
            20.verticalSpace,
            Text(
              r'جوعان ومحتار؟ 😋 عندنا كل اللي يخطر على بالك! من ألذ اللحوم، لأحلى الفواكه، وأطزج الخضار.. كله موجود في مطعم واحد يخدمك على كيفك.. ',
              style: AppTextStyle.regular14(context),
            ),
            20.verticalSpace,
            Text(
              '✨ استمتع بأفضل تجربة طعام!\n لحوم طازجة بأشهى النكهات 🥩 \nفواكه طبيعية مليانة حلا \nخضار صحية غنية بالطاقة 🥦\n واحد.. لأن راحتك وجودتك هي أولويتنا 👨🏻‍🍳',
              style: AppTextStyle.regular14(context),
            ),
          ],
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Image.asset(AppImage.logo, width: 135.w, height: 100.h)],
    );
  }
}
