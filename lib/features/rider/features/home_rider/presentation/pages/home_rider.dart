import 'package:masarat_alnahdha/features/rider/features/home_rider/presentation/view/rider_home_view.dart';
import 'package:flutter/material.dart';

class HomeRiderScreen extends StatelessWidget {
  const HomeRiderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/map.png', fit: BoxFit.cover),
            HomeRiderView(),
          ],
        ),
      ),
    );
  }
}
