import 'package:masarat_alnahdha/core/generated/app_icons.dart';
import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomTextField(
            hintColor: Theme.of(context).colorScheme.surface,
            radius: 25,
            hintText: 'ابحث عن الخضار، الفاكهة، اللحوم...',
            verticalPadding: 8,
            prefixIcon: SvgPicture.asset(
              AppIcons.searchIcon,
              fit: BoxFit.scaleDown,
              color: Theme.of(context).colorScheme.surface,
            ),
            // suffixIcon: SvgPicture.asset(
            //   AppIcons.filtterSearch,
            //   fit: BoxFit.scaleDown,
            // ),
          ),
        ),
        SvgPicture.asset(
          AppIcons.dividerSvg,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(LightColors.greyColor, BlendMode.srcIn),
        ),
      ],
    );
  }
}
