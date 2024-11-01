import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:new_food_app/Screens/chat_details.dart';
import 'package:new_food_app/State_managment/cubit/chats_cubit.dart';
import 'package:new_food_app/State_managment/cubit/foodshop_cubit.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      Positioned(
        child: Image.asset(
          'assets/Pattern (1).png',
          fit: BoxFit.cover,
        ),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 25).r,
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
        BlocBuilder<ChatsCubit, ChatsState>(
          builder: (context, state) {
            final appbloc = context.read<ChatsCubit>();
            return Padding(
              padding: const EdgeInsets.only(left: 20).r,
              child: Container(
                height: 301.h,
                width: 323.w,
                child: ListView.builder(
                    itemCount: appbloc.service.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15).r,
                        child: Center(
                          child: Container(
                            height: 87.h,
                            width: 323.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22).w,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(90, 108, 234, 0.07),
                                      blurRadius: 50,
                                      spreadRadius: 0)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10).r,
                              child: ListTile(
                                leading: Image.asset(
                                    appbloc.service[index]['image']),
                                title: Text(appbloc.service[index]['title']),
                                trailing: Text(
                                    appbloc.service[index]['time'].toString()),
                                subtitle: Text(appbloc.chat.text),
                                onTap: () {
                                  if (appbloc.service[index] ==
                                      appbloc.service[0]) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChatDetails()));
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            );
          },
        )
      ])
    ]);
  }
}
