// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ClassificationCard extends StatelessWidget {
//   const ClassificationCard({
//     super.key,
//     required this.classificationModel,
//     this.onPressed,
//   });

//   final ClassificationModel classificationModel;
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
//                 url: classificationModel.imageUrl ?? '',
//                 width: double.infinity,
//               ),
//               Positioned(
//                 left: 40.w,
//                 child: Text(
//                   classificationModel.name ?? '',
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
