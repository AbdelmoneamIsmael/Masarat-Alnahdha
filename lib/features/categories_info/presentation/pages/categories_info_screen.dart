import 'package:masarat_alnahdha/core/generated/app_icons.dart';
import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/features/categories_info/domain/entities/food_entity.dart';
import 'package:masarat_alnahdha/features/categories_info/presentation/cubit/categories_info_cubit.dart';
import 'package:masarat_alnahdha/features/category_full_info/presentation/pages/category_full_info_screen.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoriesInfoScreen extends StatelessWidget {
  const CategoriesInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesInfoCubit, CategoriesInfoState>(
      builder: (context, state) {
        return ScreenWrapper(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            toolbarHeight: 0,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: LightColors.primaryColor,
            // backgroundColor: LightColors.greenColor,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: LightColors.primaryColor,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          applayAnotation: false,
          backgroundImage: DecorationImage(
            image: AssetImage(context.read<CategoriesInfoCubit>().currentImage),
            fit: BoxFit.cover,
          ),
          // backgroundColor: Color(0xFF478D37),
          // backgroundColor: LightColors.greenColor,
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(flex: 3, child: DishsSection()),
                  Expanded(flex: 8, child: SizedBox()),
                ],
              ),
              Positioned(
                left: -20,
                right: -80.w,
                bottom: 0,
                top: 0,
                child: Column(
                  children: [
                    Expanded(flex: 3, child: SizedBox()),
                    Expanded(flex: 8, child: InfoCardsSection()),
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: Container(
                      width: 50.w,
                      margin: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 10.w,
                      ),
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: LightColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class InfoCardsSection extends StatelessWidget {
  const InfoCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.directional(end: 0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<CategoriesInfoCubit, CategoriesInfoState>(
            builder: (context, state) {
              final categoriesInfoCubit = context.read<CategoriesInfoCubit>();
              return Swiper(
                onIndexChanged: (index) {
                  categoriesInfoCubit.onSwiperChange(index);
                },
                loop: false,
                controller: categoriesInfoCubit.swiperController,
                itemBuilder: (BuildContext context, int index) {
                  return FoodCard(food: categoriesInfoCubit.FoodEntitys[index]);
                },
                itemCount: categoriesInfoCubit.FoodEntitys.length,
                itemWidth: MediaQuery.sizeOf(context).width - 60.w,

                layout: SwiperLayout.STACK,
              );
            },
          );
        },
      ),
    );
  }
}

class DishsSection extends StatelessWidget {
  const DishsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesInfoCubit, CategoriesInfoState>(
      builder: (context, state) {
        final categoriesInfoCubit = context.read<CategoriesInfoCubit>();
        return Swiper(
          itemCount: categoriesInfoCubit.FoodEntitys.length,
          controller: categoriesInfoCubit.swiperController,
          viewportFraction: .5,
          loop: false,
          onIndexChanged: (index) {
            categoriesInfoCubit.onSwiperChange(index);
          },
          scale: 0.6,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    PagesKeys.categoryFullInfoScreen,
                    extra: {"food": categoriesInfoCubit.FoodEntitys[index]},
                  );
                },
                child: Hero(
                  tag: categoriesInfoCubit.FoodEntitys[index].dishImage,

                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 12,
                          offset: Offset(0, 40),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:
                          categoriesInfoCubit.FoodEntitys[index].smallImage
                              .contains('assets')
                          ? Image.asset(
                              categoriesInfoCubit.FoodEntitys[index].smallImage,
                              width: 150.w,
                              height: 150.h,
                            )
                          : CachedImage(
                              url: categoriesInfoCubit
                                  .FoodEntitys[index]
                                  .dishImage,
                              width: 150.w,
                              height: 150.h,
                            ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class FoodCard extends StatelessWidget {
  final FoodEntity food;

  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(PagesKeys.categoryFullInfoScreen, extra: {"food": food});
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                food.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 4),

              // Rating
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: index < food.rating.round()
                            ? Colors.orange
                            : Colors.grey.shade300,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    food.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey.shade300, thickness: 1, height: 40.h),

              // Description
              Align(
                alignment: Alignment.centerRight,
                child: Text("الوصف", style: AppTextStyle.regular14(context)),
              ),
              const SizedBox(height: 20),
              Text(food.description, style: const TextStyle(fontSize: 13)),
              Divider(color: Colors.grey.shade300, thickness: 1, height: 50.h),

              Expanded(child: SizedBox()),

              // Time Row
              TimerFoodWidget(food: food),

              Expanded(child: SizedBox()),

              // Add to cart button
              LinearButton(
                icon: AppIcons.marketIcon,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                title: "إضافة للسلة ",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildTimeItem(String value, String label) {
  //   return Column(
  //     children: [
  //       Text(
  //         value,
  //         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //       ),
  //       Text(
  //         label,
  //         style: const TextStyle(fontSize: 14, color: Colors.black54),
  //       ),
  //     ],
  //   );
  // }
}
