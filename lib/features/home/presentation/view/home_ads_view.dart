import 'package:masarat_alnahdha/core/widgets/cashed_images.dart';
import 'package:masarat_alnahdha/core/widgets/image_viewer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeAdsView extends StatelessWidget {
  const HomeAdsView({super.key});

  static const List images = [
    // 'categories/companies_directory/images/dd14.jpg',
    'https://masool.net/designs/afaq-store/assets/images/banner03.jpg',
    'https://masool.net/designs/afaq-store/assets/images/beauty_featured_products_banner_img.jpg',
    'https://masool.net/designs/afaq-store/assets/images/banner02.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: CarouselSlider(
          options: CarouselOptions(
            // height: 400.0,
            autoPlayCurve: Curves.easeIn,
            aspectRatio: 2.7,
            enlargeCenterPage: true,
            enlargeFactor: 0.25,
            enableInfiniteScroll: false,
            autoPlay: true,
            viewportFraction: .93, // increase image width
          ),
          items: (images).asMap().entries.map((data) {
            int index = data.key;
            var image = data.value;
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ImageViewer(image: image, heroTag: '$index');
                          },
                        ),
                      );
                    },
                    child: Hero(
                      tag: "$index",
                      child: CachedImage(url: image, fit: BoxFit.fill),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
