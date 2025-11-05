import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/components/categories_grid.dart';
import 'package:wallpaper_studio/components/hero_header.dart';
import 'package:wallpaper_studio/components/section_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
      padding: EdgeInsets.only(
        left: 47.0.w,
        right: 47.0.w,
        top: 52.63.h,
        bottom: 20.h,
      ),
       
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroHeader(
              mainText: "Discover Beautiful Wallpapers",
              subText:
                  'Discover curated collections of stunning wallpapers. Browse by category, preview in full-screen, and set your favorites.',
              grid: false,
              onTap: () {},
              gridActive: false,
              listActive: false,
            ),
        SizedBox(height: 50.h),
            SectionHeader(title: 'Categories', actionLabel: 'See All'),
            SizedBox(height: 16.h),
            Container(
              height: 604.h,
              child: CategoriesGrid()),
          ],
        ),
      ),
    );
  }
}
