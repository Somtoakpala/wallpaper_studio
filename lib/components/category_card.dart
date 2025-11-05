import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/components/custom_gradient_border.dart';
import 'package:wallpaper_studio/components/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            category.image,
            fit: BoxFit.cover,
            errorBuilder: (c, e, s) {
              return Container(color: Colors.grey[300]);
            },
          ),
          // Text content
          Padding(
            padding: EdgeInsets.all(20.0.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  category.subtitle,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                GradientBorderBox(
                  borderWidth: 0.5,
                  borderRadius:20.r ,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(255, 255, 255, 1),
                    Color.fromRGBO(207, 207, 207, 0),
                    Color.fromRGBO(238, 238, 238, 0),
                    Color.fromRGBO(255, 255, 255, 1),
                  ]),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.2),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(width: 0.5, color: Colors.transparent),
                    ),
                  
                    child: Text(
                      category.badge,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}