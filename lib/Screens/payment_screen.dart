import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/upload_photo.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 38,
                left: 25,
              ).w,
              child: Container(
                  width: 45.w,
                  height: 45.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15).w),
                  child: IconButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(33, 249, 169, 77))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                          color: Color.fromRGBO(218, 99, 23, 1),
                          weight: 10.w,
                          Icons.arrow_back_ios_new_outlined))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 25, bottom: 30).r,
              child: Container(
                height: 97.h,
                width: 264.w,
                child: ListTile(
                  title: Text(
                    'Payment Method',
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
              padding: const EdgeInsets.only(left: 20, right: 20).r,
              child: Container(
                width: 335.w,
                height: 256.h,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8).w,
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(90, 108, 234, 0.07),
                                    blurRadius: 50,
                                    spreadRadius: 0)
                              ],
                              color: Color.fromRGBO(254, 254, 255, 1),
                              borderRadius: BorderRadius.circular(22).w),
                          width: 335.w,
                          height: 73.h,
                          child: Image.asset('assets/paypal-2 (1) 1.png'),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(12, 26),
                                    color: Color.fromRGBO(90, 108, 234, 0.07),
                                    blurRadius: 50,
                                    spreadRadius: 0)
                              ],
                              color: Color.fromRGBO(254, 254, 255, 1),
                              borderRadius: BorderRadius.circular(22).w),
                          width: 335.w,
                          height: 73.h,
                          child: Image.asset('assets/visa (1) 1.png'),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(12, 26),
                                  color: Color.fromRGBO(90, 108, 234, 0.07),
                                  blurRadius: 50,
                                  spreadRadius: 0)
                            ],
                            color: Color.fromRGBO(254, 254, 255, 1),
                            borderRadius: BorderRadius.circular(22).w),
                        width: 335.w,
                        height: 73.h,
                        child: Image.asset('assets/Payoneer_logo 1.png'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200.h,
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
                              builder: (context) => UploadPhoto()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    )),
              ),
            ),
          ]),
        ]));
  }
}
