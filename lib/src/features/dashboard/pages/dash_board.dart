// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_images.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/widgets/custom_app_bar.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/general_setting/pages/general_setting.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/home/home_page.dart';

import 'package:flutter_application_radisha_admin_pannel/src/features/job_managemnet/pages/job_management.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/profile_management/pages/profile_management.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/reports_analytics/pages/reports_analytics.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/user_management/pages/user_management.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/dashboard/provider/dash_board_provider.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/utils/responsive_layout/responsive_layout.dart';

import 'package:provider/provider.dart';

String radishaLogo = 'assets/images/radisha_logo.png';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var height, wisth;
  final GlobalKey<ScaffoldState> _mobileScaffoldKey =
      GlobalKey<ScaffoldState>();

  final GlobalKey<ScaffoldState> _tabletScaffoldKey =
      GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _desktopScaffoldKey =
      GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    const CustomTabView(),
    const AdminUserManagementPage(),
    const JobManagement(),
    _buildScreen('Payements', Colors.orange, Colors.white, 24),
    const ReportsAndAnalyticsPage(),
    const ProfileManagementPage(),
    const GeneralSettingPage(),
    _buildScreen('Logout Content', Colors.black, Colors.white, 24),
  ];

  static Widget _buildScreen(
      String text, Color bgColor, Color textColor, double fontSize) {
    return Container(
      color: bgColor,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ResponsiveLayout(
        mobileLayout: Scaffold(
          key: _mobileScaffoldKey,
          drawer: Drawer(
            width: width * 0.6,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Center(
                    child: Image.asset(AppImages.radishaLogo,
                        height: height * 0.25,
                        width: width * 0.35,
                        fit: BoxFit.contain),
                  ),
                ),
                _buildDrawerItem(context, 'Home', Icons.home_filled, 0),
                _buildDrawerItem(context, 'User Management', Icons.person, 1),
                _buildDrawerItem(
                    context, 'Job Management', Icons.work_outlined, 2),
                _buildDrawerItem(context, 'Payment', Icons.payment_outlined, 3),
                _buildDrawerItem(
                    context, 'Reports & Analytics', Icons.bar_chart, 4),
                _buildDrawerItem(
                    context, 'Profile Management', Icons.person, 5),
                _buildDrawerItem(context, 'Settings', Icons.settings, 6),
                _buildDrawerItem(context, 'Log Out', Icons.logout, 7),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                scaffoldKey: _mobileScaffoldKey,
                userName: 'Jony',
                userRole: 'Admin',
                profileImageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm-pLYubY8V3H2qu3cXvLXCKVIDGyDXgeUkA&s',
                onSearchChanged: (value) {},
                onNotificationPressed: () {
                  // handle notification icon press
                },
              ),
              Expanded(
                child: Consumer<DashboardProvider>(
                  builder: (context, provider, child) {
                    return _screens[provider.selectedIndex];
                  },
                ),
              ),
            ],
          ),
        ),
        tabletLayout: Scaffold(
          key: _tabletScaffoldKey,
          drawer: Drawer(
            width: width * 0.35,
            child: SizedBox(
              height: height,
              width: width * 0.35,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Center(
                      child: Image.asset(AppImages.radishaLogo,
                          height: height * 0.25,
                          width: width * 0.35,
                          fit: BoxFit.contain),
                    ),
                  ),
                  _buildDrawerItem(context, 'Home', Icons.home_filled, 0),
                  _buildDrawerItem(context, 'User Management', Icons.person, 1),
                  _buildDrawerItem(
                      context, 'Job Management', Icons.work_outlined, 2),
                  _buildDrawerItem(
                      context, 'Payment', Icons.payment_outlined, 3),
                  _buildDrawerItem(
                      context, 'Reports & Analytics', Icons.bar_chart, 4),
                  _buildDrawerItem(
                      context, 'Profile Management', Icons.person, 5),
                  _buildDrawerItem(context, 'Settings', Icons.settings, 6),
                  _buildDrawerItem(context, 'Log Out', Icons.logout, 7),
                ],
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                scaffoldKey: _tabletScaffoldKey,
                userName: 'Jony Roy',
                userRole: 'Admin',
                profileImageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm-pLYubY8V3H2qu3cXvLXCKVIDGyDXgeUkA&s',
                onSearchChanged: (value) {
                  // handle search input change
                },
                onNotificationPressed: () {
                  // handle notification icon press
                },
              ),
              Expanded(
                child: Consumer<DashboardProvider>(
                  builder: (context, provider, child) {
                    return _screens[provider.selectedIndex];
                  },
                ),
              ),
            ],
          ),
        ),
        desktopLayout: Scaffold(
            body: Row(children: [
          Expanded(
            flex: 1,
            child: Container(
              color: colorScheme(context).surface,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration:
                        BoxDecoration(color: colorScheme(context).surface),
                    child: Center(
                      child: Image.asset(AppImages.radishaLogo,
                          height: height * 0.3,
                          width: width * 0.35,
                          fit: BoxFit.contain),
                    ),
                  ),
                  _buildDrawerItem(context, 'Home', Icons.home_filled, 0),
                  _buildDrawerItem(context, 'User Management', Icons.person, 1),
                  _buildDrawerItem(
                      context, 'Job Management', Icons.work_outlined, 2),
                  _buildDrawerItem(
                      context, 'Payment', Icons.payment_outlined, 3),
                  _buildDrawerItem(
                      context, 'Reports & Analytics', Icons.bar_chart, 4),
                  _buildDrawerItem(
                      context, 'Profile Management', Icons.person, 5),
                  _buildDrawerItem(context, 'Settings', Icons.settings, 6),
                  _buildDrawerItem(context, 'Log Out', Icons.logout, 7),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(
                  scaffoldKey: _desktopScaffoldKey,
                  userName: 'Jony Roy',
                  userRole: 'Admin',
                  profileImageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm-pLYubY8V3H2qu3cXvLXCKVIDGyDXgeUkA&s',
                  onSearchChanged: (value) {
                    // handle search input change
                  },
                  onNotificationPressed: () {
                    // handle notification icon press
                  },
                ),
                Expanded(
                  child: Consumer<DashboardProvider>(
                    builder: (context, provider, child) {
                      return _screens[provider.selectedIndex];
                    },
                  ),
                ),
              ],
            ),
          ),
        ])));
  }
}

Widget _buildDrawerItem(
    BuildContext context, String title, IconData icon, int index) {
  return Consumer<DashboardProvider>(builder: (context, provider, child) {
    bool isSelected = provider.selectedIndex == index;
    return GestureDetector(
      onTap: () {
        provider.setSelectedIndex(index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: isSelected
            ? BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.teal, Colors.green],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        child: ListTile(
          leading: Icon(icon, color: isSelected ? Colors.white : Colors.black),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
    );
  });
}
