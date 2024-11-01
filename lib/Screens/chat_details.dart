import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/call_screen.dart';
import 'package:new_food_app/State_managment/cubit/chats_cubit.dart';
import 'package:new_food_app/State_managment/cubit/cubit/upload_photos_cubit.dart';
import 'package:new_food_app/State_managment/cubit/foodshop_cubit.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 254, 255, 1),
      body: Stack(alignment: Alignment.topCenter, children: [
        Positioned(
          child: Image.asset(
            'assets/Pattern (3).png',
            fit: BoxFit.cover,
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                            Color.fromARGB(34, 249, 169, 77))),
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
            padding: const EdgeInsets.only(left: 25).r,
            child: Container(
                width: 59.w,
                height: 33.h,
                child: Text(
                  'Chat',
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(9, 5, 28, 1)),
                )),
          ),
          SizedBox(
            height: 35.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15).w,
            child: Container(
              width: 347.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(25).w,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.1),
                      blurRadius: 50,
                      spreadRadius: 0)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10).r,
                child: ListTile(
                  leading: Image.asset('assets/Photo Profile.png'),
                  title: Text('Dianne Russell'),
                  trailing: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(83, 232, 140, 0.133)),
                      width: 40.w,
                      height: 40.h,
                      child: IconButton(
                          style: ButtonStyle(
                              iconColor: WidgetStatePropertyAll(
                                  Color.fromRGBO(21, 190, 119, 1))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CallScreen()));
                          },
                          icon: Icon(Icons.call))),
                ),
              ),
            ),
          ),
          BlocBuilder<ChatsCubit, ChatsState>(
            builder: (context, state) {
              final appbloc = context.read<ChatsCubit>();
              return Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: appbloc.chats.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 23, bottom: 10).r,
                        child: Align(
                          alignment: index % 2 == 0
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? Color.fromRGBO(246, 246, 246, 1)
                                    : Color.fromRGBO(83, 232, 139, 1)),
                            child: Text(
                              appbloc.chats[index],
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: index % 2 == 0
                                      ? Color.fromRGBO(24, 24, 24, 1)
                                      : Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            },
          ),
          BlocBuilder<ChatsCubit, ChatsState>(
            builder: (context, state) {
              final appbloc = context.read<ChatsCubit>();
              return Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10).r,
                child: Container(
                  width: 355.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(22).w,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(90, 108, 234, 0.1),
                            blurRadius: 50,
                            spreadRadius: 0)
                      ]),
                  child: TextField(
                    controller: appbloc.chat,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                appbloc.chatlink();
                              });
                            },
                            icon: Icon(Icons.send_outlined))),
                  ),
                ),
              );
            },
          ),
        ]),
      ]),
    );
  }
}
