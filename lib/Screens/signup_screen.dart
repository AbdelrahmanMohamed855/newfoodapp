import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/bio_screen.dart';
import 'package:new_food_app/Screens/login_screen.dart';
import 'package:new_food_app/State_managment/cubit/foodshop_cubit.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool checksigned = false;
  bool checkemail = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodshopCubit, FoodshopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final appbloc = context.read<FoodshopCubit>();
        return Scaffold(
          backgroundColor: Color.fromRGBO(254, 254, 255, 1),
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  child: Image.asset(
                    'assets/Pattern.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 49).r,
                        child: Image.asset(
                          'assets/Logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 107).w,
                        child: Text(
                          'Sign Up For Free ',
                          style: TextStyle(
                              color: Color.fromRGBO(9, 5, 28, 1),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8).r,
                              child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(12, 26),
                                            color: Color.fromRGBO(
                                                90, 108, 234, 0.07),
                                            blurRadius: 50,
                                            spreadRadius: 0)
                                      ],
                                      color: Color.fromRGBO(254, 254, 255, 1),
                                      borderRadius:
                                          BorderRadius.circular(22).w),
                                  width: 325.w,
                                  height: 57.h,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Image.asset(
                                          'assets/Profile.png',
                                          width: 24.w,
                                          height: 24.h,
                                          color:
                                              Color.fromRGBO(83, 232, 139, 1),
                                        ),
                                        hintText: 'Enter your name',
                                        labelText: 'Name',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15).w)),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8).r,
                              child: Container(
                                  width: 325.w,
                                  height: 57.h,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(12, 26),
                                          color: Color.fromRGBO(
                                              90, 108, 234, 0.07),
                                          blurRadius: 50,
                                          spreadRadius: 0)
                                    ],
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Image.asset(
                                          'assets/Message.png',
                                          width: 24.w,
                                          height: 24.h,
                                        ),
                                        hintText: 'Enter your email',
                                        labelText: 'Email',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15).w)),
                                  )),
                            ),
                            Container(
                                width: 325.w,
                                height: 57.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(12, 26),
                                        color:
                                            Color.fromRGBO(90, 108, 234, 0.07),
                                        blurRadius: 50,
                                        spreadRadius: 0)
                                  ],
                                ),
                                child: TextField(
                                  obscureText: appbloc.hidden,
                                  decoration: InputDecoration(
                                      prefixIcon: Image.asset(
                                        'assets/Lock.png',
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                      hintText: 'Enter your password',
                                      labelText: 'password',
                                      suffixIcon: appbloc.hidden
                                          ? IconButton(
                                              color: Colors.grey.shade400,
                                              onPressed: () {
                                                appbloc.hiddenpass();
                                              },
                                              icon: Icon(Icons
                                                  .visibility_off_outlined))
                                          : IconButton(
                                              color: Colors.grey.shade400,
                                              onPressed: () {
                                                appbloc.hiddenpass();
                                              },
                                              icon: Icon(
                                                  Icons.visibility_outlined)),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15).w)),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25).r,
                        child: ListTile(
                          leading: Container(
                            height: 22.h,
                            width: 22.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(12, 26),
                                    color: Color.fromRGBO(90, 108, 234, 0.07),
                                    blurRadius: 50,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: Checkbox(
                                activeColor: Color.fromRGBO(83, 232, 139, 1),
                                shape: CircleBorder(
                                    side: BorderSide(
                                        width: 1.w,
                                        style: BorderStyle.solid,
                                        color:
                                            Color.fromRGBO(244, 244, 244, 1))),
                                value: checksigned,
                                onChanged: (value) {
                                  setState(() {
                                    checksigned = value!;
                                  });
                                }),
                          ),
                          title: Text(
                            'Keep Me Signed In',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25).r,
                        child: ListTile(
                          leading: Container(
                            height: 22.h,
                            width: 22.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(12, 26),
                                    color: Color.fromRGBO(90, 108, 234, 0.07),
                                    blurRadius: 50,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: Checkbox(
                                activeColor:
                                    Color.fromRGBO(21, 190, 120, 0.742),
                                shape: CircleBorder(
                                    side: BorderSide(
                                        width: 1.w,
                                        style: BorderStyle.solid,
                                        color:
                                            Color.fromRGBO(244, 244, 244, 1))),
                                value: checkemail,
                                onChanged: (value) {
                                  setState(() {
                                    checkemail = value!;
                                  });
                                }),
                          ),
                          title: Text(
                            'Email Me About Special Pricing',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        width: 175.w,
                        height: 57.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15).w),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(83, 232, 139, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15).w)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dioscreen()));
                            },
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            )),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            'already have an account?',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    const Color.fromRGBO(83, 232, 139, 1),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(83, 232, 139, 1)),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
