import 'package:flutter_svg/svg.dart';
import 'package:masarat_alnahdha/core/models/product/product_model.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:masarat_alnahdha/core/widgets/marquee_text_widget.dart';
import 'package:masarat_alnahdha/core/widgets/ui_function.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_cubit.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masarat_alnahdha/gen/assets.gen.dart';

class ProductCardView extends StatefulWidget {
  const ProductCardView({
    super.key,
    required this.productModel,
    required this.uinqueKey,
  });

  final ProductModel productModel;
  final String uinqueKey;
  @override
  State<ProductCardView> createState() => _ProductCardViewState();
}

class _ProductCardViewState extends State<ProductCardView> {
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.all(4),
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _ProductImageHeader(
                  imageUrl: widget.productModel.imageUrl,
                  heroTag:
                      '${widget.productModel.productId}${widget.uinqueKey}',
                  discountText: widget.productModel.discount ?? "",
                  isFavorite: isFavorite,
                  onToggleFavorite: () =>
                      setState(() => isFavorite = !isFavorite),
                ),
              ),
              8.verticalSpace,
              ProductCartDetails(productModel: widget.productModel),
              10.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}

class _ProductImageHeader extends StatelessWidget {
  const _ProductImageHeader({
    required this.imageUrl,
    required this.heroTag,
    required this.discountText,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  final String imageUrl;
  final String heroTag;
  final String discountText;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 167.67 / 124,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(15.r),
              topStart: Radius.circular(15.r),
            ),
            child: Center(
              child: imageUrl.startsWith("assets")
                  ? Image.asset(imageUrl)
                  : CachedImage(url: imageUrl),
            ),
          ),

          // طبقة تدرج خفيفة لتحسين تباين العناصر فوق الصورة
          Positioned(
            top: 10,
            left: 10,
            child: Column(
              spacing: 10,
              children: [
                _AddToCartShip(),
                _DiscountChip(text: discountText),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: onToggleFavorite,
              minimumSize: Size(0, 0),
              child: _FavoriteButton(isActive: isFavorite),
            ),
          ),
        ],
      ),
    );
  }
}

// شارة خصم حديثة بشكل كبسولة
class _DiscountChip extends StatelessWidget {
  const _DiscountChip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.92),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Colors.black,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// شارة خصم حديثة بشكل كبسولة
class _AddToCartShip extends StatelessWidget {
  const _AddToCartShip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SvgPicture.asset(
        Assets.svgs.cart,
        width: 20,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}

// زر مفضلة حديث مع ظل خفيف
class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.red
            : Theme.of(context).colorScheme.surface.withValues(alpha: 0.92),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(
        Icons.favorite_border_outlined,
        size: 16,
        color: Colors.white,
      ),
    );
  }
}

class ProductCartDetails extends StatefulWidget {
  const ProductCartDetails({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  State<ProductCartDetails> createState() => _ProductCartDetailsState();
}

class _ProductCartDetailsState extends State<ProductCartDetails> {
  final GlobalKey widgetKey = GlobalKey();
  int addedNum = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        // final layoutCubit = BlocProvider.of<LayoutCubit>(context);
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              UiHelper.shadow(context).copyWith(offset: Offset(-2, 5)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: MarqueeTextWidget(
                        child: Text(
                          widget.productModel.name,
                          // اسم المنتج بخط أوضح
                          style: AppTextStyle.bold14h24(
                            context,
                          ).copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                    5.horizontalSpace,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // سعر قبل الخصم (إن وجد)
                        3.verticalSpace,
                        if (widget.productModel.discount != null &&
                            widget.productModel.discount!.isNotEmpty)
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.productModel.price.toString(),
                                  style: AppTextStyle.bold14h24(context)
                                      .copyWith(
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough,
                                        decorationThickness: 2,
                                        decorationColor: Colors.black,
                                      ),
                                ),
                                TextSpan(
                                  text: '  جم ',
                                  style: AppTextStyle.bold14h24(context)
                                      .copyWith(
                                        fontSize: 12,
                                        decoration: TextDecoration.lineThrough,
                                        decorationThickness: 2,
                                        decorationColor: Colors.black,
                                      ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                // السعر الحالي
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.productModel.price.toString(),
                        style: AppTextStyle.bold16(
                          context,
                        ).copyWith(color: Colors.red),
                      ),
                      TextSpan(
                        text: '  جم ',
                        style: AppTextStyle.bold14h24(context),
                      ),
                    ],
                  ),
                ),
                8.verticalSpace,

                SizedBox(height: 4),
                Text(
                  widget.productModel.description ?? "",
                  style: AppTextStyle.regular12(context).copyWith(
                    fontSize: 10.sp,
                    height: 1.5,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

// // زر صغير دائري للكمية
// class _QtyButton extends StatelessWidget {
//   const _QtyButton({required this.icon});

//   final IconData icon;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 32,
//       height: 32,
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.surface,
//         shape: BoxShape.circle,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 8,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Icon(icon, color: Colors.white, size: 16),
//     );
//   }
// }
