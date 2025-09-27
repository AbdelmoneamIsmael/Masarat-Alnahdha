import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/helpers/widget_extensions.dart';
import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:masarat_alnahdha/core/widgets/marquee_text_widget.dart';
import 'package:masarat_alnahdha/core/widgets/ui_function.dart';
import 'package:masarat_alnahdha/features/cart/data/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:masarat_alnahdha/features/cart/presentation/cubit/cart_screen_event.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
    required this.onAdd,
    required this.onSubtract,
    required this.onDismissed,
  });
  final CartModel cartItem;
  final void Function()? onAdd, onSubtract;
  final void Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      background: Container(
        height: 120.h,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: LightColors.redColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [UiHelper.shadow(context)],
        ),
        child: Row(
          spacing: 10,
          children: [
            const Icon(Icons.delete, color: Colors.white),
            Text(
              "حذف",
              style: AppTextStyle.bold16(context).copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      key: UniqueKey(),
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [UiHelper.shadow(context)],
        ),
        child: Row(
          children: [
            CartImageSection(image: cartItem.imageUrl),
            const SizedBox(width: 10),
            CartDetailsSection(cartItem: cartItem),

            // OperationSection(
            //   onAdd: onAdd,
            //   onSubtract: onSubtract,
            //   cartItem: cartItem,
            // ),
            5.horizontalSpace,
          ],
        ),
      ),
    );
  }
}

class OperationSection extends StatelessWidget {
  const OperationSection({
    super.key,
    required this.onAdd,
    required this.onSubtract,
    required this.cartItem,
  });
  final void Function()? onAdd, onSubtract;
  final CartModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 30,
          decoration: BoxDecoration(
            color: LightColors.blueColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              CupertinoButton(
                onPressed: onAdd,
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12,
                ),
                minimumSize: Size(0, 0),
                child: const Icon(color: Colors.white, Icons.add, size: 10),
              ),
              Text(
                cartItem.quantity.toString(),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
              CupertinoButton(
                onPressed: onSubtract,
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12,
                ),
                minimumSize: Size(0, 0),
                child: const Icon(color: Colors.white, Icons.remove, size: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CartDetailsSection extends StatelessWidget {
  const CartDetailsSection({super.key, required this.cartItem});

  final CartModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MarqueeTextWidget(
            textDirection: TextDirection.rtl,
            child: Text(
              cartItem.title,
              style: AppTextStyle.bold16(
                context,
              ).copyWith(fontSize: 15.sp, height: 1.5),
            ),
          ),
          5.verticalSpace,
          5.verticalSpace,

          Text(
            "3 قطع دجاج + 3 قطع شاورما + بطاطس + كول سلو + مشروب",
            style: AppTextStyle.regular12(context),
          ),
          5.verticalSpace,
          5.verticalSpace,
          5.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الكمية : ${cartItem.quantity}",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ).expand(),

              Text(
                "${cartItem.price} ر.س",
                textAlign: TextAlign.end,
                style: AppTextStyle.bold18(
                  context,
                ).copyWith(color: LightColors.orangeColor),
              ).expand(),
            ],
          ),

          // 5.verticalSpace,
          Divider(height: 5, thickness: .5, color: LightColors.greyColor),

          CartStepperCounter(cartItem: cartItem),
        ],
      ),
    );
  }
}

class CartStepperCounter extends StatefulWidget {
  const CartStepperCounter({super.key, required this.cartItem});
  final CartModel cartItem;

  @override
  State<CartStepperCounter> createState() => _CartStepperCounterState();
}

class _CartStepperCounterState extends State<CartStepperCounter> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (widget.cartItem.selectedQuantity > 1) {
              setState(() {
                counter--;
              });
              widget.cartItem.updateQuantity(false);
              BlocProvider.of<CartScreenCubit>(context).add(CalcTotal());
            }
          },
          icon: const Icon(Icons.remove),
          iconSize: 30.w,
        ).expand(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            border: Border.all(color: LightColors.greyColor),
          ),
          child: Text(
            widget.cartItem.selectedQuantity.toString(),
            style: AppTextStyle.bold16(
              context,
            ).copyWith(fontSize: 18.sp, height: 1.5),
          ).center(),
        ).expand(flex: 2),
        IconButton(
          onPressed: () {
            if (widget.cartItem.selectedQuantity < widget.cartItem.quantity) {
              setState(() {
                counter++;
              });
              widget.cartItem.updateQuantity(true);
              BlocProvider.of<CartScreenCubit>(context).add(CalcTotal());
            }
          },
          icon: const Icon(Icons.add),
          iconSize: 30.w,
        ).expand(),
      ],
    );
  }
}

class CartImageSection extends StatelessWidget {
  const CartImageSection({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: image.contains("assets")
            ? Image.asset(image, height: 120.h, width: 120.w)
            : CachedImage(url: image, height: 120.h, width: 120.w),
      ),
    );
  }
}

Widget buildCartActions(CartModel cartItem, BuildContext context) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 200),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface.withValues(alpha: .3),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkResponse(
          onTap: () {
            // cartViewModel.addToCart(cartItem);
          },
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: Icon(Icons.add, color: Colors.white, size: 16),
          ),
        ),
        SizedBox(width: 4),
        Text(
          '1',
          // (cartItem.itemQuantity).toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 8),
        InkResponse(
          onTap: () {
            // cartViewModel.removeFromCart(cartItem);
          },
          child: Image.asset(AppImage.removeIcon, width: 30, height: 30),
        ),
      ],
    ),
  );
}
