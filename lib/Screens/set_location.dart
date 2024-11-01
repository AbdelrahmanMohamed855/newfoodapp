import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/signup_success.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 254, 255, 1),
      body: Stack(alignment: Alignment.topRight, children: [
        Positioned(
          child: Image.asset(
            'assets/Pattern (1).png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 38,
                left: 25,
              ),
              child: Container(
                  width: 45.w,
                  height: 45.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15).w),
                  child: IconButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(28, 249, 169, 77))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                          color: Color.fromRGBO(218, 99, 23, 1),
                          weight: 10.w,
                          Icons.arrow_back_ios_new_outlined))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 100, 15),
              child: Container(
                height: 129.h,
                width: 264.w,
                child: ListTile(
                  title: Text(
                    'Set Your Location ',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Color.fromRGBO(9, 5, 28, 1),
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    'This data will be displayed in your account profile for security',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 17, left: 17).r,
              child: Container(
                width: 342.w,
                height: 147.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(12, 26),
                          color: Color.fromRGBO(90, 108, 234, 0.07),
                          blurRadius: 50,
                          spreadRadius: 0)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(22).w),
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset(
                        'assets/Pin Logo.png',
                        width: 33.w,
                        height: 33.h,
                      ),
                      title: Text(
                        'Your Location',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 18.5.h,
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            blurRadius: 50,
                            spreadRadius: 0)
                      ], borderRadius: BorderRadius.circular(10).w),
                      width: 322.w,
                      height: 57.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15).w),
                            backgroundColor:
                                Color.fromRGBO(246, 246, 246, 0.399),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Set Location',
                            style: TextStyle(
                                color: Color.fromRGBO(9, 5, 28, 1),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          )),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 300.h,
            ),
            Center(
              child: Container(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupSuccess()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    )),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
