import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/payment_screen.dart';

class Dioscreen extends StatefulWidget {
  const Dioscreen({super.key});

  @override
  State<Dioscreen> createState() => _DioscreenState();
}

class _DioscreenState extends State<Dioscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 254, 255, 1),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
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
                    ).r,
                    child: Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15).w),
                        child: IconButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(249, 169, 77, 0.1))),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                                color: Color.fromRGBO(218, 99, 23, 1),
                                weight: 10.w,
                                Icons.arrow_back_ios_new_outlined))),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15).r,
                    child: Container(
                      height: 129.h,
                      width: 264.w,
                      child: ListTile(
                        title: Text(
                          'Fill in your bio to get started',
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
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 8).r,
                    child: Container(
                      width: 347.w,
                      height: 223.h,
                      child: Column(
                        children: [
                          Container(
                              width: 347.w,
                              height: 61.h,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'First Name',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15).w)),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8).r,
                            child: Container(
                                width: 347.w,
                                height: 61.h,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Last Name',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15).w)),
                                )),
                          ),
                          Container(
                              width: 347.w,
                              height: 61.h,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Mobile Number',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15).w)),
                              )),
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15).w),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(83, 232, 139, 1),
                          )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentScreen()));
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
                ],
              ),
            ],
          )),
    );
  }
}
