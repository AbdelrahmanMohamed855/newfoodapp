import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/home_screen.dart';
import 'package:new_food_app/Screens/screens.dart';

class SignupSuccess extends StatefulWidget {
  const SignupSuccess({super.key});

  @override
  State<SignupSuccess> createState() => _SignupSuccessState();
}

class _SignupSuccessState extends State<SignupSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 254, 255, 1),
      body: Stack(alignment: Alignment.topCenter, children: [
        Positioned(
          child: Image.asset(
            'assets/Pattern.png',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200).r,
                child: Image.asset(
                  'assets/Illustration.png',
                  width: 172.w,
                  height: 162.h,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10).r,
                child: Container(
                  height: 81.h,
                  width: 312.w,
                  child: Column(
                    children: [
                      Text(
                        'Congrats!',
                        style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(83, 232, 139, 1)),
                      ),
                      Text(
                        'Your Profile Is Ready To Use',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(9, 5, 28, 1)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200.h,
              ),
              Container(
                width: 157.w,
                height: 57.h,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15).w),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(83, 232, 139, 1),
                    )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screens()));
                    },
                    child: Text(
                      'Try Order',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    )),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
