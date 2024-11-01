import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_food_app/Screens/login_screen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 254, 255, 1),
      body: Stack(alignment: Alignment.topCenter, children: [
        Container(
          child: Image.asset(
            'assets/Pattern.png',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Image.asset(
            'assets/Logo.png',
            width: 188.w,
            height: 203.h,
          ),
        ),
      ]),
    );
  }
}
