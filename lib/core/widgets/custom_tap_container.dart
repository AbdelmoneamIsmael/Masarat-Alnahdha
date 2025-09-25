import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTapContainer extends StatelessWidget {
  const CustomTapContainer({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      height: 46.h,
      width: double.infinity,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff4F4F4F),
            offset: Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: child,
    );
  }
}
