import 'package:masarat_alnahdha/features/check_out/presentation/manager/checkout_steps_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:step_progress/step_progress.dart';

class CheckoutStepsCubit extends Cubit<CheckoutStepsState> {
  CheckoutStepsCubit() : super(CheckoutStepsInitial());
  PageController pageController = PageController();
  // StepProgressController stepProgressController=StepProgressController(totalSteps: 4,initialStep: 1);
  int pageViewIndex = 1;
  void changePageViewIndex(int index) {
    pageViewIndex = index;
    emit(ChangePageState());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    // stepProgressController.dispose();
    return super.close();
  }
}
