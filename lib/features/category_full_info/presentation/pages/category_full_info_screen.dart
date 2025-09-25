import 'package:masarat_alnahdha/core/generated/app_icons.dart';
import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:masarat_alnahdha/features/categories_info/domain/entities/food_entity.dart';
import 'package:masarat_alnahdha/features/category_full_info/presentation/cubit/category_full_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryFullInfoScreen extends StatelessWidget {
  const CategoryFullInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: LinearButton(
        icon: AppIcons.marketIcon,
        title: "إضافة للسلة",
        onTap: () {},
      ),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // toolbarHeight: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF478D37),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: LightColors.backgroundColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: LightColors.offWhite,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CategoryAppBar(expandedHeight: 100.h),
            pinned: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 20.w,
                vertical: 90.h,
              ),
              child: BlocBuilder<CategoryFullInfoCubit, CategoryFullInfoState>(
                builder: (context, state) {
                  final cubit = context.read<CategoryFullInfoCubit>();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          cubit.food.title,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bold18(context).copyWith(
                            height: 1.5,
                            color: LightColors.lightBlackBackground,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.start,
                            textBaseline: TextBaseline.alphabetic,
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: index < cubit.food.rating.round()
                                    ? Colors.orange
                                    : Colors.grey.shade300,
                                size: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "${cubit.food.rating}",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.regular16(context).copyWith(
                              color: LightColors.lightBlackBackground,

                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: LightColors.greyColor,
                        height: 40.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "الوصف",
                            style: AppTextStyle.regular14(context).copyWith(
                              height: 1.5,
                              color: LightColors.lightBlackBackground,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "يتم كتابة وصف دقيق للوجبة في هذه المساحة بحيث تكون واضحة عبارة عن ثلاثة أسطر يتم كتابة وصف دقيق للوجبة في هذه المساحة بحيث تكون واضحة عبارة عن ثلاثة أسطر",

                            style: AppTextStyle.regular14(
                              context,
                            ).copyWith(height: 1.5, color: Color(0xff6F7A6D)),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: LightColors.greyColor,
                        height: 40.h,
                      ),
                      TimerFoodWidget(
                        food: cubit.food,
                        color: LightColors.lightBlackBackground,
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        "الإضافات على الوجبة",
                        style: AppTextStyle.bold16(
                          context,
                        ).copyWith(height: 1.5),
                      ),
                      Divider(
                        thickness: 1,
                        color: LightColors.greyColor,
                        height: 40.h,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit.additions.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 28.h),
                        itemBuilder: (context, index) => Row(
                          spacing: 6,
                          children: [
                            Expanded(
                              child: Text(
                                cubit.additions[index].title,
                                style: AppTextStyle.bold16(context).copyWith(
                                  height: 1.5,
                                  color: LightColors.lightBlackBackground,
                                ),
                              ),
                            ),
                            Text(
                              "${cubit.additions[index].price}د.ع",
                              style: AppTextStyle.bold16(context).copyWith(
                                height: 1.5,

                                color: LightColors.lightBlackBackground,
                              ),
                            ),
                            Checkbox(
                              activeColor: LightColors.primaryColor,
                              side: BorderSide(color: LightColors.primaryColor),
                              value: cubit.additions[index].isChecked,
                              onChanged: (va) {
                                cubit.toggleAddition(index, va!);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimerFoodWidget extends StatelessWidget {
  const TimerFoodWidget({super.key, required this.food, this.color});
  final FoodEntity food;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PartOFTimeWidget(
          title: "ثانية",
          value: "${food.seconds}",
          color: color,
        ),

        PartOFTimeWidget(
          title: "دقيقة",
          value: "${food.minutes}",
          color: color,
        ),
        PartOFTimeWidget(title: "ساعة", value: "${food.hours}", color: color),
      ],
    );
  }
}

class PartOFTimeWidget extends StatelessWidget {
  const PartOFTimeWidget({
    super.key,
    required this.title,
    required this.value,
    this.color,
  });
  final String title, value;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Text(
          value,
          style: AppTextStyle.bold16(
            context,
          ).copyWith(fontSize: 20.sp, height: 1.5, color: color),
        ),
        Text(
          title,
          style: AppTextStyle.regular14(
            context,
          ).copyWith(fontSize: 14.sp, height: 1.5, color: Color(0xffF68922)),
        ),
      ],
    );
  }
}

class LinearButton extends StatelessWidget {
  const LinearButton({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.padding,
  });
  final String icon, title;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsetsGeometry.all(20),
        margin: EdgeInsetsGeometry.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [Color(0xff267349), Color(0xff5CAB4A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon.isEmpty
                ? const SizedBox()
                : SvgPicture.asset(
                    icon,
                    fit: BoxFit.scaleDown,
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  ),
            SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyle.regular16(
                context,
              ).copyWith(fontSize: 16.sp, color: Colors.white, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryAppBar extends SliverPersistentHeaderDelegate {
  CategoryAppBar({required this.expandedHeight});
  final double expandedHeight;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return BlocBuilder<CategoryFullInfoCubit, CategoryFullInfoState>(
      builder: (context, state) {
        final cubit = context.read<CategoryFullInfoCubit>();
        return Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Container(color: Color(0xFF478D37)),
            Positioned(
              // top: expandedHeight / 2 - shrinkOffset,
              left: 0,
              right: 0,
              bottom: -75.h,
              child: Opacity(
                opacity: (1 - shrinkOffset / expandedHeight),
                child: SizedBox(
                  height: 200.h,
                  child: Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15,
                            spreadRadius: 20,
                            offset: Offset(0, 70),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(100),
                        child: Hero(
                          tag: cubit.food.dishImage,
                          child: cubit.food.smallImage.contains('assets')
                              ? Image.asset(
                                  cubit.food.smallImage,
                                  width: 200.w,
                                  height: 200.h,
                                )
                              : CachedImage(
                                  url: cubit.food.dishImage,
                                  width: 150.w,
                                  height: 150.h,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
