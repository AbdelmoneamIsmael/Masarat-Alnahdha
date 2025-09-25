import 'package:masarat_alnahdha/core/di/dependency_injection.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/core/widgets/sliver_location_view.dart';
import 'package:masarat_alnahdha/features/profile_page/data/repo/logout_repo.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/cubit/profile_cubit.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/cubit/profile_state.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/view/account_details_view.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/view/profile_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(context: context,
          //  logoutRepo: sl.get<LogoutRepo>()
          ),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) => ScreenWrapper(
          topSafeArea: true,
          body: const CustomScrollView(
            slivers: [
              SliverLocationView(),
              AccountDetailsView(),
              ProfileOptions(),
              // ApplicationSocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
