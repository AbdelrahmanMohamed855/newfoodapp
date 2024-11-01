import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/menu_with_filter.dart';
import 'package:new_food_app/State_managment/cubit/foodshop_cubit.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.topRight, children: [
      Positioned(
        child: Image.asset(
          'assets/Pattern (1).png',
          fit: BoxFit.cover,
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 31).r,
                  child: Container(
                      height: 100.h,
                      width: 233.w,
                      child: Text(
                        'Find Your Favorite Food',
                        style: TextStyle(
                            fontSize: 31.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(9, 5, 28, 1)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 71, left: 20).r,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(250, 253, 255, 1),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(20, 78, 90, 0.2),
                              blurRadius: 50,
                              spreadRadius: 0)
                        ],
                        borderRadius: BorderRadius.circular(25).w),
                    width: 45.w,
                    height: 45.h,
                    child: Stack(alignment: Alignment.topRight, children: [
                      IconButton(
                          style: ButtonStyle(
                              iconColor: WidgetStatePropertyAll(Colors.green)),
                          onPressed: () {},
                          icon: Icon(Icons.notifications_none_outlined)),
                      Positioned(
                          right: 14,
                          top: 14,
                          child: Container(
                            width: 8.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                          )),
                    ]),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25).r,
              child: Container(
                width: 325.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(254, 173, 29, 0.1),
                    borderRadius: BorderRadius.circular(15).w),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Image.asset('assets/Icon Search.png'),
                      hintText: 'What do you want to order?',
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(218, 99, 23, 1),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            BlocConsumer<FoodshopCubit, FoodshopState>(
              listener: (context, state) {
                if (state is itemsseclected) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuWithFilter(),
                      ));
                }

                if (state is notitemsseclected) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('no items has been selected ')));
                }
              },
              builder: (context, state) {
                final appbloc = context.read<FoodshopCubit>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25).r,
                      child: Container(
                        width: 35.w,
                        height: 25.h,
                        child: Text(
                          'Type',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Color.fromRGBO(9, 5, 28, 1)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25).r,
                      child: Container(
                        width: 202.w,
                        height: 44.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: appbloc.type.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10).r,
                                  child: Container(
                                    width: 75.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15).w,
                                        color:
                                            Color.fromRGBO(254, 173, 29, 0.1)),
                                    child: Text(
                                      appbloc.type[index]["title"],
                                      style: TextStyle(
                                          color: Color.fromRGBO(218, 99, 23, 1),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25).r,
                      child: Container(
                        width: 64.w,
                        height: 20.h,
                        child: Text(
                          'Location',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Color.fromRGBO(9, 5, 28, 1)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25).r,
                      child: Container(
                        width: 262.w,
                        height: 44.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: appbloc.location.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5).r,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15).w,
                                        color:
                                            Color.fromRGBO(254, 173, 29, 0.1)),
                                    child: Text(
                                      appbloc.location[index]["title"],
                                      style: TextStyle(
                                          color: Color.fromRGBO(218, 99, 23, 1),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25).r,
                      child: Container(
                        width: 36.w,
                        height: 20.h,
                        child: Text(
                          'Food',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Color.fromRGBO(9, 5, 28, 1)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        width: 281.w,
                        height: 140.h,
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisExtent: 45,
                                    crossAxisSpacing: 7,
                                    childAspectRatio: 3),
                            scrollDirection: Axis.vertical,
                            itemCount: appbloc.food.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10).r,
                                child: InkWell(
                                  onTap: () {
                                    appbloc.select(index: index);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15).w,
                                        color:
                                            Color.fromRGBO(254, 173, 29, 0.1)),
                                    child: Text(
                                      appbloc.food[index]["title"],
                                      style: TextStyle(
                                          color: Color.fromRGBO(218, 99, 23, 1),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    SizedBox(height: 115.h),
                    Center(
                      child: Container(
                        width: 325.w,
                        height: 57.h,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(83, 232, 139, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15).w)),
                            onPressed: () {
                              appbloc.itemsselect();
                            },
                            child: Text(
                              'Search',
                              style: TextStyle(
                                  color: Color.fromRGBO(254, 254, 255, 1),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    ]));
  }
}
