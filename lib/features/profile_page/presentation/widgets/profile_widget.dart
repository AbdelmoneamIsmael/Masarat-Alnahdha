import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileOptionWidget extends StatelessWidget {
  const ProfileOptionWidget({
    super.key,
    required this.title,
    this.lastIndex = false,
    this.isSelected = false,
    this.onTap,
    this.trailing,
    this.leading,
    this.leadingAssset,
    this.withBorder = true,
  });
  final String title;
  final String? leadingAssset;
  final bool lastIndex, isSelected, withBorder;
  final void Function()? onTap;
  final Widget? trailing, leading;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        border: withBorder
            ? BorderDirectional(
                bottom: BorderSide(
                  width: .5,
                  color: isSelected
                      ? LightColors.orangeColor
                      : Colors.grey.withValues(alpha: .3),
                ),
              )
            : null,
      ),
      child: ListTile(
        // focusColor: Colors.transparent,
        // hoverColor: Colors.transparent,
        // selectedColor: Colors.transparent,
        // iconColor: Colors.transparent,
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading:
            leading ??
            Image.asset(
              leadingAssset!,
              color: Theme.of(context).colorScheme.shadow,
            ),
        onTap: onTap,
        // tileColor: Theme.of(context).colorScheme.primaryContainer,
        textColor: withBorder ? null : LightColors.redColor,
        title: Text(title),
        titleTextStyle: AppTextStyle.bold16(context),
        trailing: trailing ?? SvgPicture.asset('assets/svgs/go_in_icon.svg'),
      ),
    );
  }
}
