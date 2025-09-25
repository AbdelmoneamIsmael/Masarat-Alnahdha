import 'package:masarat_alnahdha/core/models/product/product_model.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:masarat_alnahdha/core/widgets/ui_function.dart';
import 'package:masarat_alnahdha/core/widgets/product_widget_view.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_cubit.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productModel,
    this.onPressed,
    this.uinqueKey = '',
  });
  final String uinqueKey;
  final ProductModel productModel;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<AppCubit, AppState>(
    //   listener: (context, state) {
    //     // if (state is ToggleFavoriteSuccess) {
    //     //   ScaffoldMessenger.of(context)
    //     //     ..removeCurrentSnackBar()
    //     //     ..showSnackBar(const SnackBar(
    //     //       content: Text(
    //     //         'تم الاضافة للمفضلة',
    //     //         textAlign: TextAlign.center,
    //     //       ),
    //     //     ));
    //     // }
    //   },
    //   builder: (context, state) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          minimumSize: Size(0, 0),
          child:
              // productModel.discount != null && productModel.discount!.isNotEmpty
              ProductCardView(productModel: productModel, uinqueKey: uinqueKey),
          // : WithoutOfferView(
          //     productModel: productModel,
          //     uinqueKey: uinqueKey,
          //   ),
        );
      },
    );
    //   },
    // );
  }
}

class WithoutOfferView extends StatefulWidget {
  const WithoutOfferView({
    super.key,
    required this.productModel,
    required this.uinqueKey,
  });
  final String uinqueKey;
  final ProductModel productModel;

  @override
  State<WithoutOfferView> createState() => _WithoutOfferViewState();
}

class _WithoutOfferViewState extends State<WithoutOfferView> {
  bool isFavorite = false;
  @override
  void initState() {
    // isFavorite = widget.productModel.isFavorite!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Container(
          width: 180.w,
          margin: EdgeInsets.all(4),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [UiHelper.shadow(context)],
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 167.67 / 124,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r),
                      ),
                      child: Center(
                        child: Hero(
                          tag:
                              '${widget.productModel.productId}${widget.uinqueKey}',
                          child: CachedImage(url: widget.productModel.imageUrl),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => setState(() {
                        isFavorite = !isFavorite;
                        // if (BlocProvider.of<AppCubit>(context).userModel != null) {
                        //   isFavorite = !isFavorite;
                        //   BlocProvider.of<AppCubit>(context)
                        //       .toggleFavorite(widget.productModel.id!);
                        //   setState(() {});
                        // } else {
                        //   UIHelper.showSnakBar(
                        //       context: context,
                        //       message: 'يجب تسجيل الدخول اولا',
                        //       type: SnackBarType.warning);
                        // }
                      }),
                      minimumSize: Size(0, 0),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: isFavorite == true
                            ? Colors.red
                            : Color(0xFF667085),
                        child: const Icon(
                          Icons.favorite_border_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Text(
              //   widget.productModel.productname ?? '',
              //   style: Theme.of(
              //     context,
              //   ).textTheme.labelMedium!.copyWith(fontSize: 14.sp),
              // ),
              // Text(
              //   widget.productModel.discount?.isEmpty??true
              //       ? ''
              //       : widget.productModel.discount!,
              //   style: Theme.of(
              //     context,
              //   ).textTheme.displayMedium!.copyWith(fontSize: 12.sp),
              // ),
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
