import 'package:masarat_alnahdha/features/onboarding/presentation/controller/onbording_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnbordingController extends Cubit<OnbordingState> {
  OnbordingController() : super(OnbordingtInitial());
  PageController pageController = PageController();
  int currentPage = 0;

  void changePage(int index) {
    currentPage = index;
    emit(ChangePageSuccess());
  }
}
