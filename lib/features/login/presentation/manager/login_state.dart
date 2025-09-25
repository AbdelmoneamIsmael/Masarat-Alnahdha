
abstract class LoginState {}

class LoginInitial extends LoginState {}
class ChangeTapState extends LoginState {}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}

class LoginSuccess extends LoginState {
  // final UserModel userModel;
  // final UserInfoModel userInfoModel;
  LoginSuccess();
}

class LoginLoading extends LoginState {}

class ChangeSecurePassword extends LoginState {}
