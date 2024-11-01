import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/home_screen.dart';
import 'package:new_food_app/Screens/signup_screen.dart';
import 'package:new_food_app/State_managment/cubit/chats_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 254, 255, 1),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(alignment: Alignment.topCenter, children: [
          Positioned(
            child: Image.asset(
              'assets/Pattern.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 47).r,
                  child: Image.asset(
                    'assets/Logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 79).w,
                  child: Container(
                    width: 400.w,
                    child: Text(
                      'Login To Your Account',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: BlocBuilder<ChatsCubit, ChatsState>(
                          builder: (context, state) {
                            final appbloc = context.read<ChatsCubit>();
                            return Container(
                                width: 325.w,
                                height: 57.h,
                                child: TextField(
                                  controller: appbloc.email,
                                  decoration: InputDecoration(
                                      hintText: 'Enter your Email',
                                      labelText: 'Email',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15).w)),
                                ));
                          },
                        ),
                      ),
                      Container(
                          width: 325.w,
                          height: 57.h,
                          child: BlocBuilder<ChatsCubit, ChatsState>(
                            builder: (context, state) {
                              final appbloc = context.read<ChatsCubit>();
                              return TextField(
                                  controller: appbloc.password,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15).w,
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(
                                                244, 244, 244, 1))),
                                    hintText: 'Enter your Password',
                                    labelText: 'Password',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ));
                            },
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                    width: 102.w,
                    height: 20.h,
                    child: Text(
                      'Or Continue with',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 30, 15, 30),
                      child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0,
                                  offset: Offset(12, 26),
                                  blurRadius: 50,
                                  color: Color.fromRGBO(90, 108, 234, 0.07))
                            ],
                          ),
                          width: 152.w,
                          height: 57.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      style: BorderStyle.solid,
                                      width: 1.w,
                                      color: Color.fromRGBO(244, 244, 244, 1)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15).w),
                                  backgroundColor:
                                      Color.fromRGBO(254, 254, 255, 1)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/facebook-3 1.png',
                                    width: 25.w,
                                    height: 25.h,
                                  ),
                                  Text(
                                    'Facebook',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  )
                                ],
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
                      child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0,
                                  offset: Offset(12, 26),
                                  blurRadius: 50,
                                  color: Color.fromRGBO(90, 108, 234, 0.07))
                            ],
                          ),
                          width: 152.w,
                          height: 57.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      style: BorderStyle.solid,
                                      width: 1.w,
                                      color: Color.fromRGBO(244, 244, 244, 1)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15).w),
                                  backgroundColor:
                                      Color.fromRGBO(254, 254, 255, 1)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/google-icon 1.png',
                                    width: 24.4.w,
                                    height: 25.h,
                                  ),
                                  Text(
                                    'Google',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  )
                                ],
                              ))),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Your Password?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromRGBO(83, 232, 139, 1),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(83, 232, 139, 1)),
                    )),
                BlocConsumer<ChatsCubit, ChatsState>(
                  listener: (context, state) {
                    if (state is save) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    }
                  },
                  builder: (context, state) {
                    final appbloc = context.read<ChatsCubit>();
                    return Container(
                      width: 141.w,
                      height: 57.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15).w),
                              backgroundColor: Color.fromRGBO(83, 232, 139, 1)),
                          onPressed: () {
                            appbloc.savedata();
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(255, 255, 255, 1)),
                          )),
                    );
                  },
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
