/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import '../../ui/notification/notification_screen.dart';
import '../../ui/profile/profile_screen.dart';
import '../../ui/setting/about_screen.dart';
import '../../ui/setting/change_password_screen.dart';
import '../../ui/setting/help_screen.dart';
import '../../utils/extension.dart';
import '../../utils/extension_widget.dart';
import '../../utils/slide_route.dart';
import '../../values/colors.dart';
import '../../values/dimens.dart';
import '../../values/strings.dart';
import '../../values/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          appBar: toolbarBack("Settings", context),
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
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: _settingItem('Profile'),
                    onTap: () => {
                      Navigator.of(context)
                          .push(SlideRightRoute(page: const ProfileScreen()))
                    },
                  ),
                  const SizedBox(height: itemSpacing),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: _settingItem('Notifications'),
                    onTap: () => {
                      Navigator.of(context).push(
                          SlideRightRoute(page: const NotificationScreen()))
                    },
                  ),
                  const SizedBox(height: itemSpacing),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: _settingItem('Change Password'),
                    onTap: () => {
                      Navigator.of(context).push(
                          SlideRightRoute(page: const ChangePasswordScreen()))
                    },
                  ),
                  const SizedBox(height: itemSpacing),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: _settingItem('Privacy & Policy'),
                    onTap: () => launchURL(privacyUrl, context),
                  ),
                  const SizedBox(height: itemSpacing),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: _settingItem('Help & Support'),
                    onTap: () => {
                      Navigator.of(context)
                          .push(SlideRightRoute(page: const HelpScreen()))
                    },
                  ),
                  const SizedBox(height: itemSpacing),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: _settingItem('About'),
                    onTap: () => {
                      Navigator.of(context)
                          .push(SlideRightRoute(page: const AboutScreen()))
                    },
                  )
                ],
              ).wrapPaddingAll(spacingContainer),
            ),
          )),
    );
  }

  _settingItem(String title) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title, style: boldLargeTextStyle),
      const Icon(Icons.arrow_forward_ios_rounded, color: primaryColor, size: 18)
    ]).wrapPadding(
        padding: const EdgeInsets.only(
            left: spacingContainer, right: spacingContainer));
  }
}
