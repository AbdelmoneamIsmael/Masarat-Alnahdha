import 'package:masarat_alnahdha/core/themes/colors/colors.dart';
import 'package:masarat_alnahdha/core/widgets/marquee_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedProductItem extends StatelessWidget {
  const RelatedProductItem({
    super.key,
    required this.title,
    required this.image,
  });
  final String title, image;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        height: 120.h,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: LightColors.redColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const Icon(Icons.delete, color: Colors.white),
            const SizedBox(width: 10),
            Text("حذف", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
      key: UniqueKey(),
      child: AspectRatio(
        aspectRatio: 325 / 100,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              RelatedProductItemImageSection(image: image),
              const SizedBox(width: 10),
              RelatedProductItemDetailsSection(name: title),
              const RelatedProductItemOperationSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class RelatedProductItemOperationSection extends StatelessWidget {
  const RelatedProductItemOperationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 30,
          decoration: BoxDecoration(
            color: LightColors.purple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.add, size: 10),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RelatedProductItemDetailsSection extends StatelessWidget {
  const RelatedProductItemDetailsSection({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MarqueeTextWidget(
            textDirection: TextDirection.rtl,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text("(100ml)", style: Theme.of(context).textTheme.bodySmall),
                5.horizontalSpace,
                Text(name, style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          ),
          5.verticalSpace,
          Text("الكمية : 1", style: Theme.of(context).textTheme.bodyMedium),
          5.verticalSpace,
          Text("120 د.ع", style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}

class RelatedProductItemImageSection extends StatelessWidget {
  const RelatedProductItemImageSection({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
