import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masarat_alnahdha/core/widgets/custom_text_field.dart';
import 'package:masarat_alnahdha/features/edit_profile/manager/edit_profile_cubit.dart';
import 'package:masarat_alnahdha/features/edit_profile/manager/edit_profile_state.dart';
import 'package:masarat_alnahdha/features/edit_profile/widgets/form_field_title.dart';

class EditProfileFields extends StatelessWidget {
  const EditProfileFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        final cubit = context.read<EditProfileCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormFieldTitle(title: 'الاسم'),
            4.verticalSpace,
            SizedBox(
              height: 75.h,
              child: const CustomTextField(
                hintText: 'الاسم',
                textInputType: TextInputType.name,
              ),
            ),
            const FormFieldTitle(title: 'البريد الإلكتروني'),
            4.verticalSpace,
            SizedBox(
              height: 75.h,
              child: const CustomTextField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.name,
              ),
            ),
            const FormFieldTitle(title: 'رقم الهاتف'),
            4.verticalSpace,
            SizedBox(
              height: 75.h,
              child: const CustomTextField(
                hintText: 'رقم الهاتف',
                textInputType: TextInputType.name,
              ),
            ),
            const FormFieldTitle(title: 'كلمة المرور'),
            4.verticalSpace,
            SizedBox(
              height: 75.h,
              child: CustomTextField(
                hintText: 'كلمة المرور',
                textInputType: TextInputType.name,
                prefixIcon: SvgPicture.asset(
                  'assets/svgs/password.svg',
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).textTheme.bodyMedium!.color!,
                    BlendMode.srcIn,
                  ),
                ),
                obscureText: cubit.securePassword,
                suffixIcon: GestureDetector(
                  child: cubit.securePassword
                      ? const Icon(
                          Icons.remove_red_eye_outlined,
                          size: 20,
                          // color: AppDarkColors.darkBlue,
                        )
                      : const Icon(
                          size: 20,
                          Icons.visibility_off_outlined,
                          // color: AppDarkColors.darkBlue,
                        ),
                  onTap: () => cubit.changeSecurePassword(),
                ),
              ),
            ),
            const FormFieldTitle(title: 'تأكيد كلمة المرور'),
            4.verticalSpace,
            SizedBox(
              height: 75.h,
              child: CustomTextField(
                hintText: 'تأكيد كلمة المرور',
                textInputType: TextInputType.name,
                prefixIcon: SvgPicture.asset(
                  'assets/svgs/password.svg',
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).textTheme.bodyMedium!.color!,
                    BlendMode.srcIn,
                  ),
                ),
                obscureText: cubit.securePassword,
                suffixIcon: GestureDetector(
                  child: cubit.securePassword
                      ? const Icon(
                          Icons.remove_red_eye_outlined,
                          size: 20,
                          // color: AppDarkColors.darkBlue,
                        )
                      : const Icon(
                          size: 20,
                          Icons.visibility_off_outlined,
                          // color: AppDarkColors.darkBlue,
                        ),
                  onTap: () => cubit.changeSecurePassword(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
