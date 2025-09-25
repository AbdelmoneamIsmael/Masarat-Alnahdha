import 'package:masarat_alnahdha/features/profile_page/presentation/widgets/account_card.dart';
import 'package:flutter/material.dart';

class AccountDetailsView extends StatelessWidget {
  const AccountDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AccountCard(
              // userInfoModel: BlocProvider.of<AppCubit>(context).userModel,
              onEditTap: () {
                // GoRouter.of(context).push(PagesKeys.editAccountDetailsScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
