// import 'package:masarat_alnahdha/core/const/app_const.dart';
// import 'package:masarat_alnahdha/core/models/product/product_model.dart';
// import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
// import 'package:masarat_alnahdha/core/widgets/product_card.dart';
// import 'package:masarat_alnahdha/core/widgets/title_tale.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

// class HotOfferView extends StatelessWidget {
//   const HotOfferView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Column(
//         children: [
//           26.verticalSpace,
//           TitleTale(
//             title: 'افضل العروض  ',
//             option: 'عرض الكل',
//             onPressed: () {
//               GoRouter.of(
//                 context,
//               ).push(PagesKeys.productsPage, extra: 'افضل العروض  ');
//             },
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             physics: const BouncingScrollPhysics(),
//             child: Row(
//               children: [
//                 ...List.generate(
//                   offerProductsList.length < 6 ? offerProductsList.length : 6,
//                   (index) {
//                     return Padding(
//                       padding: EdgeInsetsDirectional.only(
//                         start: index == 0 ? 10 : 0,
//                         end: offerProductsList.length < 6
//                             ? index == offerProductsList.length - 1
//                                   ? 16
//                                   : 0
//                             : index == 5
//                             ? 12
//                             : 0,
//                       ),
//                       child: ProductCard(
//                         uinqueKey: kHotOffer,
//                         onPressed: () {
//                           //   GoRouter.of(context).push(
//                           //   PagesKeys.productDetailsPage,
//                           //   extra: [
//                           //     offerProductsList[index],
//                           //     HeroModel(
//                           //       id: '${offerProductsList[index].productId}$kHotOffer',
//                           //       image: offerProductsList[index].imageUrl,
//                           //     ),
//                           //   ],
//                           // );
//                         },
//                         productModel: ProductModel(
//                           productId: offerProductsList[index].productId,
//                           name: offerProductsList[index].name,
//                           availableQuantity:
//                               offerProductsList[index].availableQuantity,
//                           discount: offerProductsList[index].discount,
//                           imageUrl: offerProductsList[index].imageUrl,
//                           price: offerProductsList[index].price,
//                           priceAfterDiscount:
//                               offerProductsList[index].priceAfterDiscount,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           // GridView.builder(
//           //   // scrollDirection: Axis.horizontal,
//           //   shrinkWrap: true,
//           //   physics: const NeverScrollableScrollPhysics(),
//           //   padding: const EdgeInsets.symmetric(horizontal: 16),
//           //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           //     crossAxisCount: 2,
//           //     crossAxisSpacing: 8,
//           //     mainAxisSpacing: 8,
//           //     childAspectRatio: 167 / 211,
//           //   ),
//           //   itemBuilder: (context, index) => AspectRatio(
//           //     aspectRatio: 167 / 211,
//           // child: ProductCard(
//           //   uinqueKey: kHotOffer,
//           //   onPressed: () => GoRouter.of(context).push(
//           //     PagesKeys.productDetailsPage,
//           //     extra: [
//           //       offerProductsList[index],
//           //       HeroModel(
//           //         id: '${offerProductsList[index].productId}$kHotOffer',
//           //         image: offerProductsList[index].imageUrl,
//           //       ),
//           //     ],
//           //   ),
//           //   productModel: ProductModel(
//           //     productId: offerProductsList[index].productId,
//           //     name: offerProductsList[index].name,
//           //     availableQuantity: offerProductsList[index].availableQuantity,
//           //     discount: offerProductsList[index].discount,
//           //     imageUrl: offerProductsList[index].imageUrl,
//           //     price: offerProductsList[index].price,
//           //     priceAfterDiscount:
//           //         offerProductsList[index].priceAfterDiscount,
//           //   ),
//           // ),
//           //   ),
//           //   itemCount: 2,
//           // ),
//         ],
//       ),
//     );
//   }
// }
