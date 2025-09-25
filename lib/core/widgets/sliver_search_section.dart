import 'package:masarat_alnahdha/core/widgets/search_view.dart';
import 'package:flutter/material.dart';

class SLiverSearchSection extends StatelessWidget {
  const SLiverSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SearchView());
  }
}
