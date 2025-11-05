import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionLabel;
  const SectionHeader({super.key, required this.title, required this.actionLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500, color: Colors.black87)),
        Text(actionLabel, style: TextStyle(color: Color.fromRGBO(128, 128, 128, 1), fontSize: 24.sp, fontWeight: FontWeight.w400),)
       
      ],
    );
  }
}
