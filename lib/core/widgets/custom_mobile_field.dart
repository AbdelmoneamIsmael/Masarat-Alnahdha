// import 'dart:async';


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:masarat_alnahdha/core/helpers/app_texts.dart';
// import 'package:masarat_alnahdha/core/theming/colors.dart';
// import 'package:masarat_alnahdha/core/theming/styles.dart';

// class CustomMobileField extends StatelessWidget {
//   const CustomMobileField({
//     super.key,
//     this.label,
//     this.hintText,
//     this.requiredWarningMessage,
//     this.required = true,
//     this.labelOnly = false,
//     this.allCountries = false,
//     this.labelStyle,
//     this.hintStyle,
//     this.inputTextStyle,
//     this.errorTextStyle,
//     this.fillColor,
//     this.validator,
//     required this.controller,
//     this.onChanged,
//     this.initValue,
//     this.initCountry,
//   });
//   final String? label, requiredWarningMessage, hintText, initValue, initCountry;
//   final bool required, labelOnly, allCountries;
//   final TextStyle? labelStyle, hintStyle, inputTextStyle, errorTextStyle;
//   final TextEditingController controller;
//   final Color? fillColor;
//   final FutureOr<String?> Function(PhoneNumber?)? validator;
//   final void Function(PhoneNumber)? onChanged;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: 1.5.h,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (label != null)
//           Text(
//             labelOnly
//                 ? label!
//                 : required
//                 ? "$label ${AppTexts.mandatory}"
//                 : "$label ${AppTexts.optional}",
//             style: labelStyle ?? TextStyles.font15BlackBold,
//           ),
//         IntlPhoneField(
//           initialValue: initValue,
//           initialCountryCode: initCountry ?? '+20',
//           controller: controller,
//           languageCode: context.locale.languageCode,
//           style: inputTextStyle ?? TextStyles.font16fontGreyBold,
//           dropdownTextStyle: TextStyles.font16fontGreyBold,
//           dropdownIcon: Icon(
//             Icons.keyboard_arrow_down,
//             color: ColorsManager.iconGrey,
//           ),

//           countries: allCountries
//               ? null
//               : [
//                   Country(
//                     name: "Saudi Arabia",
//                     code: "SA",
//                     dialCode: "966",
//                     flag: "🇸🇦",
//                     maxLength: 9,
//                     minLength: 9,
//                     nameTranslations: {"en": "Saudi Arabia", "ar": "السعودية"},
//                   ),
//                 ],
//           textAlign: TextAlign.start,
//           decoration: InputDecoration(
//             hintStyle: hintStyle ?? TextStyles.font16fontGreyMedium,
//             hintText: hintText ?? AppTexts.enterPhone,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(5.w)),
//               borderSide: BorderSide(color: ColorsManager.gray1_5),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(5.w)),
//               borderSide: BorderSide(color: ColorsManager.gray1_5),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(5.w)),
//               borderSide: BorderSide(color: ColorsManager.gray1_5),
//             ),
//             filled: true,
//             fillColor: fillColor ?? ColorsManager.moreLightGray,
//             prefixText: "|",
//             prefixStyle: TextStyles.font16fontGreyBold.copyWith(
//               fontSize: 18.sp,
//             ),
//             errorStyle:
//                 errorTextStyle ??
//                 TextStyles.font16fontGreyMedium.copyWith(color: Colors.red),
//           ),
//           // initialCountryCode: 'SA',s
//           enabled: true,
//           keyboardType: TextInputType.number,
//           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//           onChanged: onChanged,
//           invalidNumberMessage: AppTexts.numberValidation,
//           validator: required
//               ? (s) {
//                   if (s == null || s.number.isEmpty) {
//                     return requiredWarningMessage ?? AppTexts.requiredField;
//                   }
//                   return validator?.call(s);
//                 }
//               : validator,
//         ),
//       ],
//     );
//   }
// }
