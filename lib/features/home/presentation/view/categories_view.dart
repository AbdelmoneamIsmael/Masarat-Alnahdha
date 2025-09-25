import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/title_tale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          20.verticalSpace,
          TitleTale(
            title: 'الأقسام الرئيسية  ',
            option: '(3)',
            onPressed: () {
              context.pushNamed(PagesKeys.categoryInfoScreen);
              //or
              // final shell = StatefulNavigationShell.of(context);
              // shell.goBranch(3); // يفتح الـ ProfilePage tab
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CategoryItem(
                  image: "assets/images/meets.png",
                  title: 'قسم اللحوم',
                ),
                16.verticalSpace,
                CategoryItem(
                  alignment: Alignment.topRight,
                  image: "assets/images/fruts.png",
                  title: 'قسم الفاكهة',
                  isLeft: false,
                ),
                16.verticalSpace,
                CategoryItem(
                  image: "assets/images/vigitable.png",
                  title: 'خضار الرفيل',
                ),
              ],
            ),
          ),
          // Row(
          //   spacing: 8.w,
          //   children: [
          //     6.horizontalSpace,
          //     Expanded(
          //       child: CategoryItem(
          //         image:
          //             "https://t3.ftcdn.net/jpg/02/26/53/80/360_F_226538033_C42p96JDNwkSdQs86Agxd1TtaVJsyJ71.jpg",
          //         title: 'قسم اللحوم',
          //       ),
          //     ),
          //     Expanded(
          //       child: CategoryItem(
          //         image:
          //             "https://media.gettyimages.com/id/1524823226/photo/colorful-raw-fruits-and-vegetables-varied-vegan-food-vivid-rainbow-arrangement.jpg?s=612x612&w=0&k=20&c=TtpnDbqIoQ-29DuhrZ9mKxp6sPQvY0BMdcW67dDyZxw=",
          //         title: 'قسم الفاكهة',
          //       ),
          //     ),
          //     Expanded(
          //       child: CategoryItem(
          //         image:
          //             "https://media.istockphoto.com/id/453963935/photo/fruits-and-vegetables-at-city-market-in-riga.jpg?s=612x612&w=0&k=20&c=YLdfhKvGlc6woYVN93OfCVzEUbDdgnqODsvypz3aBvc=",
          //         title: 'قسم الخضار',
          //       ),
          //     ),
          //     6.horizontalSpace,
          //   ],
          // ),
          //------------------
          // SizedBox(
          //   height: 118.h,
          //   child: ListView.separated(
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: 16,
          //       vertical: 0,
          //     ).h,
          //     shrinkWrap: true,
          //     physics: const BouncingScrollPhysics(),
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 10,
          //     separatorBuilder: (context, index) => const SizedBox(width: 12),
          //     itemBuilder: (context, index) => HomeCategoryItem(
          //       onPressed: () => GoRouter.of(
          //         context,
          //       ).push(PagesKeys.productsPage, extra: 'name'),
          //       categoryModel: CategorieModel(
          //         id: newProductsList[index].productId.toString(),
          //         name: newProductsList[index].name,
          //         imagefrontsmallurl: newProductsList[index].imageUrl,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
    this.alignment,
    this.isLeft = true,
  });
  final String image, title;
  final AlignmentGeometry? alignment;
  final bool isLeft;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(PagesKeys.categoryInfoScreen),
      child: Container(
        height: 150.h,
        width: double.infinity,

        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          // color: Colors.black.withValues(alpha: 1),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(image), //CachedNetworkImageProvider( ),
          ),
        ),
        // border: Border.all(color: Colors.grey, width: 0.5),
        child: Container(
          color: Colors.black.withValues(alpha: .2),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Row(
                    mainAxisAlignment: isLeft
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyle.bold18(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Image.asset(AppImage.logo, width: 50.w, height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class CategoryItem extends StatelessWidget {
//   const CategoryItem({super.key, required this.title, required this.image});
//   final String title, image;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         GoRouter.of(context).pushNamed(PagesKeys.categoryInfoScreen);
//       },
//       child: Container(
//         clipBehavior: Clip.antiAlias,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6.r),
//           border: Border.all(color: Colors.grey, width: 0.5),
//         ),
//         child: Column(
//           children: [
//             CachedImage(url: image, height: 110.h, width: 122.w),
//             12.verticalSpace,
//             Text(
//               title,
//               style: AppTextStyle.bold14h24(context).copyWith(height: 1.5),
//             ),
//             12.verticalSpace,
//           ],
//         ),
//       ),
//     );
//   }
// }
