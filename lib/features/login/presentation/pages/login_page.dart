import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/core/widgets/custom_titled_logo.dart';
import 'package:masarat_alnahdha/core/widgets/primary_button.dart';
import 'package:masarat_alnahdha/features/login/presentation/manager/login_cubit.dart';
import 'package:masarat_alnahdha/features/login/presentation/manager/login_state.dart';
import 'package:masarat_alnahdha/features/login/presentation/views/login_controller_view.dart';
import 'package:masarat_alnahdha/features/register/presentation/widgets/retreve_password_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:masarat_alnahdha/gen/assets.gen.dart';
import '../../../../core/widgets/screen_wrapper.dart';
import '../../../../core/widgets/donot_have_account_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {},
      builder: (context, state) {
        final cubit = BlocProvider.of<LoginCubit>(context);
        return ScreenWrapper(
          applayAnotation: false,
          backgroundImage: DecorationImage(
            image: AssetImage(
              Assets.exproducts.geminiGeneratedImage5osqoo5osqoo5osq.path,
            ),
            fit: BoxFit.cover,
          ),
          // appBar: AppBar(toolbarHeight: 0),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    80.verticalSpace,
                    const CustomTitledLogo(
                      title: "أهلًا بيك في الرفيل",
                      subtitle: '"سجّل الدخول إلى حسابك" ',
                      logoImage: AppImage.logo,
                    ),
                    27.verticalSpace,
                    LoginControllerView(),
                    20.verticalSpace,
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: RetrivePasswordText(
                        title: 'نسيت كلمه المرور؟',
                        onPressed: () {},
                      ),
                    ),
                    30.verticalSpace,
                    PrimaryButton(
                      isMax: true,
                      text: 'تسجيل الدخول',
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          if (cubit.usernameController.text == "1") {
                            GoRouter.of(context).push(PagesKeys.homePage);
                          } else if (cubit.usernameController.text == "2") {
                            GoRouter.of(context).push(PagesKeys.homePage);
                          } else if (cubit.usernameController.text == "3") {
                            GoRouter.of(
                              context,
                            ).pushNamed(PagesKeys.homeRiderPage);
                          } else {
                            GoRouter.of(context).push(PagesKeys.homePage);
                          }
                        }
                      },
                    ),
                    29.verticalSpace,
                    HaveAccountOrNotText(
                      description: ' ليس لديك حساب؟  ',
                      buttonText: 'تسجيل حساب جديد',
                      onPressed: () {
                        GoRouter.of(context).go(PagesKeys.registerPage);
                      },
                    ),
                    // const Spacer(),
                    30.verticalSpace,
                    RetrivePasswordText(title: 'تخطى كزائر', onPressed: () {}),
                    80.verticalSpace,
                    SizedBox(height: MediaQuery.viewInsetsOf(context).bottom),
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
