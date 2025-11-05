import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WallpaperCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool selected;

  const WallpaperCard({
    super.key,
    required this.imagePath,
    required this.title,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.sp),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
          Positioned(
            left: 16.sp,
            bottom: 17.sp,
            child: Column(
              spacing: 4.sp,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 24.sp,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: 30.sp),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.sp,
                      vertical: 2.sp,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.2),
                      borderRadius: BorderRadius.circular(24.sp),
                    ),
                    child: Text(
                      "Nature",
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
          Positioned(
            top: 8,
            right: 10,
            child: Container(
              width: 40.sp,
              height: 40.sp,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.favorite,
                  color: selected ? Colors.orangeAccent : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
