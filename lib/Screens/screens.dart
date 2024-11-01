import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:new_food_app/Screens/home_screen.dart';
import 'package:new_food_app/Screens/message_screen.dart';
import 'package:new_food_app/Screens/profile.dart';
import 'package:new_food_app/Screens/shopping_cart.dart';
import 'package:new_food_app/State_managment/cubit/shoppingcarts_cubit.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int x = 0;
  List<Widget> screens = [
    MyHomePage(),
    Profile(),
    ShoppingCart(),
    MessageScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: x,
        children: screens,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10).r,
        child: Container(
          width: 355.w,
          height: 74.h,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(90, 108, 234, 0.1),
                    blurRadius: 50,
                    spreadRadius: 0)
              ],
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(22).w),
          alignment: Alignment.center,
          child: Stack(alignment: Alignment.topRight, children: [
            GNav(
                selectedIndex: x,
                onTabChange: (value) {
                  setState(() {
                    x = value;
                  });
                },
                haptic: true, // haptic feedback
                tabBorderRadius: 12,
                textStyle: TextStyle(color: Color.fromRGBO(9, 5, 28, 1)),

                // tabBorder: Border.all(
                //     color: Color.fromRGBO(83, 232, 139, 1),
                //     width: 1), // tab button border
                // tabShadow: [
                //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
                // ], // tab button shadow
                curve: Curves.easeOutExpo, // tab animation curves
                duration: Duration(milliseconds: 500), // tab animation duration
                gap: 8, // the tab button gap between icon and text
                color: Color.fromRGBO(83, 232, 139, 1), // unselected icon color
                activeColor: Color.fromRGBO(
                    83, 232, 139, 1), // selected icon and text color
                iconSize: 24, // tab button icon size
                tabBackgroundColor: Color.fromRGBO(
                    21, 190, 120, 0.1), // selected tab background color
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 5), // navigation bar padding
                tabs: [
                  GButton(
                    icon: Icons.home,
                    iconColor: Color.fromRGBO(83, 232, 139, 1),
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'profile',
                  ),
                  GButton(
                    icon: Icons.shopping_cart,
                    text: 'shopping cart',
                  ),
                  GButton(
                    icon: Icons.chat,
                    text: 'chat',
                  )
                ]),
            BlocBuilder<ShoppingcartsCubit, ShoppingcartsState>(
              builder: (context, state) {
                final appbloc = context.read<ShoppingcartsCubit>();

                double right;

                if (x == 2) {
                  right = 175.w;
                } else if (x == 3) {
                  right = 138.w;
                } else {
                  right = 95.w;
                }
                return Positioned(
                    right: right,
                    child: Container(
                      height: 14.h,
                      width: 13.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.w,
                            style: BorderStyle.solid,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 75, 75, 1),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          appbloc.shoppingcart.length.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9.sp,
                              color: Colors.white),
                        ),
                      ),
                    ));
              },
            )
          ]),
        ),
      ),
    );
  }
}
