import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomDrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;
  final bool isSelected, isLogout;
  final Color? selectedColor;
  final Widget? trailing;
  const CustomDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.isSelected = false,
    this.selectedColor,
    this.trailing,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: isSelected ? null : null,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        dense: true,
        minVerticalPadding: 0,
        onTap: onTap,
        contentPadding: EdgeInsets.all(0),
        leading: Icon(
          icon,
          color: isLogout ? Colors.red : Theme.of(context).colorScheme.surface,
        ),
        title: Text(
          title,
          style: AppTextStyle.medium14h24(
            context,
          ).copyWith(color: isLogout ? Colors.red : null),
        ),
        trailing: trailing ?? Icon(Icons.arrow_forward_ios_outlined, size: 15),
      ),
    );
  }
}
