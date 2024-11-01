import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/data/chachhelper.dart';
import 'package:new_food_app/Screens/screens.dart';

import 'package:new_food_app/Screens/splach_screen.dart';
import 'package:new_food_app/State_managment/cubit/chats_cubit.dart';
import 'package:new_food_app/State_managment/cubit/cubit/upload_photos_cubit.dart';
import 'package:new_food_app/State_managment/cubit/foodshop_cubit.dart';
import 'package:new_food_app/State_managment/cubit/shoppingcarts_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cachhelper.cach();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => FoodshopCubit(),
              ),
              BlocProvider(
                create: (context) => UploadPhotosCubit(),
              ),
              BlocProvider(
                create: (context) => ShoppingcartsCubit(),
              ),
              BlocProvider(
                create: (context) => ChatsCubit()..get(),
              )
            ],
            child: MaterialApp(
              home: SplachScreen(),
            ));
      },
    );
  }
}
