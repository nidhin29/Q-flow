import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const AuthButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size(160.w, 47.h)),
        backgroundColor: WidgetStateProperty.all(Colors.black),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w400),
      ),
    );
  }
}
