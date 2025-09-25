abstract class ProfileState {}

class ProfileScreenInitial extends ProfileState {}

class LogoutLoadingState extends ProfileState {}

class LogoutSuccessState extends ProfileState {}

class LogoutErrorState extends ProfileState {
  final String message;
  LogoutErrorState({required this.message});
}
