import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/custom_app_bar.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';

class TermisAndConditions extends StatelessWidget {
  const TermisAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(
        centerTitle: true,
        title: 'شروط الاستخدام',
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(13),
          child: Image.asset(AppImage.dividerImage),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 22).w,
        child: Column(
          children: [
            // Image.asset(
            //   'assets/image/IMG-20250922-WA0003.jpg',
            //   width: 135.w,
            //   height: 100.h,
            // ),
            18.verticalSpace,
            Text(
              r'''مرحبًا بك في تطبيق الرافيل لشراء الخضروات والفواكه الطازجة. 
نرجو منك قراءة هذه الشروط والأحكام بعناية قبل استخدام التطبيق. 

1- جميع المنتجات المتوفرة يتم اختيارها بعناية لتكون طازجة وصحية.  
2- الأسعار المعروضة قابلة للتغيير وفقًا لتوافر المنتجات ومواسمها.  
3- قد تختلف صورة المنتج عن الشكل الفعلي نظرًا لاختلاف المواسم أو طريقة العرض.  
4- يلتزم تطبيق الرافيل بتوصيل طلباتك في أقرب وقت ممكن.  
5- قد يتغير وقت التوصيل بناءً على الظروف المرورية أو توفر المنتجات.  
6- بمجرد تأكيد الطلب لا يمكن تعديله أو إلغاؤه بعد بدء التحضير.  
7- يحق للتطبيق إلغاء الطلب في حال نفاد الكمية أو حدوث خطأ تقني.  
8- يتحمل العميل مسؤولية إدخال بيانات صحيحة للتوصيل مثل العنوان ورقم الهاتف.  
9- الدفع يمكن أن يتم نقدًا عند الاستلام أو عبر الوسائل المتاحة في التطبيق.  
10- في حال وجود أي مشكلة بالمنتجات يجب الإبلاغ خلال 24 ساعة من الاستلام.  
11- لا يتحمل التطبيق مسؤولية سوء التخزين بعد استلام العميل للمنتجات.  
12- جميع العروض والخصومات تكون لفترة محدودة وقد تنتهي في أي وقت.  
13- استخدام التطبيق يعني موافقتك على استلام إشعارات بالعروض والتحديثات.  
14- يلتزم فريق الرافيل بالحفاظ على خصوصية بياناتك وعدم مشاركتها مع أي طرف ثالث.  
15- تحتفظ إدارة التطبيق بحق تعديل هذه الشروط والأحكام في أي وقت دون إشعار مسبق.''',
              style: AppTextStyle.regular16h24(context),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
