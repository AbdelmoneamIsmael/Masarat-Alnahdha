import 'package:masarat_alnahdha/features/login/presentation/manager/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    emit(LoginInitial());
  }
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool securePassword = true;

  int selectIndex = 0;
  void changeTap({required int index}) {
    selectIndex = index;
    emit(ChangeTapState());
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }

  // Future<void> login({
  //   required SigninRepo signinRepo,
  //   required GetUserInfoRepo getUserInfo,
  // }) async {
  //   try {
  //     emit(LoginLoading());
  //     var result = await signinRepo.login();
  //     result.fold(
  //       (l) {
  //         emit(LoginFailure(
  //           message: l.message,
  //         ));
  //       },
  //       (r) async {
  //         print(r);
  //         var userInfo = await getUserInfo.getUserInfo();
  //         userInfo.fold(
  //           (l) => emit(LoginFailure(
  //             message: l.message,
  //           )),
  //           (info) {
  //             emit(
  //               LoginSuccess(
  //                 userModel: r,
  //                 userInfoModel: info,
  //               ),
  //             );
  //           },
  //         );
  //       },
  //     );
  //   } on Exception catch (e) {
  //     emit(LoginFailure(
  //       message: e.toString(),
  //     ));
  //   }
  // }

  void changeSecurePassword() {
    securePassword = !securePassword;
    emit(ChangeSecurePassword());
  }
}
