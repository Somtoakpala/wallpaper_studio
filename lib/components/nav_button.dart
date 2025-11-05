import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool active;
  final VoidCallback onpressed;
  
  const NavButton({
    super.key,
    required this.icon,
    required this.label,
    this.active = false,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.0.sp),
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          height: 44.sp,
          decoration: BoxDecoration(
            color: active
                ? const Color.fromRGBO(245, 245, 245, 1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12.sp),
            border: active // FIXED: Use ternary operator instead of if statement
                ? Border.all(
                    width: 1.sp, 
                    color: const Color.fromRGBO(0, 0, 0, 0.1),
                  )
                : null,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10.sp,
                children: [

                  SizedBox(
                    width: 24.sp,
                    height: 24.sp,
                    child: SvgPicture.asset(
                      icon,
                      colorFilter: ColorFilter.mode(
                        active
                            ? const Color.fromRGBO(0, 0, 0, 1)
                            : const Color.fromRGBO(0, 0, 0, 0.5),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
               
                  Text(
                    label,
                    style: TextStyle(
                      color: active
                          ? const Color.fromRGBO(0, 0, 0, 1)
                          : const Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}