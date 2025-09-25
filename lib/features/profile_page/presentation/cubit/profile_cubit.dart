import 'package:masarat_alnahdha/core/helper/bloc_observer.dart';
import 'package:masarat_alnahdha/features/profile_page/data/repo/logout_repo.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.context,
  //  required this.logoutRepo
   })
    : super(ProfileScreenInitial());
  final BuildContext context;
  // final LogoutRepo logoutRepo;

  onTap(int index) async {
    switch (index) {
      case 0:
        // GoRouter.of(context).push(PagesKeys.ordersPage);
        break;
      case 1:
      // GoRouter.of(context).push(PagesKeys.getAllUserAdress);
      case 2:
      // GoRouter.of(context).push(PagesKeys.favoritesPages);
      case 3:
      // () async {
      //   Uri uri = Uri.parse('https://wa.me/+201092394069?text= ');
      //   if (await canLaunchUrl(uri)) {
      //     await launchUrl(uri);
      //   }
      // };
      // GoRouter.of(context).push(PagesKeys.favoritesPages);
      case 4:
        // Share.share(
        //     "https://play.google.com/store/apps/details?id=com.perfume.ecommerce");
        break;
      case 5:
        // GoRouter.of(context).push(PagesKeys.privacyPage);
        break;
      case 6:
        // GoRouter.of(context).push(PagesKeys.aboutUsPage);
        break;
      case 7:
        await makeSignOutOperations();
        break;

      default:
        PrintHelper(index.toString());
    }
  }

  Future<void> makeSignOutOperations() async {
    // try {
    //   emit(LogoutLoadingState());
    //   var result = await logoutRepo.logout();
    //   result.fold(
    //     (l) => emit(LogoutErrorState(message: l.message)),
    //     (r) async {
    //       await BlocProvider.of<AppCubit>(context).makeAppReadyToLogin();
    //       PageRoutes.clearAndNavigate(PagesKeys.homeScreen);
    //       emit(LogoutSuccessState());
    //     },
    //   );
    // } on Exception catch (e) {
    //   emit(LogoutErrorState(message: e.toString()));
    // }
  }
}
