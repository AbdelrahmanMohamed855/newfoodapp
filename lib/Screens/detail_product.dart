import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  List<Map<String, dynamic>> product = [
    {'image': "assets/image 34.png", 'title': 'pizza', 'price': 12},
    {'image': "assets/image 32.png", 'title': 'meat', 'price': 16},
    {'image': "assets/image 32.png", 'title': 'Spacy fresh crab', 'price': 20}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 376.w,
            height: 442.h,
            child: Image.asset(
              'assets/Photo Restaurant.png',
              fit: BoxFit.cover,
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.5,
            maxChildSize: 0.8,
            builder: (context, ScrollController conttroller) {
              return Container(
                width: 376.w,
                height: 838.h,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50).w,
                            topRight: Radius.circular(50))
                        .w),
                child: SingleChildScrollView(
                    controller: conttroller,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 32).r,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Wijie Bar and Resto',
                              style: TextStyle(
                                  fontSize: 27.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 29).r,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                width: 120.w,
                                height: 20.h,
                                child: ListTile(
                                  leading:
                                      Image.asset('assets/Icon map-pin.png'),
                                  title: Text(
                                    '19 Km',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color.fromRGBO(59, 59, 59, 1)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                width: 175.w,
                                height: 20.h,
                                child: ListTile(
                                    leading:
                                        Image.asset('assets/Icon Star.png'),
                                    title: Text(
                                      '4,8 Rating',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color.fromRGBO(59, 59, 59, 1)),
                                    )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32).r,
                          child: Container(
                              height: 88.h,
                              width: 313.w,
                              child: Text(
                                'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                              )),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32).r,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Popular Menu',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 19).r,
                          child: Container(
                              width: 477.w,
                              height: 120.h,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: product.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 147.w,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    90, 107, 234, 0.1),
                                                blurRadius: 50,
                                                spreadRadius: 0)
                                          ],
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            product[index]['image'],
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            product[index]['title'],
                                            style: TextStyle(fontSize: 15.sp),
                                          ),
                                          Text(
                                            '${product[index]['price'].toString()}\$',
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1)),
                                          )
                                        ],
                                      ),
                                    );
                                  })),
                        )
                      ],
                    )),
              );
            },
          )
        ],
      ),
    );
  }
}
