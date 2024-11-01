import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/Upload_preview.dart';
import 'package:new_food_app/State_managment/cubit/cubit/upload_photos_cubit.dart';
import 'package:new_food_app/State_managment/cubit/foodshop_cubit.dart';

import 'package:permission_handler/permission_handler.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadPhotosCubit, UploadPhotosState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final appbloc = context.read<UploadPhotosCubit>();
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
                  ).r,
                  child: Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15).w),
                      child: IconButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Color.fromARGB(24, 249, 169, 77))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                              color: Color.fromRGBO(218, 99, 23, 1),
                              weight: 10.w,
                              Icons.arrow_back_ios_new_outlined))),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15).r,
                  child: Container(
                    height: 129.h,
                    width: 264.w,
                    child: ListTile(
                      title: Text(
                        'Upload Your Photo Profile',
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
                InkWell(
                    onTap: () async {
                      PermissionStatus storage =
                          await Permission.photos.request();
                      if (storage == PermissionStatus.granted) {
                        appbloc.getLostData();
                      }
                      if (storage == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('this perission is recommended')));
                      }
                      if (storage == PermissionStatus.permanentlyDenied) {
                        openAppSettings();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25).r,
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
                        width: 325.w,
                        height: 129.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Gallery.png',
                              width: 50.w,
                              height: 50.h,
                            ),
                            Text(
                              'From Gallery',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                    onTap: () async {
                      PermissionStatus storage =
                          await Permission.photos.request();
                      if (storage == PermissionStatus.granted) {
                        appbloc.getcamera();
                      }
                      if (storage == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('this perission is recommended')));
                      }
                      if (storage == PermissionStatus.permanentlyDenied) {
                        openAppSettings();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
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
                        width: 325.w,
                        height: 129.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/camera.png',
                              width: 50.w,
                              height: 50.h,
                            ),
                            Text(
                              'Take Photo',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    )),
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
                                  builder: (context) => UploadPreview()));
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
          ]),
        );
      },
    );
  }
}
