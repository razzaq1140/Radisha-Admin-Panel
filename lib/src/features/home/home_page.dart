import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_colors.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_images.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/home/widgets/dash_board_overview_cards/card_desktop.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/home/widgets/dash_board_overview_cards/card_mobile.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/home/widgets/dash_board_overview_cards/card_tablet.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/job_managemnet/lists/list.dart';
import 'package:flutter_application_radisha_admin_pannel/src/models/data_model.dart';
import 'package:flutter_application_radisha_admin_pannel/src/models/job_model/job_models.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/utils/responsive_layout/responsive_layout.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView({super.key});

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  // Timer? _timer;

  List<DataModel> content = [
    DataModel(
        date: 'September 12-22',
        title: 'Enjoy hassle-free service this season!',
        descp:
            'Skilled Handyman at Your Doorstep - Choose from a range of trusted and verified professionals.Book Now and Experience Top-Notch Services!'),
    DataModel(
        date: 'September 13-22',
        title: 'Enjoy hassle-free service this season!',
        descp:
            'Skilled Handyman at Your Doorstep - Choose from a range of trusted and verified professionals.Book Now and Experience Top-Notch Services!'),
    DataModel(
        date: 'September 14-22',
        title: 'Enjoy hassle-free service this season!',
        descp:
            'Skilled Handyman at Your Doorstep - Choose from a range of trusted and verified professionals.Book Now and Experience Top-Notch Services!'),
  ];

  List imgList = [
    AppImages.homeBgImage,
    AppImages.homeBgImage,
    AppImages.homeBgImage,
  ];

  void _moveToLeft() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _moveToRight() {
    if (_currentIndex < imgList.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ResponsiveLayout(
      mobileLayout: Scaffold(
          backgroundColor: AppColor.bdColor,
          body: DefaultTabController(
            length: 4, // Number of tabs
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  indicatorPadding: EdgeInsets.zero,
                  labelColor: Colors.green, // Text color when selected
                  unselectedLabelColor:
                      Colors.black, // Text color when unselected
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        23), // Border radius of the selected tab
                    color: Colors
                        .transparent, // Keeps the tab background transparent
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(
                      child: Container(
                        height: 46,
                        width: 116,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              23), // Border radius for each tab
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                          ), // Grey border for unselected tab
                        ),
                        alignment: Alignment.center,
                        child: const Text('Overview'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 46,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              23), // Border radius for each tab
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                          ), // Grey border for unselected tab
                        ),
                        alignment: Alignment.center,
                        child: const Text('Pending Radisha'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 46,
                        width: 116,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              23), // Border radius for each tab
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                          ), // Grey border for unselected tab
                        ),
                        alignment: Alignment.center,
                        child: const Text('Active Jobs'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 46,
                        width: 116,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              23), // Border radius for each tab
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                          ), // Grey border for unselected tab
                        ),
                        alignment: Alignment.center,
                        child: const Text('Recent Jobs'),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SizedBox(
                        height: size.height,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: CarouselSlider(
                                  items: imgList.asMap().entries.map((entry) {
                                    return Stack(
                                      children: [
                                        Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              gradient: LinearGradient(colors: [
                                                Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ])),
                                        ),
                                        Center(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 16,
                                                right: 16,
                                                top: 30,
                                                bottom: 10),
                                            decoration: BoxDecoration(
                                                // color: Colors.black54, // Semi-transparent background for better visibility
                                                // borderRadius: BorderRadius.circular(8),
                                                ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // SizedBox(height: 20,),
                                                Text(
                                                    content[_currentIndex]
                                                        .date, // You can replace this with custom text for each image
                                                    style: textTheme(context)
                                                        .labelMedium!
                                                        .copyWith(
                                                            color: colorScheme(
                                                                    context)
                                                                .onPrimary,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            letterSpacing: 0,
                                                            fontSize:
                                                                size.width *
                                                                    0.02)),
                                                Container(),
                                                Container(),
                                                Container(),
                                                Container(),
                                                // SizedBox(height: 20,),
                                                Text(
                                                    content[_currentIndex]
                                                        .title, // You can replace this with custom text for each image
                                                    style: textTheme(context)
                                                        .labelMedium!
                                                        .copyWith(
                                                            color: colorScheme(
                                                                    context)
                                                                .onPrimary,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            letterSpacing: 0,
                                                            fontSize:
                                                                size.width *
                                                                    0.027)),
                                                // SizedBox(height: 10,),
                                                Text(
                                                    content[_currentIndex]
                                                        .descp, // You can replace this with custom text for each image
                                                    style: textTheme(context)
                                                        .labelMedium!
                                                        .copyWith(
                                                            color: colorScheme(
                                                                    context)
                                                                .onPrimary,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 0,
                                                            fontSize:
                                                                size.width *
                                                                    0.015)),
                                                Container(),
                                                Container(),
                                                Container(),
                                                Container(),
                                                Container(),
                                                Container(),
                                                Container(),
                                                // SizedBox(height: 10,),
                                                SizedBox(
                                                  width: size.width * 0.21,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Define the button action
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      padding: EdgeInsets.zero,
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .surface,
                                                      minimumSize:
                                                          const Size(130, 35),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      elevation: 2,
                                                    ),
                                                    child: Text(
                                                      'Get Started',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge
                                                          ?.copyWith(
                                                            fontSize: 9,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onSurface
                                                                .withOpacity(
                                                                    0.7),
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                  carouselController: _controller,
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    aspectRatio: 2.0,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _current = index;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Smooth Indicator
                              Center(
                                child: AnimatedSmoothIndicator(
                                  activeIndex: _current,
                                  count: imgList.length,
                                  effect: ExpandingDotsEffect(
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    activeDotColor:
                                        colorScheme(context).primary,
                                    dotColor: colorScheme(context).onPrimary,
                                  ),
                                  onDotClicked: (index) {
                                    _controller.animateToPage(index);
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text("Dashboard",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                          fontSize: size.width * 0.06,
                                          letterSpacing: 0)),
                              const SizedBox(height: 10),
                              const DashboardOverviewMobile(), // Your custom widget
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Projects History',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(letterSpacing: 0),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  // Replace the placeholders with your custom `desktopLayoutCard` widgets
                                  mobileLayoutCard('Washing', AppColor.appGreen,
                                      0.8, context),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  mobileLayoutCard('Cleaning', AppColor.appRed,
                                      0.6, context),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  mobileLayoutCard(
                                      'Gardening',
                                      AppColor.appYellow,
                                      0.8,
                                      context), // Your custom widget
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      buildPendingApprovalsTabContent(size.width),
                      buildIActiveJobsTabContent(size.width),
                      Container(
                        color: colorScheme(context).surface,
                        child: const Center(child: Text('Recent Activity')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      tabletLayout: Scaffold(
          backgroundColor: AppColor.bdColor,
          body: DefaultTabController(
            length: 4, // Number of tabs
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  indicatorPadding: EdgeInsets.zero,
                  labelColor: Colors.green, // Text color when selected
                  unselectedLabelColor:
                      Colors.black, // Text color when unselected
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        23), // Border radius of the selected tab
                    color: Colors
                        .transparent, // Keeps the tab background transparent
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(
                      child: Container(
                        height: 46,
                        width: 116,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              23), // Border radius for each tab
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                          ), // Grey border for unselected tab
                        ),
                        alignment: Alignment.center,
                        child: const Text('Overview'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 46,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              23), // Border radius for each tab
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                          ), // Grey border for unselected tab
                        ),
                        alignment: Alignment.center,
                        child: const Text('Pending Radisha'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 46,
                        width: 116,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              23), // Border radius for each tab
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                          ), // Grey border for unselected tab
                        ),
                        alignment: Alignment.center,
                        child: const Text('Active Jobs'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 46,
                        width: 116,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              23), // Border radius for each tab
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                          ), // Grey border for unselected tab
                        ),
                        alignment: Alignment.center,
                        child: const Text('Recent Jobs'),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SizedBox(
                        height: size.height,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context).colorScheme.secondary,
                                      Theme.of(context).colorScheme.primary,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.09),
                                      height: 240,
                                      child: PageView.builder(
                                        controller: _pageController,
                                        itemCount: imgList.length,
                                        onPageChanged: (index) {
                                          setState(() {
                                            _currentIndex = index;
                                          });
                                        },
                                        itemBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 35,
                                              ),
                                              Text(
                                                  content[_currentIndex]
                                                      .date, // You can replace this with custom text for each image
                                                  style: textTheme(context)
                                                      .labelMedium!
                                                      .copyWith(
                                                          color: colorScheme(
                                                                  context)
                                                              .onPrimary,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 0,
                                                          fontSize: size.width *
                                                              0.014)),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Text(
                                                  content[_currentIndex]
                                                      .title, // You can replace this with custom text for each image
                                                  style: textTheme(context)
                                                      .labelMedium!
                                                      .copyWith(
                                                          color: colorScheme(
                                                                  context)
                                                              .onPrimary,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 0,
                                                          fontSize: size.width *
                                                              0.025)),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                  content[_currentIndex]
                                                      .descp, // You can replace this with custom text for each image
                                                  style: textTheme(context)
                                                      .labelMedium!
                                                      .copyWith(
                                                          color: colorScheme(
                                                                  context)
                                                              .onPrimary,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 0,
                                                          fontSize: size.width *
                                                              0.013)),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              SizedBox(
                                                width: size.width * 0.14,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // Define the button action
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .surface,
                                                    minimumSize:
                                                        const Size(150, 45),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    elevation: 2,
                                                  ),
                                                  child: Text(
                                                    'Get Started',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          fontSize: 10,
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .onSurface
                                                              .withOpacity(0.7),
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    // Arrow buttons
                                    Positioned(
                                      top: 90,
                                      left: 10,
                                      child: CircleAvatar(
                                        radius: size.width * 0.02,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .outlineVariant,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_ios_new_sharp,
                                            size: size.width * 0.017,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                          onPressed: _moveToLeft,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 90,
                                      right: 10,
                                      child: CircleAvatar(
                                        radius: size.width * 0.02,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .outlineVariant,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: size.width * 0.017,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                          onPressed: _moveToRight,
                                        ),
                                      ),
                                    ),
                                    // Overlay Text
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text("Dashboard",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                              const SizedBox(height: 20),
                              const DashboardOverviewTablet(), // Your custom widget
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Projects History',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(letterSpacing: 0),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // Replace the placeholders with your custom `desktopLayoutCard` widgets
                                      tabletLayoutCard('Washing',
                                          AppColor.appGreen, 0.8, context),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      tabletLayoutCard('Cleaning',
                                          AppColor.appRed, 0.6, context),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      tabletLayoutCard(
                                          'Gardening',
                                          AppColor.appYellow,
                                          0.8,
                                          context), // Your custom widget
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      buildPendingApprovalsTabContent(size.width),
                      buildIActiveJobsTabContent(size.width),
                      Container(
                        color: colorScheme(context).surface,
                        child: const Center(child: Text('Recent Activity')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      desktopLayout: _desktopLayout(context),
    );
  }

  Widget statusCell(String status) {
    Color statusColor;
    if (status == 'Active') {
      statusColor = AppColor.appGreen.withOpacity(0.1);
    } else if (status == 'In Progress') {
      statusColor = AppColor.appYellow.withOpacity(0.1);
    } else if (status == 'Suspended') {
      statusColor = AppColor.appRed.withOpacity(0.1);
    } else {
      statusColor = Colors.transparent;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        decoration: BoxDecoration(
          color: statusColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          status,
          style: TextStyle(
            color: status == 'Active'
                ? AppColor.appGreen
                : status == 'In Progress'
                    ? AppColor.appYellow
                    : statusColor == 'Suspended'
                        ? AppColor.appRed
                        : AppColor.lightBlack.withOpacity(0.6),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  TableRow buildTableRow(
    String sr,
    String name,
    String email,
    String date,
    String status,
  ) {
    return TableRow(
      children: [
        tableCell(sr),
        tableCell(name),
        tableCell(email),
        tableCell(date),
        statusCell(status),
        actionButtons(status),
      ],
    );
  }

  // Action buttons for View and Suspend/Activate
  Widget actionButtons(String status, {bool showSingleButton = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showSingleButton)
            // Show only the single button with gradient when showSingleButton is true
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme(context).secondary,
                    colorScheme(context).primary,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Text(
                  'View', // The label for the single button
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          else ...[
            // View Button (Will always be shown when showSingleButton is false)
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.green),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'View',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            // Suspend/Active Button (Shown only when showSingleButton is false)
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme(context).secondary,
                    colorScheme(context).primary,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Suspended',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget buildIActiveJobsTabContent(double width) {
    return Column(
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme(context).surface,
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(170), // SR column
                  1: FixedColumnWidth(170), // Client Name column
                  2: FixedColumnWidth(170), // Job Title column
                  3: FixedColumnWidth(170), // Radisha Name column
                  4: FixedColumnWidth(170), // Last Update column
                  5: FixedColumnWidth(170), // Status column
                  6: FixedColumnWidth(170), // Action column
                },
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: AppColor.greyColor,
                    ),
                    children: [
                      tableCell('SR.', isHeader: true),
                      tableCell('JOB TITLE', isHeader: true),
                      tableCell('CLIENT NAME', isHeader: true),
                      tableCell('RADISHA NAME', isHeader: true),
                      tableCell('Last Update', isHeader: true),
                      tableCell('STATUS',
                          isHeader: true), // Added Status header
                      tableCell('ACTION', isHeader: true),
                    ],
                  ),
                  const TableRow(
                    children: [
                      SizedBox(height: 1), // Divider after header row
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                    ],
                  ),
                  ...buildIActiveRow(activeJobs),
                  // Add more rows as needed
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: AppColor.lightBlack.withOpacity(0.2)),
                  color: colorScheme(context).surface,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: AppColor.lightBlack.withOpacity(0.5),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Prev.Date',
                        style: textTheme(context).bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColor.lightBlack.withOpacity(0.5),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: AppColor.lightBlack.withOpacity(0.2)),
                  color: colorScheme(context).surface,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Next Date',
                        style: textTheme(context).bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColor.lightBlack.withOpacity(0.5),
                            ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: AppColor.lightBlack.withOpacity(0.5),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<TableRow> buildIActiveRow(List<JobModel> jobs) {
    return jobs.map((job) {
      return TableRow(
        children: [
          tableCell(job.srNo.toString()), // Convert srNo to string
          tableCell(job.jobTitle ?? ''),
          tableCell(job.clientName ?? ''),
          tableCell(job.radishaName ?? ''),
          tableCell(job.date ?? ''),
          tableCell(job.jobStatus ?? ''), // Assuming disputeReason for status
          actionButton('View'), // Add your action buttons here
        ],
      );
    }).toList();
  }

  Widget buildPendingApprovalsTabContent(double width) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme(context).surface,
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(170), // SR column
                  1: FixedColumnWidth(170), // Client Name column
                  2: FixedColumnWidth(170), // Job Title column
                  3: FixedColumnWidth(170), // Radisha Name column
                  4: FixedColumnWidth(170), // Last Update column
                  5: FixedColumnWidth(170), // Status column
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: colorScheme(context).surface,
                    ),
                    children: [
                      tableCell('SR.', isHeader: true),
                      tableCell('RADISHA NAME', isHeader: true),
                      tableCell('SKILLS', isHeader: true),
                      tableCell('REGISTERS DATE', isHeader: true),
                      tableCell('DOCUMENT', isHeader: true),
                      tableCell('ACTION', isHeader: true),
                    ],
                  ),
                  const TableRow(
                    children: [
                      SizedBox(height: 1), // Divider after header row
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                    ],
                  ),
                  // Example Data Rows
                  buildTableRow(
                    '00001',
                    'Christine Brooks',
                    'Cleaning,Yard Work',
                    '2024-09-17',
                    'yes',
                  ),
                  buildTableRow(
                    '00002',
                    'Christine Brooks',
                    'Heavy Lifting',
                    '2024-09-17',
                    'Yes',
                  ),
                  buildTableRow(
                    '00003',
                    'Christine Brooks',
                    'Gardening Garden',
                    '2024-09-17',
                    'No',
                  ),
                  buildTableRow(
                    '00004',
                    'Christine Brooks',
                    'Gardening Garden',
                    '2024-09-17',
                    'No',
                  ),
                  buildTableRow(
                    '00005',
                    'Christine Brooks',
                    'Gardening Garden',
                    '2024-09-17',
                    'Yes',
                  ),
                  buildTableRow(
                    '00006',
                    'Christine Brooks',
                    'Gardening Garden',
                    '2024-09-17',
                    'No',
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              // Adjust width to fit the screen
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.lightBlack.withOpacity(0.2)),
                color: colorScheme(context).surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: AppColor.lightBlack.withOpacity(0.5),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Prev.Date',
                      style: textTheme(context).bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColor.lightBlack.withOpacity(0.5),
                          ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              // Adjust width to fit the screen
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.lightBlack.withOpacity(0.2)),
                color: colorScheme(context).surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next Date',
                      style: textTheme(context).bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColor.lightBlack.withOpacity(0.5),
                          ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: AppColor.lightBlack.withOpacity(0.5),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  // Action buttons for View and Suspend/Activate
  Widget actionButton(
    String status,
  ) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      // Show only the single button with gradient when showSingleButton is true
      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorScheme(context).secondary,
              colorScheme(context).primary,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            'View', // The label for the single button
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      )
    ]);
  }

  Widget _desktopLayout(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColor.bdColor,
        body: DefaultTabController(
          length: 4, // Number of tabs
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                labelColor: Colors.green, // Text color when selected
                unselectedLabelColor:
                    Colors.black, // Text color when unselected
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      23), // Border radius of the selected tab
                  color: Colors
                      .transparent, // Keeps the tab background transparent
                ),
                indicatorSize: TabBarIndicatorSize.label,
                tabAlignment: TabAlignment.start,
                tabs: [
                  Tab(
                    child: Container(
                      height: 46,
                      width: 116,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            23), // Border radius for each tab
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withOpacity(0.2),
                        ), // Grey border for unselected tab
                      ),
                      alignment: Alignment.center,
                      child: const Text('Overview'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 46,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            23), // Border radius for each tab
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withOpacity(0.2),
                        ), // Grey border for unselected tab
                      ),
                      alignment: Alignment.center,
                      child: const Text('Pending Radisha'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 46,
                      width: 116,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            23), // Border radius for each tab
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withOpacity(0.2),
                        ), // Grey border for unselected tab
                      ),
                      alignment: Alignment.center,
                      child: const Text('Active Jobs'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 46,
                      width: 116,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            23), // Border radius for each tab
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withOpacity(0.2),
                        ), // Grey border for unselected tab
                      ),
                      alignment: Alignment.center,
                      child: const Text('Recent Jobs'),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          // height: size.height,
                          width: size.width * 0.63,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Container(
                                  // height: size.height * 0.46,
                                  width: size.width * 0.6,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Theme.of(context).colorScheme.secondary,
                                        Theme.of(context).colorScheme.primary,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.06),
                                        height: 240,
                                        child: PageView.builder(
                                          controller: _pageController,
                                          itemCount: imgList.length,
                                          onPageChanged: (index) {
                                            setState(() {
                                              _currentIndex = index;
                                            });
                                          },
                                          itemBuilder: (context, index) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    content[_currentIndex]
                                                        .date, // You can replace this with custom text for each image
                                                    style: textTheme(context)
                                                        .labelMedium!
                                                        .copyWith(
                                                            color: colorScheme(
                                                                    context)
                                                                .onPrimary,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 0,
                                                            fontSize:
                                                                size.width *
                                                                    0.01)),
                                                SizedBox(
                                                  height: size.height * 0.03,
                                                ),
                                                Text(
                                                    content[_currentIndex]
                                                        .title, // You can replace this with custom text for each image
                                                    style: textTheme(context)
                                                        .labelMedium!
                                                        .copyWith(
                                                            color: colorScheme(
                                                                    context)
                                                                .onPrimary,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 0,
                                                            fontSize:
                                                                size.width *
                                                                    0.02)),
                                                Text(
                                                    content[_currentIndex]
                                                        .descp, // You can replace this with custom text for each image
                                                    style: textTheme(context)
                                                        .labelMedium!
                                                        .copyWith(
                                                            color: colorScheme(
                                                                    context)
                                                                .onPrimary,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 0,
                                                            fontSize:
                                                                size.width *
                                                                    0.01)),
                                                SizedBox(
                                                  height: 45,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Define the button action
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .surface,
                                                      minimumSize:
                                                          const Size(150, 45),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      elevation: 2,
                                                    ),
                                                    child: Text(
                                                      'Get Started',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge
                                                          ?.copyWith(
                                                            fontSize:
                                                                size.width *
                                                                    0.008,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onSurface
                                                                .withOpacity(
                                                                    0.7),
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      // Arrow buttons
                                      Positioned(
                                        top: 100,
                                        left: 10,
                                        child: CircleAvatar(
                                          radius: size.width * 0.015,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .outlineVariant,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_ios_new_sharp,
                                              size: size.width * 0.011,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
                                            ),
                                            onPressed: _moveToLeft,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 100,
                                        right: 10,
                                        child: CircleAvatar(
                                          radius: size.width * 0.015,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .outlineVariant,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              size: size.width * 0.011,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
                                            ),
                                            onPressed: _moveToRight,
                                          ),
                                        ),
                                      ),
                                      // Overlay Text
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text("Dashboard",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge),
                                const SizedBox(height: 20),
                                // Replace this placeholder with your actual `DashboardOverview` widget
                                const DashboardOverview(), // Your custom widget
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Projects History',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(letterSpacing: 0),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  // Replace the placeholders with your custom `desktopLayoutCard` widgets
                                  desktopLayoutCard('Washing',
                                      AppColor.appGreen, 0.8, context),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  desktopLayoutCard('Cleaning', AppColor.appRed,
                                      0.6, context),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  desktopLayoutCard(
                                      'Gardening',
                                      AppColor.appYellow,
                                      0.8,
                                      context), // Your custom widget
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    buildPendingApprovalsTabContent(size.width),
                    buildIActiveJobsTabContent(size.width),
                    Container(
                      color: colorScheme(context).surface,
                      child: const Center(child: Text('Recent Activity')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

Widget desktopLayoutCard(
    String name, Color progressColor, double progress, BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Container(
    // width: size.width * 0.25,
    padding: EdgeInsets.all(size.width * 0.007),
    decoration: BoxDecoration(
        color: colorScheme(context).onPrimary,
        borderRadius: BorderRadius.circular(14)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ongoing Project',
          style: textTheme(context).labelSmall!.copyWith(letterSpacing: 0),
        ),
        SizedBox(
          height: size.height * 0.005,
        ),
        Text(
          name,
          style: textTheme(context).titleLarge!.copyWith(
              letterSpacing: 0,
              fontSize: size.width * 0.01,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        LinearPercentIndicator(
          width: size.width * 0.15,
          alignment: MainAxisAlignment.start,
          lineHeight: 7,
          backgroundColor: AppColor.bdColor,
          progressColor: progressColor,
          barRadius: const Radius.circular(8),
          percent: progress,
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text('90 % Complete',
            style: textTheme(context).labelSmall!.copyWith(letterSpacing: 0)),
        SizedBox(
          height: size.height * 0.007,
        ),
        Divider(
          color: AppColor.bdColor,
          thickness: 2,
        ),
        SizedBox(
          height: size.height * 0.007,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(TextSpan(
                text: 'Start Date :',
                style: textTheme(context).labelSmall!.copyWith(
                    color: colorScheme(context).outline,
                    fontSize: size.width * 0.007,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: ' 10 Jan',
                    style: textTheme(context).labelSmall!.copyWith(
                        fontSize: size.width * 0.007,
                        color: colorScheme(context).outline,
                        letterSpacing: 0),
                  )
                ])),
            Text.rich(TextSpan(
                text: 'End Date : ',
                style: textTheme(context).labelSmall!.copyWith(
                    color: colorScheme(context).outline,
                    fontSize: size.width * 0.007,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: '29 Jan',
                    style: textTheme(context).labelSmall!.copyWith(
                        fontSize: size.width * 0.007,
                        color: colorScheme(context).outline,
                        letterSpacing: 0),
                  )
                ])),
          ],
        )
      ],
    ),
  );
}

