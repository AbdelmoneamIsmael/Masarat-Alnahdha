import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/features/onboarding/presentation/controller/onbording_controller.dart';
import 'package:masarat_alnahdha/features/onboarding/presentation/controller/onbording_state.dart';
import 'package:masarat_alnahdha/features/onboarding/presentation/view/onboard_content.dart';
import 'package:masarat_alnahdha/features/onboarding/presentation/view/onboard_options.dart';
import 'package:masarat_alnahdha/features/onboarding/presentation/view/upper_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OboardingScreen extends StatelessWidget {
  const OboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnbordingController(),
      child: BlocBuilder<OnbordingController, OnbordingState>(
        builder: (context, state) {
          return const ScreenWrapper(
            body: Stack(
              children: [
                UpperShape(),
                OnBoardContent(),
                OnBoardBottomOptions(),
              ],
            ),
          );
        },
      ),
    );
  }
}
