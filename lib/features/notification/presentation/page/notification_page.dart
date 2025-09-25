import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/themes/styles/app_text_style.dart';
import 'package:masarat_alnahdha/core/widgets/custom_app_bar.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(
        title: 'الاشعارات',
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(13),
          child: Image.asset(AppImage.dividerImage),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => NotificationItem(
          notificationTime: ' 05:00 - 05:30 pm',
          notificationDate: '20/06/2024',
          title: 'يتم استبدال النص هنا بصيغة الإشعارs',
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notificationTime,
    required this.notificationDate,
    required this.title,
  });
  final String notificationTime, notificationDate, title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 16),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12),
          child: Row(
            children: [
              Image.asset(AppImage.logo, width: 50.w, height: 50.h),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.bold14h24(
                      context,
                    ).copyWith(fontSize: 12),
                  ),
                  12.verticalSpace,
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppImage.callender),
                          4.horizontalSpace,
                          Text(
                            notificationDate,
                            style: AppTextStyle.regular12(context),
                          ),
                        ],
                      ),
                      16.horizontalSpace,
                      Row(
                        children: [
                          Image.asset(AppImage.clock),
                          4.horizontalSpace,
                          Text(
                            notificationTime,
                            style: AppTextStyle.regular12(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
