import 'package:masarat_alnahdha/features/home/presentation/manager/home_cubit/home_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  RefreshController refreshController = RefreshController();
}
