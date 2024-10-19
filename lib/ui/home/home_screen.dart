/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */

import '../../ui/event/event_details_screen.dart';
import '../../ui/event/event_list_screen.dart';
import '../../ui/event/filter_screen.dart';
import '../../ui/event/my_event_screen.dart';
import '../../ui/event/past_event_screen.dart';
import '../../ui/event/search_screen.dart';
import '../../ui/feedback/feedback_screen.dart';
import '../../ui/home/categories_screen.dart';
import '../../ui/notification/notification_screen.dart';
import '../../ui/profile/profile_screen.dart';
import '../../ui/setting/contact_us_screen.dart';
import '../../ui/setting/help_screen.dart';
import '../../ui/setting/settings_screen.dart';
import '../../utils/extension.dart';
import '../../utils/slide_route.dart';
import '../../values/colors.dart';
import '../../values/dimens.dart';
import '../../values/strings.dart';
import '../../values/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 600));

  List<Categories> categoriesList = [
    Categories('Tech', false),
    Categories('Sports', false),
    Categories('Talk', false),
    Categories('Funny', false),
    Categories('Devotional', false)
  ];

  List<String> attendeesList = [
    'assets/woman.png',
    'assets/man.png',
    'assets/woman_a.png'
  ];

  List<String> eventList = [
    'assets/event_a.jpg',
    'assets/event_b.jpg',
    'assets/event_c.jpg',
    'assets/event_a.jpg',
    'assets/event_b.jpg'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: backgroundColor,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(150.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: primaryColor),
                      child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0)
                            .animate(_animationController),
                        child: const Center(child: Icon(Icons.menu, size: 32)),
                      ),
                    ),
                    onTap: () {
                      _animationController.forward(from: 0.0);
                      _scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                  InkWell(
                    child: const Icon(Icons.notifications_none_rounded,
                        color: primaryColor, size: 32),
                    onTap: () => {
                      Navigator.of(context).push(
                          SlideRightRoute(page: const NotificationScreen()))
                    },
                  )
                ],
              ).wrapPaddingAll(spacingContainer)),
          drawer: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35)),
              child: SizedBox(
                width: defaultTargetPlatform == TargetPlatform.windows && kIsWeb
                    ? 400
                    : 304,
                child: Drawer(
                  child: Container(
                    color: primaryColor,
                    child: Column(
                      children: [
                        const SizedBox(height: spacingContainer),
                        InkWell(
                          child: Row(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'assets/man_profile.jpg',
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                            ),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text("Mario Matter",
                                      maxLines: 1,
                                      style: boldLargeTextStyle.copyWith(
                                          color: Colors.white)),
                                  Text("New York, US 10010",
                                          maxLines: 1,
                                          style: normalTextStyle.copyWith(
                                              color: Colors.white))
                                      .addMarginTop(spacingControl)
                                ]).addMarginLeft(spacingContainer)),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 18,
                            )
                          ]).wrapPaddingAll(spacingContainer),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                                SlideRightRoute(page: const ProfileScreen()));
                          },
                        ),
                        const SizedBox(height: spacingContainer),
                        Container(
                            height: 2, color: Colors.grey.withOpacity(0.5)),
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(0.0),
                            physics: const ClampingScrollPhysics(),
                            children: <Widget>[
                              const SizedBox(height: spacingStandard),
                              InkWell(
                                child:
                                    _navItem('assets/menu.png', 'Categories'),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(SlideRightRoute(
                                      page: const CategoriesScreen()));
                                },
                              ),
                              const SizedBox(height: itemSpacing),
                              InkWell(
                                child:
                                    _navItem('assets/my_event.png', 'My Event'),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(SlideRightRoute(
                                      page: const MyEventScreen()));
                                },
                              ),
                              const SizedBox(height: itemSpacing),
                              InkWell(
                                child: _navItem(
                                    'assets/past_event.png', 'Past Event'),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(SlideRightRoute(
                                      page: const PastEventScreen()));
                                },
                              ),
                              const SizedBox(height: itemSpacing),
                              InkWell(
                                child:
                                    _navItem('assets/feedback.png', 'Feedback'),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(SlideRightRoute(
                                      page: const FeedbackScreen()));
                                },
                              ),
                              const SizedBox(height: itemSpacing),
                              InkWell(
                                child:
                                    _navItem('assets/setting.png', 'Settings'),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(SlideRightRoute(
                                      page: const SettingsScreen()));
                                },
                              ),
                              const SizedBox(height: itemSpacing),
                              InkWell(
                                child: _navItem(
                                    'assets/contact_us.png', 'Contact Us'),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(SlideRightRoute(
                                      page: const ContactUsScreen()));
                                },
                              ),
                              const SizedBox(height: itemSpacing),
                              InkWell(
                                child: _navItem('assets/help.png', 'Help'),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(SlideRightRoute(
                                      page: const HelpScreen()));
                                },
                              ),
                            ],
                          ).wrapPaddingAll(spacingContainer),
                        ),
                        InkWell(
                          child: Text('Logout',
                              style: boldLargeTextStyle.copyWith(
                                  color: Colors.white)),
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: Border.all(
                                        color: primaryColor,
                                        width: borderWidth,
                                        style: BorderStyle.solid),
                                    backgroundColor: Colors.white,
                                    title: Text(
                                      'Logout!',
                                      style: boldLargeTextStyle.copyWith(
                                          fontSize: textSizeNormal),
                                    ),
                                    // To display the title it is optional
                                    content: Text(
                                        'Are you sure you want to logout now?',
                                        style: mediumTextStyle),
                                    // Message which will be pop up on the screen
                                    // Action widget which will provide the user to acknowledge the choice
                                    actions: [
                                      SizedBox(
                                        width: 100,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(0),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0))),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent)),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          // function used to perform after pressing the button
                                          child: Text('Cancel',
                                              style: boldTextStyle),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(0),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0))),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent)),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child:
                                              Text('Ok', style: boldTextStyle),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                        const SizedBox(height: itemSpacing)
                      ],
                    ),
                  ),
                ),
              )),
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
                  Text('Welcome Mario,',
                      style:
                          boldLargeTextStyle.copyWith(fontSize: textSizeLarge)),
                  const SizedBox(height: spacingContainer),
                  Text('Find trending events', style: normalTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Card(
                            color: Colors.white,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              width: context.width,
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                  color: primaryColor,
                                  width: 2,
                                ),
                              ),
                              child: TextFormField(
                                      style: mediumTextStyle,
                                      cursorColor: primaryColor,
                                      decoration: InputDecoration(
                                          hintText: 'Search event',
                                          enabled: false,
                                          border: InputBorder.none,
                                          hintStyle: mediumTextStyle))
                                  .wrapPadding(
                                      padding: const EdgeInsets.only(
                                          left: spacingContainer,
                                          right: spacingContainer)),
                            ),
                          ).wrapPadding(
                              padding: const EdgeInsets.only(
                                  top: spacingContainer,
                                  right: spacingControl,
                                  bottom: spacingContainer)),
                          onTap: () => Navigator.of(context).push(
                              SlideRightRoute(page: const SearchScreen())),
                        ),
                      ),
                      GestureDetector(
                        child: Card(
                          color: Colors.white,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                color: primaryColor,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.filter_list_rounded,
                              color: primaryColor,
                              size: 32,
                            ).wrapPaddingAll(spacingStandard),
                          ),
                        ),
                        onTap: () => Navigator.of(context)
                            .push(SlideRightRoute(page: const FilterScreen())),
                      )
                    ],
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Categories',
                            style: boldLargeTextStyle.copyWith(
                                fontSize: textSizeNormal)),
                        const Icon(Icons.more_horiz_rounded,
                            color: primaryColor, size: 32)
                      ],
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(
                          SlideRightRoute(page: const CategoriesScreen()));
                    },
                  ),
                  const SizedBox(height: spacingContainer),
                  SizedBox(
                    height: 50,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.touch,
                        },
                      ),
                      child: ListView.separated(
                          itemCount: categoriesList.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: spacingStandard);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              child: Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  color: categoriesList[index].isSelect == true
                                      ? primaryColor
                                      : backgroundColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  border: Border.all(
                                    color: primaryColor,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(categoriesList[index].catName!,
                                          maxLines: 1,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              categoriesList[index].isSelect ==
                                                      true
                                                  ? boldTextStyle.copyWith(
                                                      color: Colors.white)
                                                  : boldTextStyle)
                                      .wrapPaddingAll(12),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  if (categoriesList[index].isSelect == true) {
                                    categoriesList[index].isSelect = false;
                                  } else {
                                    categoriesList[index].isSelect = true;
                                  }
                                });
                              },
                            );
                          }),
                    ),
                  ),
                  const SizedBox(height: spacingContainer),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Popular Events',
                            style: boldLargeTextStyle.copyWith(
                                fontSize: textSizeNormal)),
                        const Icon(Icons.more_horiz_rounded,
                            color: primaryColor, size: 32)
                      ],
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(SlideRightRoute(
                          page:
                              const EventListScreen(title: "Popular Events")));
                    },
                  ),
                  const SizedBox(height: spacingContainer),
                  SizedBox(
                    height: 362,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.touch,
                        },
                      ),
                      child: ListView.separated(
                          itemCount: eventList.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: spacingContainer);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(32.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Card(
                                    color: Colors.white,
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                    child: SizedBox(
                                      width: 270,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('29th Nov, 2020 12:00 PM',
                                              style: normalTextStyle),
                                          const SizedBox(
                                              height: spacingStandard),
                                          Text(
                                              'Flutter Conference, Dart Analysis',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: boldLargeTextStyle),
                                          const SizedBox(
                                              height: spacingStandard),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset('assets/location.png',
                                                  height: 20, width: 20),
                                              Text('New York, US 10010',
                                                      style: mediumTextStyle)
                                                  .addMarginLeft(
                                                      spacingControl),
                                            ],
                                          ),
                                          const SizedBox(
                                              height: spacingStandard),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                child: ListView.builder(
                                                        itemCount: attendeesList
                                                            .length,
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        scrollDirection: Axis
                                                            .horizontal,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return index ==
                                                                  attendeesList
                                                                          .length -
                                                                      1
                                                              ? Align(
                                                                  widthFactor:
                                                                      0.7,
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomRight,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                              .grey[
                                                                          700],
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              50)),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .white,
                                                                        width:
                                                                            2,
                                                                      ),
                                                                    ),
                                                                    width: 40,
                                                                    height: 40,
                                                                    child: const Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                )
                                                              : InkWell(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              32.0),
                                                                  child: Align(
                                                                    widthFactor:
                                                                        0.7,
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomRight,
                                                                    child: Image
                                                                        .asset(
                                                                      attendeesList[
                                                                          index],
                                                                      width: 40,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                );
                                                        })
                                                    .wrapPadding(
                                                        padding: const EdgeInsets
                                                                .only(
                                                            left:
                                                                spacingContainer,
                                                            right:
                                                                spacingStandard)),
                                              ),
                                              Ink(
                                                decoration: const BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30))),
                                                child: Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxWidth: 80,
                                                          minHeight: 40),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '$currency 500',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        boldTextStyle.copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ).wrapPadding(
                                          padding: const EdgeInsets.only(
                                              top: spacingLarge * 3,
                                              left: spacingContainer,
                                              right: spacingContainer,
                                              bottom: spacingContainer)),
                                    ),
                                  ).wrapPadding(
                                      padding: const EdgeInsets.only(
                                          top: spacingLarge * 2)),
                                  Positioned(
                                    top: 0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.asset(eventList[index],
                                          width: 230, fit: BoxFit.scaleDown),
                                    ),
                                  )
                                ],
                              ).wrapPadding(
                                  padding: const EdgeInsets.only(
                                      bottom: spacingContainer)),
                              onTap: () {
                                Navigator.of(context).push(SlideRightRoute(
                                    page: const EventDetailsScreen()));
                              },
                            );
                          }),
                    ),
                  ),
                  const SizedBox(height: spacingContainer),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Latest Events',
                            style: boldLargeTextStyle.copyWith(
                                fontSize: textSizeNormal)),
                        const Icon(Icons.more_horiz_rounded,
                            color: primaryColor, size: 32)
                      ],
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(SlideRightRoute(
                          page: const EventListScreen(title: "Latest Events")));
                    },
                  ),
                  const SizedBox(height: spacingContainer),
                  SizedBox(
                    height: 362,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.touch,
                        },
                      ),
                      child: ListView.separated(
                          itemCount: eventList.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: spacingContainer);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(32.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Card(
                                    color: Colors.white,
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                    child: SizedBox(
                                      width: 270,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('29th Nov, 2020 12:00 PM',
                                              style: normalTextStyle),
                                          const SizedBox(
                                              height: spacingStandard),
                                          Text(
                                              'Flutter Conference, Dart Analysis',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: boldLargeTextStyle),
                                          const SizedBox(
                                              height: spacingStandard),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset('assets/location.png',
                                                  height: 20, width: 20),
                                              Text('New York, US 10010',
                                                      style: mediumTextStyle)
                                                  .addMarginLeft(
                                                      spacingControl),
                                            ],
                                          ),
                                          const SizedBox(
                                              height: spacingStandard),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                child: ListView.builder(
                                                        itemCount: attendeesList
                                                            .length,
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        scrollDirection: Axis
                                                            .horizontal,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return index ==
                                                                  attendeesList
                                                                          .length -
                                                                      1
                                                              ? Align(
                                                                  widthFactor:
                                                                      0.7,
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomRight,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                              .grey[
                                                                          700],
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              50)),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .white,
                                                                        width:
                                                                            2,
                                                                      ),
                                                                    ),
                                                                    width: 40,
                                                                    height: 40,
                                                                    child: const Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                )
                                                              : InkWell(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              32.0),
                                                                  child: Align(
                                                                    widthFactor:
                                                                        0.7,
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomRight,
                                                                    child: Image
                                                                        .asset(
                                                                      attendeesList[
                                                                          index],
                                                                      width: 40,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                );
                                                        })
                                                    .wrapPadding(
                                                        padding: const EdgeInsets
                                                                .only(
                                                            left:
                                                                spacingContainer,
                                                            right:
                                                                spacingStandard)),
                                              ),
                                              Ink(
                                                decoration: const BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30))),
                                                child: Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxWidth: 80,
                                                          minHeight: 40),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '$currency 500',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        boldTextStyle.copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ).wrapPadding(
                                          padding: const EdgeInsets.only(
                                              top: spacingLarge * 3,
                                              left: spacingContainer,
                                              right: spacingContainer,
                                              bottom: spacingContainer)),
                                    ),
                                  ).wrapPadding(
                                      padding: const EdgeInsets.only(
                                          top: spacingLarge * 2)),
                                  Positioned(
                                    top: 0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.asset(eventList[index],
                                          width: 230, fit: BoxFit.scaleDown),
                                    ),
                                  )
                                ],
                              ).wrapPadding(
                                  padding: const EdgeInsets.only(
                                      bottom: spacingContainer)),
                              onTap: () {
                                Navigator.of(context).push(SlideRightRoute(
                                    page: const EventDetailsScreen()));
                              },
                            );
                          }),
                    ),
                  ),
                  const SizedBox(height: spacingContainer),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Free Events',
                            style: boldLargeTextStyle.copyWith(
                                fontSize: textSizeNormal)),
                        const Icon(Icons.more_horiz_rounded,
                            color: primaryColor, size: 32)
                      ],
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(SlideRightRoute(
                          page: const EventListScreen(title: "Free Events")));
                    },
                  ),
                  const SizedBox(height: spacingContainer),
                  SizedBox(
                    height: 322,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.touch,
                        },
                      ),
                      child: ListView.separated(
                          itemCount: eventList.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: spacingContainer);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(32.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Card(
                                    color: Colors.white,
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                    child: SizedBox(
                                      width: 270,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('29th Nov, 2020 12:00 PM',
                                              style: normalTextStyle),
                                          const SizedBox(
                                              height: spacingStandard),
                                          Text(
                                              'Flutter Conference, Dart Analysis',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: boldLargeTextStyle),
                                          const SizedBox(
                                              height: spacingStandard),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset('assets/location.png',
                                                  height: 20, width: 20),
                                              Text('New York, US 10010',
                                                      style: mediumTextStyle)
                                                  .addMarginLeft(
                                                      spacingControl),
                                            ],
                                          ),
                                          const SizedBox(
                                              height: spacingStandard),
                                        ],
                                      ).wrapPadding(
                                          padding: const EdgeInsets.only(
                                              top: spacingLarge * 3,
                                              left: spacingContainer,
                                              right: spacingContainer,
                                              bottom: spacingContainer)),
                                    ),
                                  ).wrapPadding(
                                      padding: const EdgeInsets.only(
                                          top: spacingLarge * 2)),
                                  Positioned(
                                    top: 0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.asset(eventList[index],
                                          width: 230, fit: BoxFit.scaleDown),
                                    ),
                                  )
                                ],
                              ).wrapPadding(
                                  padding: const EdgeInsets.only(
                                      bottom: spacingContainer)),
                              onTap: () {
                                setState(() {});
                              },
                            );
                          }),
                    ),
                  )
                ],
              ).wrapPaddingAll(spacingContainer),
            ),
          )),
    );
  }

  _navItem(String logoPath, String title) {
    return Row(children: [
      Image.asset(
        logoPath,
        height: 26,
        width: 26,
      ),
      Text(title, style: boldLargeTextStyle.copyWith(color: Colors.white))
          .addMarginLeft(spacingContainer)
    ]);
  }
}

class Categories {
  String? catName;
  bool? isSelect = false;

  Categories(this.catName, this.isSelect);
}
