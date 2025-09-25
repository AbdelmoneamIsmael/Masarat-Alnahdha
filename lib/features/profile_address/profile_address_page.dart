import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/widgets/custom_app_bar.dart';
import 'package:masarat_alnahdha/core/widgets/primary_button.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';

class ProfileAddressPage extends StatelessWidget {
  const ProfileAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(
        title: 'إضافة عنوان',
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(13),
          child: Image.asset(AppImage.dividerImage),
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          isMax: true,
          text: ' 📌 إضافة عنوان جديد',
          onPressed: () {},
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ).copyWith(top: 16),
          child: Image.asset(
            'assets/images/addressItem.png',
            width: double.infinity,
            height: 176,
          ),
        ),
      ),
    );
  }
}
