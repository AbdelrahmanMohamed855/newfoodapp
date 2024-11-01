import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/State_managment/cubit/shoppingcarts_cubit.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments>
    with SingleTickerProviderStateMixin {
  bool _press = false;

  late AnimationController _animationController;
  late Animation<double> box;
  late Animation<double> text;
  late Animation<double> car;
  late Animation<double> road;
  late Animation<double> color;
  late Animation<double> boxsize;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    text = Tween<double>(begin: 115, end: -200).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.1, 0.5, curve: Curves.easeInOut),
      ),
    );

    car = Tween<double>(begin: -50, end: 400).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    box = Tween<double>(begin: 60, end: 400).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );
    boxsize = Tween<double>(begin: 50, end: 30).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    road = Tween<double>(begin: 150, end: -550).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Interval(0.5, 1.0, curve: Curves.linear)),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _press = false;
      }
    });
  }

  void startanimation() {
    setState(() {
      _press = !_press;
    });
    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 25).r,
            child: Container(
              width: 176.w,
              height: 33.h,
              child: Text(
                'Confirm Order',
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(9, 5, 28, 1)),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20).r,
            child: Container(
              height: 108.h,
              width: 335.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0,
                      blurRadius: 50,
                      color: Color.fromRGBO(90, 108, 234, 0.07))
                ],
                borderRadius: BorderRadius.circular(22).w,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Deliver To',
                        style:
                            TextStyle(color: Color.fromRGBO(59, 59, 59, 0.4)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Color.fromRGBO(83, 232, 139, 1)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/Pin Logo.png',
                      width: 33.w,
                      height: 33.h,
                    ),
                    title: Text(
                      '4517 Washington Ave. Manchester, Kentucky 39495',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20).r,
            child: Container(
              height: 108.h,
              width: 335.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0,
                      blurRadius: 50,
                      color: Color.fromRGBO(90, 108, 234, 0.07))
                ],
                borderRadius: BorderRadius.circular(22).w,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Method',
                        style:
                            TextStyle(color: Color.fromRGBO(59, 59, 59, 0.4)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Color.fromRGBO(83, 232, 139, 1)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/paypal-2 (1) 1.png',
                      width: 86.w,
                      height: 23.h,
                    ),
                    title: Text(
                      '2121 6352 8465 ****',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar: Container(
          width: 346.w,
          height: 206.h,
          decoration: BoxDecoration(
              color: Color.fromRGBO(83, 232, 139, 1),
              borderRadius: BorderRadius.circular(22).w),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Positioned(
                child: Image.asset(
                  'assets/Pattern (4).png',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Totle',
                        style: TextStyle(
                            color: Color.fromRGBO(254, 254, 255, 1),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      BlocBuilder<ShoppingcartsCubit, ShoppingcartsState>(
                        builder: (context, state) {
                          final appbloc = context.read<ShoppingcartsCubit>();
                          return Text(
                            '${appbloc.price.toString()}\$',
                            style: TextStyle(
                                fontSize: 19.sp,
                                color: Color.fromRGBO(254, 254, 255, 1)),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Container(
                    width: 325,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: _press
                              ? Colors.black
                              : Color.fromRGBO(254, 254, 255, 1),
                        ),
                        onPressed: startanimation,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedBuilder(
                              animation: road,
                              builder: (context, child) {
                                return Positioned.fill(
                                  left: road.value,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '---  ---  ---  ---  ---  ---  ---',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            AnimatedBuilder(
                              animation: car,
                              builder: (context, child) {
                                return Positioned(
                                  left: car.value,
                                  child: Image.asset(
                                    'assets/delivery-bike.png',
                                    width: 50,
                                  ),
                                );
                              },
                            ),
                            AnimatedBuilder(
                              animation: text,
                              builder: (context, child) {
                                return Positioned(
                                  left: text.value,
                                  child: Text(
                                    'Shopping Now',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12.sp),
                                  ),
                                );
                              },
                            ),
                            AnimatedBuilder(
                              animation: box,
                              builder: (context, child) {
                                return Positioned(
                                  left: box.value,
                                  child: Icon(
                                    Icons.gif_box,
                                    size: boxsize.value,
                                  ),
                                );
                              },
                            ),
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
