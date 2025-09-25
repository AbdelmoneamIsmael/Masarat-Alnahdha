import 'package:masarat_alnahdha/core/widgets/custom_text_field.dart';
import 'package:masarat_alnahdha/features/login/presentation/manager/login_cubit.dart';
import 'package:masarat_alnahdha/features/login/presentation/manager/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailFields extends StatelessWidget {
  const EmailFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<LoginCubit>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
              child: CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ادخل البريد الالكترونى';
                  } else {
                    return null;
                  }
                },

                controller: cubit.usernameController,
                textInputType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                hintText: 'البريد الالكترونى',
              ),
            ),
            // 37.verticalSpace,
            SizedBox(
              height: 75.h,
              child: CustomTextField(
                hintText: 'كلمه السر',
                autofillHints: const [AutofillHints.password],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ادخل كلمه السر';
                  } else {
                    return null;
                  }
                },
                controller: cubit.passwordController,
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
            // 20.verticalSpace,
            // RetrivePasswordText(title: 'نسيت كلمه المرور?', onPressed: () {}),
          ],
        );
      },
    );
  }
}
