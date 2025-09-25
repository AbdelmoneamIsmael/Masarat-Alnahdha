import 'package:flutter/material.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/widgets/custom_app_bar.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/features/help/presentation/widgets/help_page_item.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});
  static const List<String> questions = [
    'كيف أقدر أطلب من التطبيق؟',
    'هل التوصيل متاح لكل المناطق؟',
    'ما هي طرق الدفع المتاحة؟',
    'كيف أتأكد أن المنتجات طازجة؟',
    'هل أقدر أرجع أو أستبدل الطلب؟',
    'كم يستغرق وقت التوصيل عادة؟',
    'هل يوجد حد أدنى للطلب؟',
    'كيف أقدر أتواصل مع خدمة العملاء؟',
    'هل أقدر أعمل جدولة للطلب في وقت لاحق؟',
    'هل فيه عروض أو خصومات خاصة؟',
  ];
  static const List<String> answers = [
    'يمكنك تصفح الأقسام (اللحوم – الفاكهة – الخضار)، اختيار المنتجات المطلوبة، إضافتها إلى السلة، ثم إتمام الطلب والدفع بسهولة.',
    'نعم، نوصل إلى معظم الأحياء داخل المدينة. يمكنك التأكد من توفر التوصيل عند إدخال عنوانك في التطبيق.',
    'نوفر الدفع عند الاستلام، الدفع بالبطاقة البنكية، والمحافظ الإلكترونية.',
    'نحرص يوميًا على توفير لحوم، فواكه وخضار طازجة يتم فحصها بعناية قبل توصيلها لك.',
    'نعم، إذا كان هناك أي مشكلة في جودة المنتج يمكنك التواصل مع خدمة العملاء لاستبداله أو استرداد المبلغ.',
    'عادةً ما يتم التوصيل خلال 30 – 60 دقيقة حسب منطقتك وحجم الطلب.',
    'نعم، الحد الأدنى للطل  يختلف حسب المنطقة.',
    'من خلال قسم "الدعم" داخل التطبيق أو عبر الرقم/البريد الإلكتروني الموضح في صفحة التواصل.',
    'نعم، يمكنك اختيار وقت محدد لتسليم الطلب أثناء إتمام عملية الشراء.',
    'نعم، نقدم عروضًا موسمية وخصومات دورية يمكن الاطلاع عليها من صفحة "العروض" داخل التطبيق.',
  ];
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(
        title: 'الأسئلة الشائعة',
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(13),
          child: Image.asset(AppImage.dividerImage),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) =>
            HelpPageItem(question: questions[index], answer: answers[index]),
      ),
    );
  }
}
