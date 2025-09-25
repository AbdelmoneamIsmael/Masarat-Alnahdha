import 'package:masarat_alnahdha/core/widgets/custom_text_field.dart';
import 'package:masarat_alnahdha/features/login/presentation/manager/login_cubit.dart';
import 'package:masarat_alnahdha/features/login/presentation/manager/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PhoneFields extends StatelessWidget {
  const PhoneFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<LoginCubit>(context);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.white10,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80.h,
                child: CustomTextField(
                  borderColor: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.3),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ادخل رقم الهاتف';
                    } else {
                      return null;
                    }
                  },
                  controller: cubit.usernameController,
                  autofillHints: const [AutofillHints.telephoneNumber],
                  textInputType: TextInputType.phone,
                  hintText: 'رقم الهاتف',
                ),
              ),
              // 37.verticalSpace,
              SizedBox(
                height: 75.h,
                child: CustomTextField(
                  borderColor: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.3),
                  hintText: 'كلمه السر',
                  autofillHints: const [AutofillHints.password],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ادخل كلمه السر';
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    'assets/svgs/password.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).textTheme.bodyMedium!.color!,
                      BlendMode.srcIn,
                    ),
                  ),
                  controller: cubit.passwordController,
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
          ),
        );
      },
    );
  }
}
