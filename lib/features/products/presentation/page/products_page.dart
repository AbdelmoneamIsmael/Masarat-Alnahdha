import 'package:masarat_alnahdha/core/const/app_const.dart';
import 'package:masarat_alnahdha/core/widgets/animated_grid_view.dart';
import 'package:masarat_alnahdha/core/widgets/custom_app_bar.dart';
import 'package:masarat_alnahdha/core/widgets/product_card.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_cubit.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return ScreenWrapper(
          appBar: CustomAppBar(title: title),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AnimatedGridView(
              itemCount: newProductsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 110 / 180,
              ),
              itemBuilder: (context, index) {
                return CustomAnimationConfiguration(
                  index: index,
                  widget: ProductCard(
                    onPressed: () {},
                    productModel: newProductsList[index],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
