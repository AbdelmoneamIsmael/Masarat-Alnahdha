import 'package:masarat_alnahdha/features/assign_payment/presentation/manager/assign_payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignPaymentCubit extends Cubit<AssignPaymentState> {
  AssignPaymentCubit() : super(AssignPaymentInitial());
  int selectedPaymentIndex = 0;
  void changeSelectedPaymentIndex(int index) {
    selectedPaymentIndex = index;
    emit(ChangeSelectedPaymentState());
  }
}
