import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/payments.dart';
import 'package:new_food_app/State_managment/cubit/shoppingcarts_cubit.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart>
    with TickerProviderStateMixin {
  bool _press = false;

  late AnimationController _animationController;
  late Animation<double> box;
  late Animation<double> text;
  late Animation<double> car;
  late Animation<double> road;
  late Animation<double> color;
  late Animation<double> boxsize;

  late Animation<double> textfinish;
  late Animation<double> checkbox;

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

    car = Tween<double>(begin: -55, end: 400).animate(
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
    textfinish = Tween<double>(begin: -200, end: 90).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(1.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    checkbox = Tween<double>(begin: -200, end: 80).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(1.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    road = Tween<double>(begin: 400, end: -600).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Interval(0.5, 1.0, curve: Curves.linear)),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Payments()));
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
    return BlocBuilder<ShoppingcartsCubit, ShoppingcartsState>(
      builder: (context, state) {
        final appbloc = context.read<ShoppingcartsCubit>();
        return appbloc.shoppingcart.isNotEmpty
            ? Scaffold(
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                body: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Stack(alignment: Alignment.topRight, children: [
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
                          padding: const EdgeInsets.only(top: 80, left: 25).r,
                          child: Container(
                            width: 160.w,
                            height: 33.h,
                            child: Text(
                              'Order details',
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(9, 5, 28, 1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          width: 450.w,
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: appbloc.shoppingcart.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 107.5.h,
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(22).w),
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Icon(
                                          color: Colors.white,
                                          size: 35.sp,
                                          Icons.delete_outlined,
                                        ),
                                      ),
                                    ),
                                    Dismissible(
                                      movementDuration:
                                          Duration(milliseconds: 200),
                                      key:
                                          ValueKey(appbloc.shoppingcart[index]),
                                      onDismissed: (direction) {
                                        appbloc.shoppingcart.removeAt(index);
                                        appbloc.totalprice();
                                      },
                                      direction: DismissDirection.endToStart,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22).w,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(12, 26),
                                                  spreadRadius: 0,
                                                  blurRadius: 50,
                                                  color: Color.fromRGBO(
                                                      90, 108, 234, 0.07))
                                            ],
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                                  vertical: 15)
                                              .h,
                                          child: ListTile(
                                            leading: Image.asset(
                                              appbloc.shoppingcart[index]
                                                  ['image'],
                                              fit: BoxFit.cover,
                                            ),
                                            title: Text(appbloc
                                                .shoppingcart[index]['title']),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(appbloc.shoppingcart[index]
                                                    ['subtitle']),
                                                Text(
                                                  '\$${appbloc.shoppingcart[index]['price']}',
                                                  style: TextStyle(
                                                    fontSize: 19.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                        83, 232, 139, 1),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            trailing: Container(
                                              width: 92.w,
                                              height: 26.h,
                                              alignment: Alignment.centerRight,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    width: 26.w,
                                                    height: 26.h,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          21, 190, 119, 0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                                  10)
                                                              .w,
                                                    ),
                                                    child: IconButton(
                                                      style: ButtonStyle(
                                                        alignment:
                                                            Alignment.center,
                                                        iconColor:
                                                            WidgetStatePropertyAll(
                                                          Color.fromRGBO(
                                                              6, 241, 96, 1),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        appbloc.decrement(
                                                            index: index);
                                                      },
                                                      icon: Icon(
                                                          size: 15.sp,
                                                          Icons.remove),
                                                    ),
                                                  ),
                                                  Text(appbloc
                                                      .shoppingcart[index]
                                                          ['quantite']
                                                      .toString()),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          83, 232, 139, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                                  10)
                                                              .w,
                                                    ),
                                                    alignment:
                                                        Alignment.topCenter,
                                                    width: 26.w,
                                                    height: 26.h,
                                                    child: IconButton(
                                                      style: ButtonStyle(
                                                        iconColor:
                                                            WidgetStatePropertyAll(
                                                          Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        appbloc.incrementitems(
                                                            index: index);
                                                      },
                                                      icon: Icon(
                                                          size: 14.sp,
                                                          Icons.add),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
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
                              Text(
                                '${appbloc.price.toString()}\$',
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    color: Color.fromRGBO(254, 254, 255, 1)),
                              )
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            width: 325.w,
                            height: 50.h,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15).w,
                                  ),
                                  backgroundColor:
                                      Color.fromRGBO(254, 254, 255, 1),
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
                                                fontSize: 25.sp,
                                                color: Colors.black,
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
                                            width: 50.w,
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
                                            'Place My Order',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    83, 232, 139, 1),
                                                fontSize: 14.sp),
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
                                    AnimatedBuilder(
                                      animation: textfinish,
                                      builder: (context, child) {
                                        return Positioned(
                                          right: textfinish.value,
                                          child: Text(
                                            'Shopping',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    83, 232, 139, 1),
                                                fontSize: 14.sp),
                                          ),
                                        );
                                      },
                                    ),
                                    AnimatedBuilder(
                                      animation: checkbox,
                                      builder: (context, child) {
                                        return Positioned(
                                            left: checkbox.value,
                                            child: Image.asset(
                                              'assets/Check mark.jpg',
                                              width: 30.w,
                                            ));
                                      },
                                    ),
                                  ],
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ))
            : Center(
                child: Text(
                  'Your Cart is empty ',
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                ),
              );
      },
    );
  }
}
