import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWithBackground extends StatelessWidget {
  const IconWithBackground({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          width: 20.w,
          icon,
          colorFilter: ColorFilter.mode(
            Theme.of(context).scaffoldBackgroundColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
