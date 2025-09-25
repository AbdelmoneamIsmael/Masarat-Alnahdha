import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.onPressed,
    this.title,
    this.centerTitle,
    this.actions,
    this.elevation,
    this.canPop = true,
    this.iconColor,
    this.leading, this.bottom,
  });

  final void Function()? onPressed;
  final String? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final double? elevation;
  final bool canPop;
  final Widget? leading;
  final Color? iconColor;
  final PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: canPop
          ? leading ??
                IconButton(
                  onPressed: onPressed ?? () => GoRouter.of(context).pop(),
                  icon: Image.asset('assets/images/backIcon.png',color: Theme.of(context).colorScheme.shadow,),
                  // Padding(
                  //   padding: const EdgeInsetsDirectional.only(start: 16.0),
                  //   child: Icon(Icons.arrow_back_ios, size: 22,color:iconColor),
                  // ),
                )
          : null,
      title: title == null ? null : Text(title!),
      centerTitle: centerTitle,
      actions: actions,
      elevation: elevation,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(57.h);
}
