import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_studio/components/categories_grid.dart';
import 'package:wallpaper_studio/components/categories_list.dart';
import 'package:wallpaper_studio/components/hero_header.dart';
import 'package:wallpaper_studio/provider_class/grid_notifier.dart';

class BrowserPage extends StatelessWidget {
  const BrowserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GridNotifier>(
      builder: (context, gridNotifier, child) {
        bool isGrid = gridNotifier.isGrid;
        bool isGridActive = gridNotifier.isGridActive;
        bool isListActive = gridNotifier.isListActive;

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
                  mainText: "Browse Category",
                  subText:
                      'Explore our curated collections of stunning wallpapers',
                  grid: true,
                  onTap: () {context.read<GridNotifier>().changeGrid();},
                  gridActive: isGridActive,
                  listActive: isListActive,
                  
                ),
                SizedBox(height: 50.h),
                SizedBox(height: 16.h),
            
                // Use consistent height for both grid and list
                SizedBox(
                  height: 604.h, // Same height as HomePage
                  child: isGrid ? CategoriesGrid() : CategoriesList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}