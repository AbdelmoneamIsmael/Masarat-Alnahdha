import 'package:masarat_alnahdha/features/edit_profile/manager/edit_profile_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileStateInitial()) {
    emit(EditProfileStateInitial());
  }
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool securePassword = true;

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }

  void changeSecurePassword() {
    securePassword = !securePassword;
    emit(ChangeSecurePassword());
  }
}
