import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/State_managment/cubit/foodshop_cubit.dart';
import 'package:new_food_app/State_managment/cubit/shoppingcarts_cubit.dart';

class Healthyproducts extends StatefulWidget {
  const Healthyproducts({super.key});

  @override
  State<Healthyproducts> createState() => _HealthyproductsState();
}

class _HealthyproductsState extends State<Healthyproducts> {
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
                      height: 82.h,
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
              height: 25.h,
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
                Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(254, 173, 29, 0.1),
                        borderRadius: BorderRadius.circular(15).w),
                    height: 50.h,
                    width: 49.w,
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/Filter.png')))
              ],
            ),
            BlocConsumer<ShoppingcartsCubit, ShoppingcartsState>(
              listener: (context, state) {
                if (state is seclecteditems) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Center(child: Text('Added To Cart'));
                      });
                }
              },
              builder: (context, state) {
                return BlocBuilder<ShoppingcartsCubit, ShoppingcartsState>(
                  builder: (context, state) {
                    final appbloc = context.read<ShoppingcartsCubit>();
                    return Expanded(
                      child: ListView.builder(
                          itemCount: appbloc.items.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.asset(
                                appbloc.items[index]['image'],
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                appbloc.items[index]['title'],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(appbloc.items[index]['subtitle']),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text('\$${appbloc.items[index]['price']}')
                                ],
                              ),
                              trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    backgroundColor:
                                        const Color.fromARGB(255, 50, 253, 56),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15).w)),
                                onPressed: () {
                                  appbloc.productsselected(index: index);

                                  appbloc.totalprice();
                                },
                                child: Text(
                                  'Add To Cart',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }),
                    );
                  },
                );
              },
            )
          ])
        ]));
  }
}
