
import 'package:masarat_alnahdha/core/const/app_const.dart';
import 'package:masarat_alnahdha/core/widgets/animated_grid_view.dart';
import 'package:masarat_alnahdha/core/widgets/product_card.dart';
import 'package:masarat_alnahdha/core/widgets/sliver_location_view.dart';
import 'package:masarat_alnahdha/features/home/presentation/manager/home_cubit/home_screen_cubit.dart';
import 'package:masarat_alnahdha/features/home/presentation/manager/home_cubit/home_screen_state.dart';
import 'package:masarat_alnahdha/features/home/presentation/view/categories_view.dart';
import 'package:masarat_alnahdha/features/home/presentation/view/new_products_view.dart';
import 'package:masarat_alnahdha/core/widgets/sliver_search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          final cubit = context.read<HomeScreenCubit>();
          return SafeArea(
            top: true,
            bottom: false,
            left: false,
            right: false,
            child: SmartRefresher(
              
              enablePullDown: true,
              enablePullUp: false,
              header: const WaterDropHeader(
                waterDropColor: Color(0xFF667085),
                complete: Icon(Icons.home),
                refresh: Icon(Icons.home),
                idleIcon: Icon(Icons.home),
              ),
              footer: const ClassicFooter(),
              controller: context.read<HomeScreenCubit>().refreshController,
              onRefresh: () async {
                // await Future.wait(<Future<void>>[
                //   context.read<GetHomeSectionsCubit>().getAllSections(),
                //   context.read<HomeHotOffersCubit>().getHotOffers(),
                //   context.read<HomeNewProductCubit>().getNewProducts(),
                //   context.read<ClassificationCubit>().getClassifications(
                //       paginationModel: PaginationModel(pageSize: 2)),
                //   context
                //       .read<UltraClassificationCubit>()
                //       .getUltraClassifications(
                //           paginationModel: PaginationModel(pageSize: 2)),
                //   context.read<FamousBrandsHomeCubit>().getBrands(),
                // ]);
                cubit.refreshController.refreshCompleted();
              },
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsetsGeometry.only(top: 12, bottom: 16),
                    sliver: SliverLocationView(),
                  ),
                  SLiverSearchSection(),
                  // SliverToBoxAdapter(
                  //   child: Container(
                  //     color: LightColors.greyColor,
                  //     padding: const EdgeInsets.symmetric(vertical: 8.0),
                  //     margin: const EdgeInsets.symmetric(vertical: 10),
                  //     child: MarqueeTextWidget(
                  //       animationDuration: Duration(seconds: 20),
                  //       backDuration: Duration(seconds: 20),
                  //       child: Row(
                  //         children: List.generate(5, (index) {
                  //           return Row(
                  //             children: [
                  //               Padding(
                  //                 padding: const EdgeInsets.only(
                  //                   left: 16,
                  //                   right: 16,
                  //                 ).w,
                  //                 child: Text(
                  //                   "-",
                  //                   style: AppTextStyle.bold16(context)
                  //                       .copyWith(
                  //                         fontSize: 12.sp,
                  //                         color: Theme.of(
                  //                           context,
                  //                         ).colorScheme.surface,
                  //                       ),
                  //                 ),
                  //               ),
                  //               SvgPicture.asset("assets/svgs/bxs_offer.svg"),
                  //               Text(
                  //                 "   توصيل مجاني لمدة 24 ساعة",
                  //                 style: AppTextStyle.bold16(context).copyWith(
                  //                   fontSize: 12.sp,
                  //                   color: Theme.of(
                  //                     context,
                  //                   ).colorScheme.surface,
                  //                 ),
                  //               ),
                  //             ],
                  //           );
                  //         }),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // 20.verticalSpace,
                  // HomeAdsView(),
                  // 20.verticalSpace,
                  CategoriesView(),
             
                  // HotOfferView(),
                  NewProductsView(),
                  BestOffersGridView(),
                  // ClassificationsView(),
                  // UltraClassificationsView(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BestOffersGridView extends StatelessWidget {
  const BestOffersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: newProductsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 110 / 210,
      ),
      itemBuilder: (context, index) {
        return CustomAnimationConfiguration(
          index: index,
          widget: ProductCard(
            uinqueKey: "${newProductsList[index].productId}home",
            onPressed: () {},

            productModel: newProductsList[index],
          ),
        );
      },
    );
  }
}
