import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/components/favourite_grid.dart';
import 'package:wallpaper_studio/components/hero_header.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final wallpapers = [
      'images/nature_images/nature_1.png',
      'images/nature_images/nature_2.png',
      'images/nature_images/nature_3.png',
      'images/nature_images/nature_4.png',
      'images/nature_images/nature_5.png',
      'images/nature_images/nature_6.png',
      'images/nature_images/nature_7.png',
      'images/nature_images/nature_8.png',
      'images/nature_images/nature_9.png',
      'images/nature_images/nature_10.png',
      'images/nature_images/nature_11.png',
      'images/nature_images/nature_12.png',
    ];

    return SingleChildScrollView(
      child: Container(
         width: double.infinity,
      padding: EdgeInsets.only(
        left: 47.0.w,
        right: 47.0.w,
        top: 52.63.h,
        bottom: 20.h,
      ),
        decoration: BoxDecoration(color: Color.fromRGBO(248, 248, 248, 1)),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 47.sp,
            ),
          child: Column(
            spacing: 50.sp,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gradient title
              HeroHeader(
                mainText: "Saved Wallpapers",
                subText: "Your saved wallpapers collection",
                grid: false,
                onTap: () {},
                gridActive: false,
                listActive: false,
              ),
              
              // Wallpapers Grid
              SizedBox(
                height:
                          MediaQuery.of(context).size.height *
                          0.7, 
                child: FavouriteGrid(wallpapers: wallpapers)),
            ],
          ),
        ),
      ),
    );
  }
}
