import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/filter.dart';
import 'package:new_food_app/State_managment/cubit/foodshop_cubit.dart';

class MenuWithFilter extends StatefulWidget {
  const MenuWithFilter({super.key});

  @override
  State<MenuWithFilter> createState() => _MenuWithFilterState();
}

class _MenuWithFilterState extends State<MenuWithFilter> {
  List<Map<String, dynamic>> menu = [
    {
      'image': 'assets/Menu Photo.png',
      'price': 7,
      'title': 'Herbal Pancake',
      'subtitle': 'Warung Herbal'
    },
    {
      'image': 'assets/Photo Menu.png',
      'price': 5,
      'title': 'Fruit Salad',
      'subtitle': 'Wijie Resto'
    },
    {
      'image': 'assets/Photo Menu (1).png',
      'price': 15,
      'title': 'Green Noddle',
      'subtitle': 'Noodle Home'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(254, 254, 255, 1),
        body: Stack(alignment: Alignment.topRight, children: [
          Positioned(
              child: Image.asset(
            'assets/Pattern (1).png',
            fit: BoxFit.cover,
          )),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    child: IconButton(
                        style: ButtonStyle(
                            iconColor: WidgetStatePropertyAll(Colors.green)),
                        onPressed: () {},
                        icon: Icon(Icons.notifications_none_outlined)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25).r,
                  child: Container(
                    width: 267.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(254, 173, 29, 0.1),
                        borderRadius: BorderRadius.circular(15).w),
                    child: TextField(
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          prefixIcon: Image.asset('assets/Icon Search.png'),
                          hintText: 'What do you want to order?',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(218, 99, 23, 1),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25).r,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(254, 173, 29, 0.1),
                          borderRadius: BorderRadius.circular(15).w),
                      height: 50.h,
                      width: 49.w,
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/Filter.png'))),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocBuilder<FoodshopCubit, FoodshopState>(
              builder: (context, state) {
                final appbloc = context.read<FoodshopCubit>();
                return Container(
                    alignment: Alignment.center,
                    width: 400.w,
                    height: 44.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: appbloc.typeselect.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10).r,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20).w,
                                  color: Color.fromRGBO(254, 173, 29, 0.1)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      appbloc.typeselect[index]["title"],
                                      style: TextStyle(
                                          color: Color.fromRGBO(218, 99, 23, 1),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    IconButton(
                                        style: ButtonStyle(
                                            iconSize:
                                                WidgetStatePropertyAll(20),
                                            iconColor: WidgetStatePropertyAll(
                                                Color.fromRGBO(
                                                    218, 99, 23, 1))),
                                        onPressed: () {
                                          setState(() {
                                            if (appbloc.typeselect.isNotEmpty) {
                                              appbloc.typeselect
                                                  .removeAt(index);
                                            }
                                            if (appbloc.typeselect.isEmpty) {
                                              Navigator.pop(context);
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.close)),
                                  ]),
                            ),
                          );
                        }));
              },
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: menu.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 15).r,
                      child: Container(
                        width: 323.w,
                        height: 87.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0,
                                  blurRadius: 50,
                                  color: Color.fromRGBO(90, 108, 234, 0.07))
                            ],
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(22.w)),
                        child: ListTile(
                          leading: Image.asset(
                            menu[index]['image'],
                            fit: BoxFit.cover,
                          ),
                          title: Text(menu[index]['title']),
                          subtitle: Text(menu[index]['subtitle']),
                          trailing: Text(
                            '\$${menu[index]['price']}',
                            style: TextStyle(
                                color: Color.fromRGBO(
                                  254,
                                  173,
                                  29,
                                  1,
                                ),
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ]),
        ]));
  }
}
