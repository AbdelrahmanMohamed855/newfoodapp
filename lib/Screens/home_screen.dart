import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/explore_restaurant.dart';
import 'package:new_food_app/Screens/filter.dart';
import 'package:new_food_app/Screens/healthyproducts.dart';
import 'package:new_food_app/Screens/shopping_cart.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    }
  ];
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
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: SingleChildScrollView(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  offset: Offset(11, 28),
                                  color: Color.fromRGBO(20, 78, 90, 0.2),
                                  blurRadius: 50,
                                  spreadRadius: 0)
                            ],
                            shape: BoxShape.circle),
                        width: 45.w,
                        height: 45.h,
                        child: Stack(alignment: Alignment.topRight, children: [
                          IconButton(
                              style: IconButton.styleFrom(),
                              onPressed: () {},
                              icon: Icon(
                                  color: Color.fromRGBO(83, 232, 139, 1),
                                  Icons.notifications_none_outlined)),
                          Positioned(
                              right: 14.w,
                              top: 15.h,
                              child: Container(
                                width: 8.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.w,
                                        style: BorderStyle.solid,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1)),
                                    color: Colors.red,
                                    shape: BoxShape.circle),
                              )),
                        ]),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
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
                            color: Color.fromRGBO(254, 173, 29, 0.1),
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
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(254, 173, 29, 0.1),
                            borderRadius: BorderRadius.circular(15).w),
                        height: 50.h,
                        width: 49.w,
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Filter()));
                            },
                            icon: Image.asset('assets/Filter.png')))
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Center(
                  child: Container(
                    width: 325.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(83, 232, 139, 1),
                        borderRadius: BorderRadius.circular(16).w),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Positioned(
                            child: Image.asset(
                          'assets/Image.png',
                          fit: BoxFit.cover,
                        )),
                        Positioned.fill(
                            child: Image.asset(
                          'assets/Pattern (2).png',
                          fit: BoxFit.cover,
                        )),
                        Positioned(
                          left: 200,
                          bottom: 80,
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: 142.w,
                            height: 55.h,
                            child: Text(
                              'Special Deal For October',
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 190,
                          bottom: 35,
                          child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(6, 4),
                                      color: Color.fromRGBO(0, 0, 0, 0.13),
                                      blurRadius: 20,
                                      spreadRadius: 0)
                                ],
                              ),
                              width: 85.w,
                              height: 32.h,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6).w),
                                      backgroundColor:
                                          Color.fromRGBO(255, 255, 255, 1)),
                                  onPressed: () {},
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(83, 232, 139, 1)),
                                  ))),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 31).r,
                      child: Text(
                        'Nearest Restaurant',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: Color.fromRGBO(9, 5, 28, 1)),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExploreRestaurant()));
                        },
                        child: Text(
                          'View More',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 124, 50, 1)),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25).r,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 184.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (items[index] == items[0]) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Healthyproducts()));
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10).r,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22).r,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(12, 26),
                                          color: Color.fromRGBO(
                                              90, 108, 234, 0.07),
                                          blurRadius: 50,
                                          spreadRadius: 0)
                                    ],
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                width: 147.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      items[index]['image'],
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      items[index]['label'],
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(items[index]['time']),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 31).r,
                      child: Text(
                        'Popular Menu',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: Color.fromRGBO(9, 5, 28, 1)),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'View More',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 124, 50, 1)),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25).r,
                  child: Container(
                    height: 301.h,
                    width: 323.w,
                    child: ListView.builder(
                        itemCount: menu.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Center(
                              child: Container(
                                height: 87.h,
                                width: 323.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22).w,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              90, 108, 234, 0.07),
                                          blurRadius: 50,
                                          spreadRadius: 0)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ListTile(
                                    leading: Image.asset(menu[index]['image']),
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
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}
