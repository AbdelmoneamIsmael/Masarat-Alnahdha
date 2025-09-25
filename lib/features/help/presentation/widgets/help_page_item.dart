import 'package:flutter/material.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';

class HelpPageItem extends StatelessWidget {
  const HelpPageItem({super.key, required this.answer, required this.question});
  final String answer, question;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 16),
      child: ExpansionTile(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        collapsedBackgroundColor: Theme.of(context).colorScheme.onPrimary,
        collapsedIconColor: Theme.of(context).colorScheme.surface,
        iconColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          question,
          style: AppTextStyle.regular16(context).copyWith(fontSize: 18),
        ),
        children: [
          Container(
            color: Colors.green.withValues(alpha: 0.8),
            child: ListTile(
              onTap: () => {},
              title: Text(
                answer,
                style: AppTextStyle.regular14(
                  context,
                ).copyWith(color: Colors.white, fontSize: 16, height: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
