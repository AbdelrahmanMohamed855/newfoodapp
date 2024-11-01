import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/State_managment/cubit/cubit/upload_photos_cubit.dart';

class FinishOrder extends StatefulWidget {
  const FinishOrder({super.key});

  @override
  State<FinishOrder> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FinishOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: Stack(alignment: Alignment.topCenter, children: [
          Positioned(
            child: Image.asset(
              'assets/Pattern (3).png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              BlocBuilder<UploadPhotosCubit, UploadPhotosState>(
                builder: (context, state) {
                  final appvloc = context.read<UploadPhotosCubit>();
                  return Padding(
                    padding: const EdgeInsets.only(top: 172).r,
                    child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: 172.w,
                        height: 161.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 5.w,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(83, 232, 139, 1)),
                        ),
                        child: appvloc.imagegallery == null
                            ? Icon(
                                Icons.person,
                                size: 100.sp,
                              )
                            : Image.file(
                                File(appvloc.imagegallery!.path),
                                fit: BoxFit.cover,
                              )),
                  );
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              ListTile(
                title: Text(
                  textAlign: TextAlign.center,
                  'Thank You!                       Order Completed',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      color: Color.fromRGBO(9, 5, 28, 1)),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 20).r,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Please rate your last Driver',
                    style: TextStyle(color: Color.fromRGBO(59, 59, 59, 1)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                alignment: Alignment.center,
                width: 253.67.w,
                height: 33.67.h,
                child: RatingBar.builder(
                  unratedColor: Color.fromRGBO(254, 171, 29, 0.2),
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Image.asset(
                    'assets/Star.png',
                    width: 31.67.w,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Container(
                width: 335.w,
                height: 55.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15).w,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                        style: BorderStyle.solid,
                        width: 1.w,
                        color: Color.fromRGBO(232, 232, 232, 1))),
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Color.fromRGBO(59, 59, 59, 0.5)),
                      hintText: ' Leave feedback',
                      focusColor: Color.fromRGBO(255, 255, 255, 1),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Image.asset('assets/edit Icon (1).png')),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 233.w,
                    height: 57.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15).w),
                            backgroundColor: Color.fromRGBO(83, 232, 139, 1)),
                        onPressed: () {},
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Color.fromRGBO(254, 254, 255, 1)),
                        )),
                  ),
                  Container(
                    width: 82.w,
                    height: 57.w,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: Offset(12, 26),
                          spreadRadius: 0,
                          blurRadius: 50,
                          color: Color.fromRGBO(90, 108, 234, 0.07))
                    ]),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15).w),
                            backgroundColor: Color.fromRGBO(255, 255, 255, 1)),
                        onPressed: () {},
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Color.fromRGBO(83, 232, 139, 1)),
                        )),
                  ),
                ],
              )
            ],
          )
        ]));
  }
}
