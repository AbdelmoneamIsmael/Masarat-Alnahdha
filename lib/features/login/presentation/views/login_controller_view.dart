import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:masarat_alnahdha/features/login/presentation/manager/login_cubit.dart';
import 'package:masarat_alnahdha/features/login/presentation/manager/login_state.dart';
import 'package:masarat_alnahdha/features/login/presentation/views/phone_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginControllerView extends StatelessWidget {
  const LoginControllerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return LiquidGlass(
          shape: LiquidRoundedSuperellipse(borderRadius: Radius.circular(10)),
          clipBehavior: Clip.antiAlias,
          settings: LiquidGlassSettings(lightness: 1, blur: 4),

          child: Column(
            children: [
              5.verticalSpace,
              // CustomTapContainer(
              //   child: CustomTapContainerButton(
              //     selectedIndex: BlocProvider.of<LoginCubit>(context).selectIndex,
              //     length: 2,

              //     tabTitles: ['📞 الهاتف المحمول', '✉ البريد الالكترونى'],
              //     onTap: (index) {
              //       context.read<LoginCubit>().changeTap(index: index);
              //       DefaultTabController.of(context).animateTo(index);
              //     },
              //   ),
              // ),
              33.verticalSpace,

              PhoneFields(),

              //needed to created
            ],
          ),
        );
      },
    );
  }
}
