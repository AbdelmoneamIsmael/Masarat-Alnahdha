import 'package:flutter/material.dart';
import '../../core/widgets/cashed_images.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({super.key, required this.image, required this.heroTag});
  final String image, heroTag;
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Hero(
          tag: heroTag,
        child: CachedImage(url: image, fit: BoxFit.contain)),
    );
  }
}
