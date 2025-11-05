import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/components/nav_button.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int pageIndex;
  final Function changeScreen;
  
  @override
  final Size preferredSize;

  CustomAppbar({
    super.key,
    required this.pageIndex,
    required this.changeScreen,
  }) : preferredSize =  Size.fromHeight(98.0.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Add background color and shadow here instead of AppBar
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 98.sp, // Match your preferred height
          padding: EdgeInsets.symmetric(horizontal: 45.sp), // Horizontal padding for both sides
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center, // This vertically centers the content
            children: [
              // Logo and Title Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("images/company_Logo.png"),
                  SizedBox(width: 8.sp), // Fixed: Use SizedBox instead of spacing
                  Text(
                    'Wallpaper Studio',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),

              // Navigation Buttons Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NavButton(
                    icon: "images/icons/home_icon.svg",
                    label: 'Home',
                    active: pageIndex == 0,
                    onpressed: () {
                      changeScreen(0);
                    },
                  ),
                  NavButton(
                    icon: "images/icons/browse_icon.svg",
                    label: 'Browse',
                    active: pageIndex == 1,
                    onpressed: () {
                      changeScreen(1);
                    },
                  ),
                  NavButton(
                    icon: "images/icons/favourite_icon.svg",
                    label: 'Favourites',
                    active: pageIndex == 2,
                    onpressed: () {
                      changeScreen(2);
                    },
                  ),
                  NavButton(
                    icon: "images/icons/settings_icon.svg",
                    label: 'Settings',
                    active: pageIndex == 3,
                    onpressed: () {
                      changeScreen(3);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}