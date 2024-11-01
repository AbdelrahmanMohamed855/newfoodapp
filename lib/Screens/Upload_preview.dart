import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/set_location.dart';
import 'package:new_food_app/State_managment/cubit/cubit/upload_photos_cubit.dart';
import 'package:new_food_app/State_managment/cubit/foodshop_cubit.dart';

class UploadPreview extends StatefulWidget {
  const UploadPreview({super.key});

  @override
  State<UploadPreview> createState() => _UploadPreviewState();
}

class _UploadPreviewState extends State<UploadPreview> {
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
                                  const Color.fromRGBO(249, 168, 77, 1))),
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
                      style: ListTileStyle.list,
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
                Padding(
                    padding: const EdgeInsets.only(left: 65).r,
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(90, 108, 234, 0.07),
                                  blurRadius: 50,
                                  spreadRadius: 0)
                            ],
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(22).w),
                        width: 245.w,
                        height: 238.h,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: appbloc.imagegallery == null
                            ? Icon(
                                Icons.person,
                                size: 100,
                              )
                            : Image.file(
                                File(appbloc.imagegallery!.path),
                                fit: BoxFit.cover,
                              ))),
                SizedBox(
                  height: 150.h,
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
                                  builder: (context) => SetLocation()));
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
      },
    );
  }
}
