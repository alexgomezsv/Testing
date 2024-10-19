/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */

import '../../ui/register/register_screen.dart';
import '../../ui/register/verify_otp_screen.dart';
import '../../utils/extension.dart';
import '../../utils/extension_widget.dart';
import '../../utils/slide_route.dart';
import '../../values/colors.dart';
import '../../values/dimens.dart';
import '../../values/style.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =
      TextEditingController(text: "test@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "test@123");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: toolbarBack("", context),
          body: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              },
            ),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style:
                        boldLargeTextStyle.copyWith(fontSize: textSizeXLarge),
                  ),
                  const SizedBox(height: spacingContainer),
                  Text('Lorem Ipsum is simply dummy text of the printing',
                      style: normalLargeTextStyle),
                  const SizedBox(height: spacingLarge),
                  Text("Email", style: smallNormalTextStyle)
                      .addMarginLeft(spacingContainer),
                  TextFormWidget(
                      textEditingController: emailController,
                      hintText: "Enter Email Address"),
                  const SizedBox(height: spacingContainer),
                  Text("Password", style: smallNormalTextStyle)
                      .addMarginLeft(spacingContainer),
                  TextFormWidget(
                      textEditingController: passwordController,
                      hintText: "Enter Password"),
                  InkWell(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Forgot password?",
                        style: boldTextStyle,
                      ).wrapPaddingAll(spacingStandard),
                    ),
                    onTap: () => Navigator.of(context).push(
                        SlideRightRoute(page: const ForgotPasswordScreen())),
                  ),
                  InkWell(
                    child: const ButtonWidget(text: "Login")
                        .wrapPaddingAll(spacingContainer),
                    onTap: () => Navigator.of(context).pushReplacement(
                        SlideRightRoute(page: const VerifyOTPScreen())),
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: normalTextStyle,
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Register',
                                style: boldLargeTextStyle.copyWith(
                                    color: btnBgColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(SlideRightRoute(
                                        page: const RegisterScreen()));
                                  })
                          ]),
                    ).addMarginBottom(spacingLarge),
                  ).addMarginTop(spacingStandard),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: primaryColor,
                          width: MediaQuery.of(context).size.width,
                        ).wrapPadding(
                            padding: const EdgeInsets.only(
                                left: spacingContainer,
                                right: spacingContainer)),
                      ),
                      Text("Or Login With", style: mediumTextStyle),
                      Expanded(
                        child: Container(
                                height: 1,
                                color: primaryColor,
                                width: MediaQuery.of(context).size.width)
                            .wrapPadding(
                                padding: const EdgeInsets.only(
                                    left: spacingContainer,
                                    right: spacingContainer)),
                      )
                    ],
                  ),
                  const SizedBox(height: spacingContainer),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: primaryColor),
                      child: Center(
                          child: Image.asset(
                        "assets/gmail.png",
                        height: 28,
                        width: 28,
                      )),
                    ),
                    const SizedBox(width: spacingContainer),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: primaryColor),
                      child: Center(
                          child: Image.asset(
                        "assets/facebook.png",
                        height: 28,
                        width: 28,
                      )),
                    )
                  ])
                ],
              ).wrapPaddingAll(spacingContainer),
            ),
          )),
    );
  }
}
