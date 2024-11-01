import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/detail_product.dart';
import 'package:new_food_app/Screens/healthyproducts.dart';

class ExploreRestaurant extends StatefulWidget {
  const ExploreRestaurant({super.key});

  @override
  State<ExploreRestaurant> createState() => _ExploreRestaurantState();
}

class _ExploreRestaurantState extends State<ExploreRestaurant> {
  List<Map<String, dynamic>> items = [
    {
      'image': 'assets/Resturant Image.png',
      'label': 'Vegan Resto',
      'time': '12 Mins'
    },
    {
      'image': 'assets/Restaurant Image.png',
      'label': 'Healthy Food',
      'time': '8 Mins'
    },
    {
      'image': 'assets/Restaurant Image (1).png',
      'label': 'Good Food',
      'time': '12 Mins'
    },
    {
      'image': 'assets/Restaurant Image (3).png',
      'label': 'Smart Resto',
      'time': '8 Mins'
    },
    {
      'image': 'assets/Restaurant Image (5).png',
      'label': 'Wijie Resto',
      'time': '12 Mins'
    },
    {
      'image': 'assets/Restaurant Image (4).png',
      'label': 'Vegan Resto',
      'time': '12 Mins'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
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
                        child: IconButton(
                            style: ButtonStyle(
                                iconColor:
                                    WidgetStatePropertyAll(Colors.green)),
                            onPressed: () {},
                            icon: Icon(Icons.notifications_none_outlined)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25).r,
                      child: Container(
                        width: 267.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(249, 168, 77, 0.1),
                            borderRadius: BorderRadius.circular(15).w),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              prefixIcon: Image.asset('assets/Icon Search.png'),
                              hintText: 'What do you want to order?',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(218, 99, 23, 1),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(249, 169, 77, 0.1),
                            borderRadius: BorderRadius.circular(15).w),
                        height: 50.h,
                        width: 49.w,
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/Filter.png')))
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 31).r,
                      child: Container(
                        width: 143.w,
                        height: 20.h,
                        child: Text(
                          'Popular Restaurant',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Color.fromRGBO(9, 5, 28, 1)),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: 314.w,
                    height: 592.h,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (items[index] == items[0]) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Healthyproducts()));
                            }
                            if (items[index] == items[4]) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailProduct()));
                            }
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 10).r,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22).r,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(12, 26),
                                        color:
                                            Color.fromRGBO(90, 108, 234, 0.07),
                                        blurRadius: 50,
                                        spreadRadius: 0)
                                  ],
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    items[index]['image'],
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    width: 103.w,
                                    height: 21.h,
                                    child: Text(
                                      items[index]['label'],
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(items[index]['time']),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
