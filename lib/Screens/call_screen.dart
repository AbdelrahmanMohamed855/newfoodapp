import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/finish_order.dart';
import 'package:new_food_app/State_managment/cubit/cubit/upload_photos_cubit.dart';
import 'package:new_food_app/State_managment/cubit/foodshop_cubit.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool volume = false;
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
                    padding: const EdgeInsets.only(top: 200).r,
                    child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: 161.w,
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
                height: 40.h,
              ),
              Container(
                  alignment: Alignment.center,
                  height: 33.h,
                  width: 195.w,
                  child: Text(
                    'Courtney Henry',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        color: Color.fromRGBO(9, 5, 28, 1)),
                  )),
              SizedBox(
                height: 200.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 78.w,
                    height: 78.h,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(83, 232, 140, 0.119),
                        shape: BoxShape.circle),
                    child: volume
                        ? IconButton(
                            style: ButtonStyle(
                                iconColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(21, 190, 119, 1))),
                            onPressed: () {
                              setState(() {
                                volume = !volume;
                              });
                            },
                            icon: Icon(Icons.volume_up))
                        : IconButton(
                            style: ButtonStyle(
                                iconColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(21, 190, 119, 1))),
                            onPressed: () {
                              setState(() {
                                volume = !volume;
                              });
                            },
                            icon: Icon(Icons.volume_off)),
                  ),
                  Container(
                    width: 78.w,
                    height: 78.h,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 75, 75, 1),
                        shape: BoxShape.circle),
                    child: IconButton(
                        style: ButtonStyle(
                            iconColor: WidgetStatePropertyAll(
                                Color.fromRGBO(255, 255, 255, 1))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FinishOrder()));
                        },
                        icon: Icon(Icons.close, weight: 19.w)),
                  )
                ],
              )
            ],
          )
        ]));
  }
}
