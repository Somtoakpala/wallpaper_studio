import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/components/category_card.dart';
import 'package:wallpaper_studio/components/models/category.dart';

class CategoriesGrid extends StatelessWidget {
  final List<Category> categories = const [
    Category('Nature', 'Mountains, Forest and Landscapes', 'images/wallpappers/nature.png', '3 wallpapers'),
    Category('Abstract', 'Modern Geometric and artistic designs', 'images/wallpappers/abstract.png', '4 wallpapers'),
    Category('Urban', 'Cities, architecture and street', 'images/wallpappers/urban.png', '6 wallpapers'),
    Category('Space', 'Cosmos, planets, and galaxies', 'images/wallpappers/space.png', '3 wallpapers'),
    Category('Minimalist', 'Clean, simple, and elegant', 'images/wallpappers/minimalist.png', '6 wallpapers'),
    Category('Animals', 'Wildlife and nature photography', 'images/wallpappers/animals.png', '4 wallpapers'),
  ];

  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 23.h,
        crossAxisSpacing: 18.w,
        childAspectRatio: 435.3333435058594 / 290.711669921875, // Original aspect ratio
      ),
      itemBuilder: (context, index) {
        final cat = categories[index];
        return CategoryCard(category: cat);
      },
    );
  }
}