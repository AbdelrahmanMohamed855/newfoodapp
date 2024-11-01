import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/State_managment/cubit/chats_cubit.dart';
import 'package:new_food_app/State_managment/cubit/cubit/upload_photos_cubit.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<UploadPhotosCubit, UploadPhotosState>(
          builder: (context, state) {
            final appbloc = context.read<UploadPhotosCubit>();
            return Container(
              width: 375.w,
              height: 320.h,
              child: appbloc.imagegallery == null
                  ? Icon(
                      Icons.person,
                      size: 100,
                    )
                  : Image.file(
                      File(appbloc.imagegallery!.path),
                      fit: BoxFit.cover,
                    ),
            );
          },
        ),
        DraggableScrollableSheet(
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              width: 376.w,
              height: 762.h,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      ListTile(
                        title: Text(
                          'Anam Wusono',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        subtitle: BlocBuilder<ChatsCubit, ChatsState>(
                          builder: (context, state) {
                            final appbloc = context.read<ChatsCubit>();
                            return Text(
                                'email: ${appbloc.resolt1 != null ? appbloc.resolt1.toString() : null}');
                          },
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/Edit Icon.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22).w,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(12, 26),
                                  color: Color.fromRGBO(90, 108, 234, 0.07),
                                  blurRadius: 50,
                                  spreadRadius: 0)
                            ],
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        width: 347.w,
                        height: 64.h,
                        child: ListTile(
                          leading: Image.asset("assets/Voucher Icon.png"),
                          title: Text(
                            'You have 3 Vouchers',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // ListTile(
                      //   leading: Image.asset(''),
                      //   title: Text(''),
                      //   trailing: Text(''),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
