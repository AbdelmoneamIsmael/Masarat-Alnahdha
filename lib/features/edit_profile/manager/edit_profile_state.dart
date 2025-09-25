
abstract class EditProfileState {}

class EditProfileStateInitial extends EditProfileState {}
// class EditProfileTapState extends EditProfileState {}

class EditProfileStateFailure extends EditProfileState {
  final String message;
  EditProfileStateFailure({required this.message});
}

class EditProfileStateSuccess extends EditProfileState {
  // final UserModel userModel;
  // final UserInfoModel userInfoModel;
  EditProfileStateSuccess();
}

class EditProfileStateLoading extends EditProfileState {}

class ChangeSecurePassword extends EditProfileState {}
