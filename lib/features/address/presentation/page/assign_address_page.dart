import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/features/address/data/models/location_details_model.dart';
import 'package:masarat_alnahdha/features/address/presentation/manager/address_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:masarat_alnahdha/features/address/presentation/manager/address_state.dart';
import 'package:masarat_alnahdha/features/address/presentation/widgets/address_item.dart';
import 'package:masarat_alnahdha/features/category_full_info/presentation/pages/category_full_info_screen.dart';
import 'package:masarat_alnahdha/features/check_out/presentation/manager/checkout_steps_cubit.dart';

class AssignAddressPage extends StatelessWidget {
  const AssignAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(),
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          final cubit = context.read<AddressCubit>();
          return ScreenWrapper(
            appBar: AppBar(
              title: const Text('اختر العنوان'),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  BlocProvider.of<CheckoutStepsCubit>(
                    context,
                  ).changePageViewIndex(1);
                  BlocProvider.of<CheckoutStepsCubit>(
                    context,
                  ).pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: LinearButton(
                icon: "",
                title: 'التالى',
                onTap: () {
                  BlocProvider.of<CheckoutStepsCubit>(
                    context,
                  ).changePageViewIndex(3);
                  BlocProvider.of<CheckoutStepsCubit>(
                    context,
                  ).pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.surface,
              onPressed: () async {
                // bool canOpen =
                await _checkAndRequestLocationPermission(context).then((
                  canOpen,
                ) {
                  if (canOpen) {
                    if (context.mounted) {
                      GoRouter.of(context).push(PagesKeys.mapScreen).then((
                        val,
                      ) {
                        // print(val);
                        if (val != null) {
                          LocationDetailsModel locationDetailsModel =
                              val as LocationDetailsModel;
                          print(locationDetailsModel.locationDetail);
                          // cubit.locationController.text =
                          //     locationDetailsModel.locationDetail;
                        }
                      });
                    }
                  } else {
                    // يمكنك هنا إظهار رسالة تنبيه للمستخدم
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'يجب السماح بالوصول للموقع لاستخدام الخريطة',
                        ),
                      ),
                    );
                  }
                });
              },
              child: const Icon(Icons.location_on_outlined, size: 35),
            ),
            body: ListView.builder(
              itemCount: 15,
              padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => cubit.changeSelectedAddressIndex(index),
                child: AddressItem(
                  isSelected: cubit.selectedAddressIndex == index,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<bool> _checkAndRequestLocationPermission(BuildContext context) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return false;
  }
  // LocationPermission permission = await Geolocator.checkPermission();
  // if (permission == LocationPermission.denied) {
  //   permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied) {
  //     return false;
  //   }
  // }
  // if (permission == LocationPermission.deniedForever) {
  //   return false;
  // }
  return true;
}
