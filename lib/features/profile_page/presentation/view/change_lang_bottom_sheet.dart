import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';

class ChangeLangBottomSheet extends StatefulWidget {
  const ChangeLangBottomSheet({super.key, required this.scrollController});

  final ScrollController scrollController;
  @override
  State<ChangeLangBottomSheet> createState() => _ChangeLangBottomSheetState();
}

class _ChangeLangBottomSheetState extends State<ChangeLangBottomSheet> {
  String _selectedLang = 'ar';
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: ListView(
        padding: const EdgeInsets.all(16),
        controller: widget.scrollController,
        children: [
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    child: Text(
                      "EN",
                      style: AppTextStyle.regular16(
                        context,
                      ).copyWith(fontSize: 18),
                    ),
                  ),
                  7.horizontalSpace,
                  Text(
                    "English",
                    style: AppTextStyle.regular16(
                      context,
                    ).copyWith(fontSize: 18),
                  ),
                ],
              ),
              Radio(
                value: 'en',
                groupValue: _selectedLang,
                onChanged: (value) {
                  setState(() {
                    _selectedLang = value!;
                  });
                },
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    child: Text(
                      "ع",
                      style: AppTextStyle.regular16(
                        context,
                      ).copyWith(fontSize: 18),
                    ),
                  ),
                  7.horizontalSpace,
                  Text(
                    "اللغة العربية",
                    style: AppTextStyle.regular16(
                      context,
                    ).copyWith(fontSize: 18),
                  ),
                ],
              ),
              Radio(
                value: 'ar',
                groupValue: _selectedLang,
                onChanged: (value) {
                  setState(() {
                    _selectedLang = value!;
                  });
                },
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    child: Text(
                      "FR",
                      style: AppTextStyle.regular16(
                        context,
                      ).copyWith(fontSize: 18),
                    ),
                  ),
                  7.horizontalSpace,
                  Text(
                    "Francis",
                    style: AppTextStyle.regular16(
                      context,
                    ).copyWith(fontSize: 18),
                  ),
                ],
              ),
              Radio(
                value: 'fr',
                groupValue: _selectedLang,
                onChanged: (value) {
                  setState(() {
                    _selectedLang = value!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
