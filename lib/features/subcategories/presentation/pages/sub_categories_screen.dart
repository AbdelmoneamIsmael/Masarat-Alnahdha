import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/models/categories/categorie_model.dart';
import 'package:masarat_alnahdha/core/widgets/animated_grid_view.dart';
import 'package:masarat_alnahdha/core/widgets/custom_app_bar.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/features/home/presentation/view/categories_view.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.subCategoriesList});
  final List<CategorieModel> subCategoriesList;
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(
        title: "تصنيفات ( الدجاج )",
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(13),
          child: Image.asset(AppImage.dividerImage),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            sliver: SliverList.separated(
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: subCategoriesList.length,

              itemBuilder: (context, index) {
                return CustomAnimationConfiguration(
                  index: index,
                  widget: CategoryItem(
                    categoryModel: subCategoriesList[index],
                    height: 260.h,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
