import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/features/home/presentation/view/custom_drawer_view.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_cubit.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_state.dart';
// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        final LayoutCubit layoutCubit = BlocProvider.of<LayoutCubit>(context);
        return ScreenWrapper(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            clipBehavior: Clip.antiAlias,
            onPressed: () {
              GoRouter.of(context).push(PagesKeys.chatPage);
            },
            child: Image.asset('assets/images/chatBoot.png'),
          ),
          key: layoutCubit.scaffoldKey,
          drawer: CustomDrawer(),
          body: shell,
          bottomNavigationBar: _buildBottomNavigationBar(shell),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(StatefulNavigationShell shell) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        final LayoutCubit layoutCubit = BlocProvider.of<LayoutCubit>(context);
        return ValueListenableBuilder<int>(
          valueListenable: layoutCubit.currentIndex,
          builder: (context, selectedIndex, child) {
            return BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              elevation: 4.0,
              currentIndex: shell.currentIndex,
              onTap: shell.goBranch,
              // backgroundColor: Colors.white,
              // type: BottomNavigationBarType.fixed,
              //   backgroundColor: Colors.transparent,
              // elevation: 8.0,
              selectedItemColor: Theme.of(context).colorScheme.surface,
              unselectedItemColor: Colors.grey[600],
              // showSelectedLabels: true,
              // showUnselectedLabels: true,
              items: [
                _buildBottomNavigationBarItem(
                  context,

                  "assets/svgs/home.svg",

                  "الرئيسية",
                  layoutCubit.currentIndex.value == 0,
                ),
                // _buildCartNavigationBarItem(context),
                _buildBottomNavigationBarItem(
                  context,
                  "assets/svgs/order.svg",
                  "الطلبات",
                  layoutCubit.currentIndex.value == 1,
                ),
                _buildBottomNavigationBarItem(
                  context,

                  "assets/svgs/cart.svg",
                  "السلة",
                  layoutCubit.currentIndex.value == 2,
                ),
                _buildBottomNavigationBarItem(
                  context,
                  "assets/svgs/profile.svg",
                  "الحساب",
                  layoutCubit.currentIndex.value == 3,
                ),
              ],
            );
          },
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    context,
    String icon,
    String label,
    bool isActive,
  ) {
    return BottomNavigationBarItem(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      icon: SvgPicture.asset(
        icon,
        // colorFilter: ColorFilter.mode(
        //   isActive
        //       ? LightColors.primaryColor
        //       : Theme.of(context).textTheme.bodyMedium!.color!,
        //   BlendMode.srcIn,
        // ),
      ),
      label: label,
    );
  }

  // BottomNavigationBarItem _buildCartNavigationBarItem(context) {
  //   return BottomNavigationBarItem(
  //     backgroundColor: Theme.of(context).colorScheme.onPrimary,
  //     icon:
  //         // StreamBuilder<int>(
  //         // stream: shoppingCart.cartUpdates,
  //         // builder: (context, snapshot) {
  //         // final int cartUpdates = snapshot.data ?? 0;
  //         // return
  //         // cartUpdates > 0
  //         //     ? badges.Badge(
  //         //         badgeContent: Text(
  //         //           cartUpdates.toString(),
  //         //           style: TextStyle(color: Colors.white),
  //         //         ),
  //         //         position: badges.BadgePosition.topEnd(top: -10, end: -10),
  //         //         child: Icon(Icons.shopping_cart_rounded),
  //         //       )
  //         //     :
  //         CustomCartIcon(),
  //     // const Icon(Icons.shopping_cart_outlined),

  //     //   },
  //     // ),
  //     label: "Cart",
  //   );
  // }
}
