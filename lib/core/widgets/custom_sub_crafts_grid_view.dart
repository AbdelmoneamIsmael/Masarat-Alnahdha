import 'package:flutter/material.dart';

class CustomSubCraftsGridView extends StatelessWidget {
  const CustomSubCraftsGridView({
    super.key,
    this.itemCount,
    this.physics,
    required this.shrinkWrap,
    this.controller,
    required this.itemBuilder,
  });

  final int? itemCount;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final ScrollController? controller;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      controller: controller,
      itemCount: itemCount,
      physics: physics,
      shrinkWrap: shrinkWrap,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 155 / 180,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
