import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:masarat_alnahdha/core/widgets/custom_app_bar.dart';
import 'package:masarat_alnahdha/core/widgets/primary_button.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/features/edit_profile/manager/edit_profile_cubit.dart';
import 'package:masarat_alnahdha/features/edit_profile/manager/edit_profile_state.dart';
import 'package:masarat_alnahdha/features/edit_profile/view/edit_profile_image.dart';
import 'package:masarat_alnahdha/features/edit_profile/view/edit_profile_widgets.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(
        title: 'تعديل الصفحة الشخصية',
        leading: CupertinoButton(
          onPressed: () => GoRouter.of(context).pop(),
          padding: const EdgeInsets.all(0),
          minimumSize: const Size(0, 0),
          child: Image.asset(
            'assets/images/backIcon.png',
            color: Theme.of(context).colorScheme.shadow,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => EditProfileCubit(),
        child: BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  30.verticalSpace,
                  const EditProfileImage(),
                  16.verticalSpace,
                  const EditProfileFields(),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: PrimaryButton(
                      isMax: true,
                      text: 'حفظ التغييرات',
                      onPressed: () {},
                    ),
                  ),
                  60.verticalSpace,
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
