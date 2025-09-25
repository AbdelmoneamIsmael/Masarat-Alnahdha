import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masarat_alnahdha/features/address/presentation/manager/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  int selectedAddressIndex = 0;

  void changeSelectedAddressIndex(int index) {
    selectedAddressIndex = index;
    emit(ChangeSelectedAddressState());
  }
}
