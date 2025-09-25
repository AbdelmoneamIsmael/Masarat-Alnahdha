// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:perfume_ecommerce/core/models/ultra_classification/ultra_classification_model.dart';
// import 'package:perfume_ecommerce/core/theming/colors.dart';
// import 'package:perfume_ecommerce/core/widgets/cashed_images.dart';

// class UltraClassificationCard extends StatelessWidget {
//   const UltraClassificationCard(
//       {super.key, required this.ultraClassificationModel, this.onPressed});
//   final UltraClassificationModel ultraClassificationModel;
//   final void Function()? onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       splashColor: AppDarkColors.primaryColor,
//       onTap: onPressed,
//       child: AspectRatio(
//         aspectRatio: 4.45,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(15),
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               CachedImage(
//                 url: ultraClassificationModel.imageUrl ?? '',
//                 width: double.infinity,
//               ),
//               Positioned(
//                 left: 40.w,
//                 child: Text(
//                   ultraClassificationModel.name ?? '',
//                   style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                         fontSize: 20.sp,
//                       ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
