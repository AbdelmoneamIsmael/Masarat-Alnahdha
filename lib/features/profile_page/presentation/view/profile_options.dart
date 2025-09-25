import 'package:masarat_alnahdha/features/profile_page/presentation/cubit/profile_cubit.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/cubit/profile_state.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/view/first_section.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/view/third_section.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/widgets/header_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                HeaderTextWidget(title: 'المعلومات الشخصية'),
                8.verticalSpace,
                FirstSection(),
                // 20.verticalSpace,
                // HeaderTextWidget(title: 'الإعدادات العامة'),
                // 8.verticalSpace,
                // SecondSection(),
                20.verticalSpace,
                HeaderTextWidget(title: 'الأمان والمعلومات'),
                8.verticalSpace,
                ThirdSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
