import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/components/wallpaper_card.dart';

class FavouriteGrid extends StatelessWidget {
  const FavouriteGrid({super.key, required this.wallpapers});

  final List<String> wallpapers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 104.95.sp),
      child: GridView.builder(
        itemCount: wallpapers.length, // repeat to fill the grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          crossAxisSpacing: 20.sp,
          mainAxisSpacing: 23.sp,
          childAspectRatio: 0.654,
        ),
        itemBuilder: (context, index) {
          final img = wallpapers[index];
          return WallpaperCard(
            imagePath: img,
            title: "Nature ${index+1}",
            selected: true,
          );
        },
      ),
    );
  }
}
