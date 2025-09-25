import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/models/product/product_model.dart';
import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_cubit.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeItemButton extends StatefulWidget {
  const HomeItemButton({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  State<HomeItemButton> createState() => _HomeItemButtonState();
}

class _HomeItemButtonState extends State<HomeItemButton> {
  final GlobalKey widgetKey = GlobalKey();
  int addedNum = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        final layoutCubit = BlocProvider.of<LayoutCubit>(context);
        return CupertinoButton(
          onPressed: () {
            // widget.onClick(BlocProvider.of<LayoutCubit>(context).widgetKey);
            layoutCubit.listClick(widgetKey);
            setState(() {
              addedNum++;
            });
          },
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 600),
            height: 31,
            width: double.infinity,
            decoration: BoxDecoration(
              color: addedNum == 0
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(
                      context,
                    ).colorScheme.surface.withValues(alpha: .15),
              borderRadius: BorderRadiusDirectional.circular(6),
            ),
            child: addedNum == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined, color: Colors.white),
                      8.horizontalSpace,
                      Text(
                        'اضافة الى السلة',
                        style: Theme.of(context).textTheme.displayMedium!
                            .copyWith(color: Colors.white, fontSize: 12.sp),
                      ),
                      8.horizontalSpace,
                      Container(
                        key: widgetKey,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: OvalBorder(),
                        ),
                        child: CachedImage(
                          url: widget.productModel.imageUrl,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkResponse(
                        onTap: () {
                          setState(() {
                            addedNum++;
                          });
                        },
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.surface,
                          child: Icon(Icons.add, color: Colors.white, size: 16),
                        ),
                      ),
                      Spacer(),
                      Text(
                        addedNum.toString(),
                        // (cartItem.itemQuantity).toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      InkResponse(
                        onTap: () {
                          setState(() {
                            addedNum--;
                          });
                        },
                        child: Image.asset(
                          AppImage.removeIcon,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