Widget tabletLayoutCard(
    String name, Color progressColor, double progress, BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: colorScheme(context).onPrimary,
        borderRadius: BorderRadius.circular(14)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ongoing Project',
          style: textTheme(context).labelSmall!.copyWith(letterSpacing: 0),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          name,
          style: textTheme(context).titleLarge!.copyWith(
              letterSpacing: 0,
              fontSize: size.width * 0.02,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 15,
        ),
        LinearPercentIndicator(
          // width: size.width * 0.16,
          alignment: MainAxisAlignment.start,
          lineHeight: 7,
          backgroundColor: AppColor.bdColor,
          progressColor: progressColor,
          barRadius: const Radius.circular(8),
          percent: progress,
        ),
        SizedBox(
          height: 15,
        ),
        Text('90 % Complete',
            style: textTheme(context)
                .labelSmall!
                .copyWith(letterSpacing: 0, fontSize: size.width * 0.015)),
        SizedBox(
          height: 15,
        ),
        Divider(
          color: AppColor.bdColor,
          thickness: 2,
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(TextSpan(
                text: 'Start Date :',
                style: textTheme(context).labelSmall!.copyWith(
                    color: colorScheme(context).outline,
                    fontSize: size.width * 0.017,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: ' 10 Jan',
                    style: textTheme(context).labelSmall!.copyWith(
                        fontSize: size.width * 0.017,
                        color: colorScheme(context).outline,
                        letterSpacing: 0),
                  )
                ])),
            Text.rich(TextSpan(
                text: 'End Date : ',
                style: textTheme(context).labelSmall!.copyWith(
                    color: colorScheme(context).outline,
                    fontSize: size.width * 0.017,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: '29 Jan',
                    style: textTheme(context).labelSmall!.copyWith(
                        fontSize: size.width * 0.017,
                        color: colorScheme(context).outline,
                        letterSpacing: 0),
                  )
                ])),
          ],
        )
      ],
    ),
  );
}

