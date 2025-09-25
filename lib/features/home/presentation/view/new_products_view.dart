import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/core/widgets/title_tale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NewProductsView extends StatelessWidget {
  const NewProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          TitleTale(
            title: 'أفضل العروض',
            option: 'عرض الكل',
            onPressed: () {
              GoRouter.of(
                context,
              ).push(PagesKeys.productsPage, extra: 'أفضل العروض');
            },
          ),

          // SingleChildScrollView(
          //   // scrollDirection: Axis.horizontal,
          //   physics: const BouncingScrollPhysics(),
          //   child: Column(
          //     // crossAxisAlignment: CrossAxisAlignment.start,
          //     spacing: 16,
          //     children: [
          //       ...List.generate(
          //         newProductsList.length < 6 ? newProductsList.length : 6,
          //         (index) {
          //           return HomePageItem(productModel: newProductsList[index]);
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
