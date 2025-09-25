import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../core/themes/styles/app_text_style.dart';

class UiHelper {
  static void showSnakBar({
    required String message,
    required BuildContext context,
    required MotionToastType type,
  }) {
    switch (type) {
      case MotionToastType.success:
        MotionToast.success(
          toastAlignment: Alignment.topCenter,
          animationType: AnimationType.slideInFromLeft,
          description: Text(
            message,
            style: AppTextStyle.medium16(context).copyWith(color: Colors.white),
          ),
        ).show(context);
        break;
      case MotionToastType.error:
        MotionToast.error(
          toastAlignment: Alignment.topCenter,
          animationType: AnimationType.slideInFromLeft,
          description: Text(
            message,
            style: AppTextStyle.medium16(context).copyWith(color: Colors.white),
          ),
        ).show(context);
        break;
      case MotionToastType.warning:
        MotionToast.warning(
          toastAlignment: Alignment.topCenter,
          animationType: AnimationType.slideInFromLeft,
          description: Text(
            message,
            style: AppTextStyle.medium16(context).copyWith(color: Colors.white),
          ),
        ).show(context);
        break;
      case MotionToastType.info:
        MotionToast.info(
          toastAlignment: Alignment.topCenter,
          animationType: AnimationType.slideInFromLeft,
          description: Text(
            message,
            style: AppTextStyle.medium16(context).copyWith(color: Colors.white),
          ),
        ).show(context);
        break;
      case MotionToastType.custom:
        MotionToast.success(
          toastAlignment: Alignment.topCenter,
          animationType: AnimationType.slideInFromLeft,
          description: Text(
            message,
            style: AppTextStyle.medium16(context).copyWith(color: Colors.white),
          ),
        ).show(context);
        break;
    }
  }

  static BoxShadow shadow(BuildContext context) {
    return BoxShadow(
      color: Theme.of(
        context,
      ).colorScheme.shadow.withAlpha((0.5 * 255).round()),
      spreadRadius: -5,
      blurRadius: 10,
      offset: const Offset(0, 0),
    );
  }
}
