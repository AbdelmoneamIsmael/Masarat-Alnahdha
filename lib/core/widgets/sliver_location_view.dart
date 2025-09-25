import 'package:masarat_alnahdha/core/widgets/location_view.dart';
import 'package:flutter/material.dart';

class SliverLocationView extends StatelessWidget {
  const SliverLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      sliver: SliverToBoxAdapter(child: LocationView()),
    );
  }
}
