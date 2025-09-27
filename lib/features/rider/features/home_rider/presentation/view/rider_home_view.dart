import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/routes/pages_keys.dart';
import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:masarat_alnahdha/features/category_full_info/presentation/pages/category_full_info_screen.dart';
import 'package:masarat_alnahdha/features/rider/features/home_rider/domain/repositories/order_repo.dart';
import 'package:masarat_alnahdha/features/rider/features/home_rider/presentation/cubit/home_rider_cubit.dart';
import 'package:masarat_alnahdha/features/rider/features/home_rider/presentation/widgets/icon_with_background.dart';
import 'package:masarat_alnahdha/features/rider/features/home_rider/presentation/widgets/rider_container.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:masarat_alnahdha/gen/assets.gen.dart';

class HomeRiderView extends StatelessWidget {
  const HomeRiderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeRiderAppBar(),
        Expanded(child: DelevryOrder()),
      ],
    );
  }
}

class HomeRiderAppBar extends StatelessWidget {
  const HomeRiderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return RiderContainer(
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16).w,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(PagesKeys.notificationPage);
                },
                child: IconWithBackground(
                  icon: "assets/svgs/notification_icon.svg",
                ),
              ),
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: 50.w,
                    child: Image.asset(AppImage.logo),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed(PagesKeys.riderAccound);
                },
                child: IconWithBackground(icon: "assets/svgs/side_mennue.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DelevryOrder extends StatelessWidget {
  const DelevryOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeRiderCubit, HomeRiderState>(
      builder: (context, state) {
        final cubit = context.read<HomeRiderCubit>();
        return cubit.acceptOrder
            ? SelctedViewDetails(cubit: cubit)
            : ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 28).w,
                shrinkWrap: true,

                itemBuilder: (context, index) {
                  return DeleveryOrdersWidget(
                    riderOrder: cubit.orders[index],
                    onAcceptOrder: () {
                      cubit.changeAcceptOrdersState(cubit.orders[index]);
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: cubit.orders.length,
              );
      },
    );
  }
}

class SelctedViewDetails extends StatelessWidget {
  const SelctedViewDetails({super.key, required this.cubit});

  final HomeRiderCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 28).w,
        child: Column(
          spacing: 30,
          children: [
            RiderContainer(
              padding: EdgeInsets.all(12).w,
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "وصول خلال 5 دقائق",
                    style: AppTextStyle.regular12(
                      context,
                    ).copyWith(fontSize: 12.sp, height: 1.5),
                  ),
                  SizedBox(height: 5.h),
                  OrderTile(
                    icon: "assets/svgs/location.svg",
                    title: "العنوان",
                    value:
                        "${cubit.selectedOrder!.deliveryAddress.city} ${cubit.selectedOrder!.deliveryAddress.street} ${cubit.selectedOrder!.deliveryAddress.details}",
                  ),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  LinearProgressIndicator(
                    value: .7,
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: LightColors.greyColor,
                    color: LightColors.primaryColor,
                  ),
                  SizedBox(),
                ],
              ),
            ),
            DeleveryOrdersWidget(
              riderOrder: cubit.selectedOrder!,
              onAcceptOrder: null,
            ),
          ],
        ),
      ),
    );
  }
}

class DeleveryOrdersWidget extends StatelessWidget {
  const DeleveryOrdersWidget({
    super.key,
    required this.riderOrder,
    required this.onAcceptOrder,
  });
  final RiderOrder riderOrder;
  final VoidCallback? onAcceptOrder;
  @override
  Widget build(BuildContext context) {
    return RiderContainer(
      padding: EdgeInsets.all(12).w,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderTile(
            icon: "assets/svgs/ion_restaurant.svg",
            title: "اسم المطعم",
            value: riderOrder.restaurant.name,
            image: riderOrder.restaurant.imageUrl ?? "",
          ),
          OrderTile(
            title: "#  رقم الطلبية",
            value: riderOrder.orderNumber,
            icon: "",
          ),
          Divider(color: LightColors.greyColor),
          OrderTile(
            icon: Assets.svgs.ionTimeOutline,
            title: "الوقت المتبقي للتوصيل",
            value: "${riderOrder.estimatedDeliveryTime?.minute} د ",
          ),
          OrderTile(
            icon: "assets/svgs/group status.svg",
            title: "حالة الطلبية",
            value: "",
            child: Container(
              padding: EdgeInsets.all(8).w,
              decoration: BoxDecoration(
                color: riderOrder.status.color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                riderOrder.status.arabicText,
                style: AppTextStyle.regular12(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ),
          ),
          OrderTile(
            icon: "assets/svgs/location.svg",
            title: "العنوان",
            value:
                "${riderOrder.deliveryAddress.city} ${riderOrder.deliveryAddress.street} ${riderOrder.deliveryAddress.details}",
          ),
          OrderTile(
            icon: "assets/svgs/wallet.svg",
            title: "إجمالي الطلبية",
            value: "",
            child: Text(
              "${riderOrder.totalAmount} ر.س",
              style: AppTextStyle.bold14h24(
                context,
              ).copyWith(color: LightColors.orangeColor),
            ),
          ),
          OrderTile(
            icon: "assets/svgs/wallet.svg",
            title: "حالة الدفع",
            value: "",
            child: Text(
              riderOrder.paymentStatus.arabicText,
              style: AppTextStyle.bold14h24(context),
            ),
          ),
          if (onAcceptOrder != null)
            LinearButton(
              icon: "",
              onTap: onAcceptOrder,
              title: "قبول الطلبية",
              padding: EdgeInsets.all(6),
            ),
        ],
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.title,
    required this.value,
    this.image = "",
    this.child,
    required this.icon,
  });

  final String title, value, icon;
  final String image;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon.isNotEmpty ? SvgPicture.asset(icon, width: 16) : SizedBox(),
        SizedBox(width: 5),
        Text(title, style: AppTextStyle.regular14(context).copyWith()),
        SizedBox(width: 10),

        SizedBox(width: 10),
        value.isEmpty
            ? Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [child!],
                ),
              )
            : Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (image.isNotEmpty)
                      SizedBox(
                        width: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: CachedImage(url: image),
                          ),
                        ),
                      ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        value,
                        style: AppTextStyle.regular14(
                          context,
                        ).copyWith(color: LightColors.orangeColor),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
