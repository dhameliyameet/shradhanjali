import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shradhanjalipage/section.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.blue.shade100,
              Colors.blue.shade200,
              Colors.blue.shade300
            ])),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 220.h,
                child: Image.asset("assets/Group 9.png"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => section(),
                      ));
                    },
                    child: Image.asset(
                      "assets/new card.png",
                      height: 120.h,
                      width: 140.w,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Image.asset(
                      "assets/my card.png",
                      height: 120.h,
                      width: 140.w,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/language.png",
                    height: 120.h,
                    width: 140.w,
                  ),
                  Image.asset(
                    "assets/review.png",
                    height: 120.h,
                    width: 140.w,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/share.png",
                    height: 120.h,
                    width: 140.w,
                  ),
                  Image.asset(
                    "assets/apk.png",
                    height: 120.h,
                    width: 140.w,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 115.w),
                    child: Icon(Icons.info_outline),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    "Application",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
