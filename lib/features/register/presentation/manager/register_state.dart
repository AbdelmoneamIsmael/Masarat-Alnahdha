
abstract class  RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String message;
  RegisterFailure({required this.message});
}

class RegisterSuccess extends RegisterState {
  // final UserModel userModel;
  // final UserInfoModel userInfoModel;
  RegisterSuccess();
}

class RegisterLoading extends RegisterState {}

class ChangeSecurPassword extends RegisterState {}
