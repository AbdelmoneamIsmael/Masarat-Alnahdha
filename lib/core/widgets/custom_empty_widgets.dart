import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({super.key, required this.title, required this.path});
  final String title, path;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            Image.asset(path, width: 100, height: 100),
            15.verticalSpace,
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
