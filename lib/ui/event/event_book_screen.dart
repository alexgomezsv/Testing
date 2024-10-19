/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:testing/utils/extension.dart';

import '../../utils/extension_widget.dart';
import '../../values/colors.dart';
import '../../values/dimens.dart';
import '../../values/style.dart';
import '../../widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EventBookScreen extends StatefulWidget {
  const EventBookScreen({Key? key}) : super(key: key);

  @override
  _EventBookScreenState createState() => _EventBookScreenState();
}

class _EventBookScreenState extends State<EventBookScreen> {
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
          appBar: toolbarBack("Event Booking", context),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/success.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: spacingContainer),
                  Text('Event Booked Successfully!',
                      style:
                          boldLargeTextStyle.copyWith(fontSize: textSizeLarge)),
                  const SizedBox(height: spacingContainer),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    style: mediumTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  /*
                  QrImage(
                    data: 'https://sdreatech.com/',
                    version: QrVersions.auto,
                    size: 150,
                    gapless: false,
                    eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.circle),
                    foregroundColor: primaryColor,
                  ).addMarginTop(spacingStandard),*/
                  const ButtonWidget(text: "Download Ticket")
                      .wrapPaddingAll(spacingContainer),
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () {},
                    child: Container(
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.5,
                          minHeight: buttonHeight),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/share.png',
                            color: Colors.white,
                            height: 34,
                            width: 34,
                          ),
                          Text(
                            'Share It',
                            textAlign: TextAlign.center,
                            style: boldLargeTextStyle.copyWith(
                                color: Colors.white, fontSize: textSizeNormal),
                          ).addMarginLeft(16),
                        ],
                      ),
                    ),
                  ),
                ],
              ).wrapPaddingAll(spacingContainer),
            ),
          )),
    );
  }
}
