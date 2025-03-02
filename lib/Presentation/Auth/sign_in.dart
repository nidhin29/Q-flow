import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qflow/Presentation/Auth/sign_up.dart';
import 'package:qflow/Presentation/Home/mainscreen.dart';
import 'package:qflow/constants/const.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        children: [
          SizedBox(
            height: 87.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w),
            child: Text('Log In',
                style: TextStyle(
                    fontSize: 21.45.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          ),
          SizedBox(
            height: 124.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 32.w, right: 32.w),
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(9.84.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(9.84.r),
                    ),
                  ),
                ),
                kheight15,
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(9.84.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(9.84.r),
                    ),
                  ),
                ),
                kheight15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  ],
                ),
                kheight20,
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const MainScreen(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                            transitionDuration:
                                const Duration(microseconds: 700000)),
                      );
                    },
                    style: ButtonStyle(
                      minimumSize:
                          WidgetStateProperty.all(Size(346.w, 54.82.h)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.84.r),
                        side: const BorderSide(color: Colors.black),
                      )),
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                    child: Text('Continue',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black))),
                kheight20,
                kheight10,
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Color.fromRGBO(31, 31, 31, 1),
                        thickness: 1.5,
                        endIndent: 14,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(31, 31, 31, 1),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Color.fromRGBO(31, 31, 31, 1),
                        thickness: 1.5,
                        indent: 14,
                      ),
                    ),
                  ],
                ),
                kheight20,
                kheight10,
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      minimumSize:
                          WidgetStateProperty.all(Size(346.w, 54.82.h)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.84.r),
                        side: const BorderSide(color: Colors.black),
                      )),
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon/google.png',
                            width: 48.w, height: 33.h),
                        Text('Sign in with Google',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black))
                      ],
                    )),
                kheight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                        },
                        child: Text('Sign Up',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey)))
                  ],
                )
              ])),
        ],
      ),
    );
  }
}
