// import 'package:add_to_cart_animation/add_to_cart_animation.dart';
// import 'package:rafeel/features/layout/presentation/manager/layout_cubit.dart';
// import 'package:rafeel/features/layout/presentation/manager/layout_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CustomCartIcon extends StatelessWidget {
//   const CustomCartIcon({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LayoutCubit, LayoutState>(
//       builder: (context, state) {
//         final cubit = BlocProvider.of<LayoutCubit>(context);
//         return Hero(
//           tag: 'addToCartIcon',
//           child: AddToCartIcon(
//             key: cubit.cartKey,
//             icon: const Icon(Icons.shopping_cart),
//             badgeOptions: const BadgeOptions(
//               foregroundColor: Colors.white,
//               active: true,
//               backgroundColor: Colors.red,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
