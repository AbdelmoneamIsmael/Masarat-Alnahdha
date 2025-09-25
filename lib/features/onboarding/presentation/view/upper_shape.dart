import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpperShape extends StatelessWidget {
  const UpperShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -20,
      left: 0,
      right: 0,
      child: SvgPicture.asset(
        'assets/svgs/clip_container.svg',
        height: MediaQuery.of(context).size.height * .5,
      ),
    );
  }
}