Widget mobileLayoutCard(
    String name, Color progressColor, double progress, BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
        color: colorScheme(context).onPrimary,
        borderRadius: BorderRadius.circular(14)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ongoing Project',
          style: textTheme(context)
              .labelSmall!
              .copyWith(fontSize: size.width * 0.03, letterSpacing: 0),
        ),
        SizedBox(
          height: size.height * 0.005,
        ),
        Text(
          name,
          style: textTheme(context).titleLarge!.copyWith(
              letterSpacing: 0,
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        LinearPercentIndicator(
          // width: size.width * 0.16,
          alignment: MainAxisAlignment.start,
          lineHeight: 7,
          backgroundColor: AppColor.bdColor,
          progressColor: progressColor,
          barRadius: const Radius.circular(8),
          percent: progress,
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text('90 % Complete',
            style: textTheme(context).labelSmall!.copyWith(letterSpacing: 0)),
        SizedBox(
          height: size.height * 0.007,
        ),
        Divider(
          color: AppColor.bdColor,
          thickness: 2,
        ),
        SizedBox(
          height: size.height * 0.007,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(TextSpan(
                text: 'Start Date :',
                style: textTheme(context).labelSmall!.copyWith(
                    color: colorScheme(context).outline,
                    fontSize: size.width * 0.025,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: ' 10 Jan',
                    style: textTheme(context).labelSmall!.copyWith(
                        fontSize: size.width * 0.025,
                        color: colorScheme(context).outline,
                        letterSpacing: 0),
                  )
                ])),
            Text.rich(TextSpan(
                text: 'End Date : ',
                style: textTheme(context).labelSmall!.copyWith(
                    color: colorScheme(context).outline,
                    fontSize: size.width * 0.025,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: '29 Jan',
                    style: textTheme(context).labelSmall!.copyWith(
                        fontSize: size.width * 0.025,
                        color: colorScheme(context).outline,
                        letterSpacing: 0),
                  )
                ])),
          ],
        )
      ],
    ),
  );
}

// Helper function to build table cells with consistent style
Widget tableCell(String text, {bool isHeader = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: 8, vertical: 20), // Consistent padding
    child: Text(
      text,
      style: TextStyle(
        color: isHeader
            ? AppColor.lightBlack
                .withOpacity(0.9) // Set the color for the header text here
            : AppColor.lightBlack.withOpacity(0.7),
        fontWeight: isHeader ? FontWeight.bold : FontWeight.w600,
      ),
      textAlign: TextAlign.center, // Align text centrally
    ),
  );
}
