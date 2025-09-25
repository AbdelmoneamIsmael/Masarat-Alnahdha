import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HaveAccountOrNotText extends StatelessWidget {
  const HaveAccountOrNotText({
    super.key,
    this.onPressed,
    required this.description,
    required this.buttonText,
  });
  final void Function()? onPressed;
  final String description, buttonText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(description, style: AppTextStyle.regular14h21(context)),
        CupertinoButton(
          onPressed: onPressed,
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          child: Text(
            buttonText,
            style: AppTextStyle.regular14h21(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.surface),
          ),
        ),
      ],
    );
  }
}
