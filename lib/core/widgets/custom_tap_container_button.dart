import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTapContainerButton extends StatelessWidget {
  const CustomTapContainerButton({
    super.key,
    required this.length,
    required this.tabTitles,
    required this.onTap,
    required this.selectedIndex,
  });
  final int length, selectedIndex;
  final List<String> tabTitles;
  final void Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 9.w),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Theme.of(context).colorScheme.surface
                    : null,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      tabTitles[index],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: selectedIndex == index
                            ? Colors.white
                            : Theme.of(context).colorScheme.shadow,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
