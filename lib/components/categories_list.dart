import 'package:flutter/material.dart';
import 'package:wallpaper_studio/components/category_card_list.dart';
import 'package:wallpaper_studio/components/models/category.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories = const [
    Category('Nature', 'Mountains, Forest and Landscapes', 'images/wallpappers/nature.png', '3 wallpapers'),
    Category('Abstract', 'Modern Geometric and artistic designs', 'images/wallpappers/abstract.png', '3 wallpapers'),
    Category('Urban', 'Cities, architecture and street', 'images/wallpappers/urban.png', '6 wallpapers'),
    Category('Space', 'Cosmos, planets, and galaxies', 'images/wallpappers/space.png', '3 wallpapers'),
    Category('Minimalist', 'Clean, simple, and elegant', 'images/wallpappers/minimalist.png', '3 wallpapers'),
    Category('Animals', 'Wildlife and nature photography', 'images/wallpappers/animals.png', '6 wallpapers'),
  ];

  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: categories.length,
      /* separatorBuilder: (context, index) => const Divider(height: 24, thickness: 0.5, color: Colors.grey), */
      itemBuilder: (context, index) {
        final cat = categories[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CategoryCardList(category: cat),
        );
      },
    );
  }
}
