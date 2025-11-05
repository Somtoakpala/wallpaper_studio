import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/components/hero_header.dart';
import 'package:wallpaper_studio/components/phone_mock.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String imageQuality = 'High (Best Quality)';
  bool notificationEnabled = true;
  bool connected = true;

  final List<String> qualities = [
    'Low (Faster Loading)',
    'Medium (Balanced)',
    'High (Best Quality)',
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 47.0.w,
        right: 47.0.w,
        top: 52.63.h,
        bottom: 20.h,
      ),

      child: Container(
        height: 782.h,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            HeroHeader(
              mainText: "Settings",
              subText: "Customize your Wallpaper Studio experience",
              grid: false,
              onTap: () {},
              gridActive: false,
              listActive: false,
            ),

            SizedBox(height: 50.h),
            // White Card Container
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 151.w),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // LEFT SIDE — SETTINGS FORM
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Container(
                          width: 569.w,
                          height: 399.h,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child: Column(
                            spacing: 26.h,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //top text
                              Column(
                                spacing: 8.h,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Wallpaper Setup",
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      height: 1.5.h,
                                    ),
                                  ),

                                  Text(
                                    "Configure your wallpaper settings and enable auto-rotation",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xFF666666),
                                      height: 1.h,
                                    ),
                                  ),
                                ],
                              ),

                              // Image Quality Dropdown
                              Container(
                                padding: EdgeInsets.all(20.r),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.sp,
                                    color: Color.fromRGBO(229, 229, 229, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Image Quality",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 1.h,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      height: 36.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          7.r,
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: imageQuality,
                                          isExpanded: true,
                                          items: qualities.map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                    156,
                                                    156,
                                                    156,
                                                    1,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              imageQuality = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Notification Switch
                              Container(
                                height: 92.h,
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.r,
                                  horizontal: 20.r,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.sp,
                                    color: Color.fromRGBO(229, 229, 229, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Notification",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),

                                          Spacer(),
                                          Container(
                                            height: 24.h,
                                            width: 40.w,
                                            child: Transform.scale(
                                              scale: 0.8.r,
                                              child: Switch(
                                                inactiveTrackColor: Colors.white,
                                                activeTrackColor:
                                                    Color.fromRGBO(
                                                      251,
                                                      176,
                                                      59,
                                                      1,
                                                    ),
                                                activeThumbColor:
                                                    const Color.fromRGBO(
                                                      255,
                                                      255,
                                                      255,
                                                      1,
                                                    ),
                                                trackOutlineColor:
                                                    WidgetStateProperty.all(
                                                      Color.fromRGBO(
                                                        255,
                                                        168,
                                                        33,
                                                        1,
                                                      ),
                                                    ),
                                                value: notificationEnabled,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    notificationEnabled = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      Text(
                                        "Get notified about new wallpapers and updates",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xFF666666),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Buttons Row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 200.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(223, 223, 223, 1),
                                      borderRadius: BorderRadius.circular(21.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Container(
                                    width: 200.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(251, 176, 59, 1),
                                      borderRadius: BorderRadius.circular(21.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Save Settings",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 80.w),

                    // RIGHT SIDE — DEVICE MOCKUP
                  /*   Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          width: 220.w,
                          height: 420.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40.r),
                            border: Border.all(color: Colors.grey.shade300),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 12.r,
                                offset: Offset(0, 4.h),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: connected
                                        ? const Color(0xffC9F8C5)
                                        : const Color(0xffFFD6D6),
                                    borderRadius: BorderRadius.circular(24.r),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        connected ? Icons.link : Icons.link_off,
                                        color: connected
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        connected
                                            ? "Connected to device"
                                            : "Not connected",
                                        style: TextStyle(
                                          color: connected
                                              ? Colors.green
                                              : Colors.red,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      connected = !connected;
                                    });
                                  },
                                  child: Text(
                                    connected
                                        ? "Click to disconnect"
                                        : "Click to connect",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ), */

                  /*   Expanded(
                      flex: 1,
                      child: Stack(
                        children: [CustomPaint(
                          painter: PhonePainter(),
                          size: Size(200.w, 400.h), 
                        ),
                        Positioned(
                          top:10,
                          bottom: 10,
                          left: 15,
                          right: 15,
                          child: Container(
                            
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        )
                      
                        ]
                      ),
                    ) */
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
