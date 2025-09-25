import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/core/widgets/custom_text_field.dart';
import 'package:masarat_alnahdha/core/widgets/custom_titled_logo.dart';
import 'package:masarat_alnahdha/core/widgets/primary_button.dart';
import 'package:masarat_alnahdha/features/register/presentation/manager/register_cubit.dart';
import 'package:masarat_alnahdha/features/register/presentation/manager/register_state.dart';
import 'package:masarat_alnahdha/features/register/presentation/widgets/retreve_password_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/screen_wrapper.dart';
import '../../../../core/widgets/donot_have_account_text.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) async {},
      builder: (context, state) {
        final cubit = BlocProvider.of<RegisterCubit>(context);
        return ScreenWrapper(
          topSafeArea: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    18.verticalSpace,
                    const CustomTitledLogo(
                      subtitle: '"تسجيل حساب جديد"',
                      title: 'اهلا بك فى الرفيل',
                      logoImage: AppImage.logo,
                    ),
                    35.verticalSpace,
                    SizedBox(
                      height: 80.h,
                      child: CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل اسم المستخدم';
                          } else {
                            return null;
                          }
                        },
                        controller: cubit.usernameController,
                        // autofillHints: const [AutofillHints.username],
                        hintText: 'الاسم',
                      ),
                    ),
                    // 37.verticalSpace,
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
                        controller: cubit.emailController,
                        // autofillHints: const [AutofillHints.username],
                        hintText: 'الهاتف المحمول',
                      ),
                    ),
                    // 37.verticalSpace,
                    SizedBox(
                      height: 80.h,
                      child: CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ' ادخل رقم الهاتف';
                          } else {
                            return null;
                          }
                        },
                        controller: cubit.emailController,
                        // autofillHints: const [AutofillHints.username],
                        hintText: 'البريد الالكترونى',
                      ),
                    ),
                    // 37.verticalSpace,
                    SizedBox(
                      height: 80.h,
                      child: CustomTextField(
                        hintText: 'كلمه السر',
                        // autofillHints: const [AutofillHints.password],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل كلمه السر';
                          } else {
                            return null;
                          }
                        },
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
                    12.verticalSpace,
                    PrimaryButton(
                      isMax: true,
                      text: 'تسجيل الحساب',
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          GoRouter.of(context).push(PagesKeys.homePage);
                        }
                      },
                    ),
                    29.verticalSpace,
                    HaveAccountOrNotText(
                      description: 'لديك حساب بالفعل ؟',
                      buttonText: 'تسجيل الدخول',
                      onPressed: () {
                        GoRouter.of(context).go(PagesKeys.loginPage);
                      },
                    ),
                    // const Spacer(),
                    30.verticalSpace,
                    RetrivePasswordText(title: 'تخطى كزائر', onPressed: () {}),
                    38.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
