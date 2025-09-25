import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/widgets/primary_button.dart';
import 'package:masarat_alnahdha/features/cart/presentation/widgets/related_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedProductPage extends StatelessWidget {
  const RelatedProductPage({super.key});
  static const List<String> cartItems = [
    "assets/images/cart_item1.png",
    "assets/images/cart_item2.png",
    "assets/images/cart_item3.png",
    "assets/images/cart_item1.png",
    "assets/images/cart_item2.png",
    "assets/images/cart_item3.png",
    "assets/images/cart_item1.png",
    "assets/images/cart_item2.png",
    "assets/images/cart_item3.png",
    "assets/images/cart_item1.png",
    "assets/images/cart_item2.png",
    "assets/images/cart_item3.png",
    "assets/images/cart_item1.png",
    "assets/images/cart_item2.png",
    "assets/images/cart_item3.png",
    "assets/images/cart_item1.png",
    "assets/images/cart_item2.png",
    "assets/images/cart_item3.png",
    "assets/images/cart_item1.png",
    "assets/images/cart_item2.png",
    "assets/images/cart_item3.png",
  ];
  static const List<String> cartTitles = [
    "Blue Diamond",
    "Sauvage",
    "OveRose",
    "Blue Diamond",
    "Sauvage",
    "OveRose",
    "Blue Diamond",
    "Sauvage",
    "OveRose",
    "Blue Diamond",
    "Sauvage",
    "OveRose",
    "Blue Diamond",
    "Sauvage",
    "OveRose",
    "Blue Diamond",
    "Sauvage",
    "OveRose",
    "Blue Diamond",
    "Sauvage",
    "OveRose",
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(20).copyWith(bottom: 70),
          decoration: ShapeDecoration(
            color: LightColors.forGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    Text(
                      'منتجات ذات صلة',
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(fontSize: 16),
                    ),
                    ...cartTitles.asMap().entries.map((entry) {
                      final index = entry.key;
                      // final title = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: RelatedProductItem(
                          title: cartTitles[index],
                          image: cartItems[index],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
        const RelatedProductPageSkipButton(),
      ],
    );
  }
}

class RelatedProductPageSkipButton extends StatelessWidget {
  const RelatedProductPageSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.all(20).copyWith(bottom: 70),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: ShapeDecoration(
          color: LightColors.forGroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: UnconstrainedBox(
          child: PrimaryButton(
            textColor: Theme.of(context).textTheme.bodyMedium?.color,
            backgroundColor: Theme.of(context).colorScheme.primary,
            text: 'تخطى',
            // width: 130,
            onPressed: () {
              // GoRouter.of(context).push(PagesKeys.paymentMethodPage);
            },
          ),
        ),
      ),
    );
  }
}
