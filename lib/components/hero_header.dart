import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/components/gradient_text.dart';

class HeroHeader extends StatelessWidget {
  final String mainText;
  final String subText;
  final bool grid;
  final VoidCallback onTap;
  final bool gridActive;
  final bool listActive;

  const HeroHeader({
    super.key,
    required this.mainText,
    required this.subText,
    required this.grid,
    required this.onTap,
    required this.gridActive,
    required this.listActive,
  });

  @override
  Widget build(BuildContext context) {
      // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
   /*  final screenHeight = MediaQuery.of(context).size.height; */
    return Column(
      spacing: 8.sp,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gradient headline
        GradientText(
          mainText,
          style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w500, fontFamily: "Clash-Display", height: 1 ),
        ),
       
    
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Subtitle
            SizedBox(
              width: screenWidth*0.6,
              child: Text(
                subText,
                style: TextStyle(fontSize: 24.sp, color: Color(0xFF666666), height: 1),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
    
            // Show icons only if grid is true
            if (grid) ...[
              Spacer(),
              
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing:  12.sp,
                children: [
                  // Grid Icon
                  GestureDetector(
                    onTap: !gridActive ? onTap : () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: gridActive? Color(0xffEC9E0C1A).withValues(alpha: 0.1): Colors.transparent                  ),
                      height: 40.sp,
                      width: 40.sp,
                      child: Padding(
                        padding: const EdgeInsets.all(6.53),
                        child: Image.asset(
                          "images/icons/grid_icon.png",
                          height: 28.sp,
                          color: gridActive
                              ? const Color(0xffFFA821)
                              : Colors.black.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                  ),
                  
                  // List Icon
                  GestureDetector(
                    onTap: !listActive ? onTap : () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: listActive? Color(0xffEC9E0C1A).withValues(alpha: 0.1): Colors.transparent 
                      ),
                      height: 40.sp,
                      width: 40.sp,
                      child: Padding(
                        padding: const EdgeInsets.all(6.53),
                        child: Image.asset(
                          "images/icons/list_icon.png",
                         
                          color: listActive
                              ? const Color(0xFFFFA821)
                              : Colors.black.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ],
    );
  }
}
