import 'package:masarat_alnahdha/core/widgets/location_view.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/core/widgets/search_view.dart';
import 'package:masarat_alnahdha/features/orders/presentation/view/tap_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      topSafeArea: true,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: LocationView(),
          ),
          SearchView(),
          30.verticalSpace,
          Expanded(child: TapView()),
        ],
      ),
    );
  }
}
