/*
 * *
 *  * Created by Vishal Patolia on 9/20/21, 5:09 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/20/21, 4:46 PM
 *
 */

import 'dart:async';

import '../../ui/intro/intro_screen.dart';
import '../../utils/slide_route.dart';
import '../../values/colors.dart';
import '../../values/dimens.dart';
import '../../values/style.dart';
import '../../widgets/bouncing_loader.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.cover,
                  height: 200,
                ),
                Text(
                  "Event Pro",
                  style: boldLargeTextStyle.copyWith(fontSize: textSizeXLarge),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const LoadingBouncingLine.circle(
          borderSize: 3.0,
          size: 50.0,
          backGroundColor: primaryColor,
          duration: Duration(seconds: 3),
        ));
  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context)
            .pushReplacement(SlideRightRoute(page: const IntroScreen())));
  }
}
