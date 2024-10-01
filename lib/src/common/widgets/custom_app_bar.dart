import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_colors.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/custom_textfield.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/utils/responsive_layout/responsive_layout.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/dashboard/provider/dash_board_provider.dart';

class CustomHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String userName;
  final String userRole;
  final String profileImageUrl;
  final Function(String) onSearchChanged;
  final VoidCallback onNotificationPressed;

  const CustomHeader({
    Key? key,
    required this.scaffoldKey,
    required this.userName,
    required this.userRole,
    required this.profileImageUrl,
    required this.onSearchChanged,
    required this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveLayout(
      mobileLayout: _buildMobileHeader(context),
      tabletLayout: _buildTabletHeader(context),
      desktopLayout: _buildDesktopHeader(context),
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          Consumer<DashboardProvider>(
            builder: (context, dashboardProvider, child) {
              return Text(
                _getTitleFromIndex(dashboardProvider.selectedIndex),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
          Icon(
            Icons.search,
            color: AppColor.hintText,
          ),

          // Notification Icon
          Stack(
            children: [
              const Icon(Icons.notifications),
              const Positioned(
                right: 2,
                top: 2,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 16,
            backgroundImage: CachedNetworkImageProvider(profileImageUrl),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletHeader(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          Consumer<DashboardProvider>(
            builder: (context, dashboardProvider, child) {
              return Text(
                _getTitleFromIndex(dashboardProvider.selectedIndex),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
          SizedBox(
            width: size.width * 0.4,
            height: 40,
            child: const CustomTextFormField(
              prefixIcon: Icon(
                Icons.search,
                color: AppColor.hintText,
              ),
              borderRadius: 20,
              fillColor: AppColor.greyColor,
              hint: 'Search',
              hintColor: AppColor.hintText,
            ),
          ),

          // Notification Icon
          Stack(children: [
            const Icon(Icons.notifications),
            const Positioned(
              right: 2,
              top: 2,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Colors.red,
              ),
            ),
          ]),
          CircleAvatar(
            radius: 18,
            backgroundImage: CachedNetworkImageProvider(profileImageUrl),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopHeader(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Consumer<DashboardProvider>(
              builder: (context, dashboardProvider, child) {
                return Text(
                  _getTitleFromIndex(dashboardProvider.selectedIndex),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                  overflow: TextOverflow.ellipsis,
                );
              },
            ),
          ),
          SizedBox(
            width: size.width * 0.4,
            height: 40,
            child: const CustomTextFormField(
              prefixIcon: Icon(
                Icons.search,
                color: AppColor.hintText,
              ),
              borderRadius: 20,
              fillColor: AppColor.greyColor,
              hint: 'Search',
              hintColor: AppColor.hintText,
            ),
          ),
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: onNotificationPressed,
                  ),
                  Positioned(
                    right: 2,
                    top: 2,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 18,
                backgroundImage: CachedNetworkImageProvider(profileImageUrl),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.8),
                        ),
                  ),
                  Text(
                    userRole,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.4),
                        ),
                  ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ],
      ),
    );
  }

  String _getTitleFromIndex(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'User Management';
      case 2:
        return 'Job Management';
      case 3:
        return 'Payments';
      case 4:
        return 'Reports & Analytics';
      case 5:
        return 'Profile Management';
      case 6:
        return 'Settings';
      default:
        return 'Home';
    }
  }
}
