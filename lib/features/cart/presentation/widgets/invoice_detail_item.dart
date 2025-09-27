import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceDetailItem extends StatelessWidget {
  const InvoiceDetailItem({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(fontSize: 15.sp),
      ),
      trailing: Text(
        value,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(fontSize: 15.sp),
      ),
    );
  }
}
