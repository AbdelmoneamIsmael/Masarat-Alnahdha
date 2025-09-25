import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';

class RetrivePasswordText extends StatelessWidget {
  const RetrivePasswordText({super.key, this.onPressed, required this.title});
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minimumSize: Size(0, 0),
      child: Text(
        title,
        style: AppTextStyle.regular14h21(context).copyWith(
          decoration: TextDecoration.underline,
          // decorationColor: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
