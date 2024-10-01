import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_images.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/home/widgets/dash_board_card.dart';

class DashboardOverviewTablet extends StatelessWidget {
  const DashboardOverviewTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two cards per row
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return DashboardCard(
          titleSize: size.width * 0.02,
          valueSize: size.width * 0.03,
          detailSize: size.width * 0.02,
          circleSize: size.width * 0.03,
          iconSize: size.width * 0.02,
          title: index == 0
              ? 'Total Clients'
              : index == 1
                  ? 'Total Radisha'
                  : index == 2
                      ? 'Active Jobs'
                      : index == 3
                          ? 'Pending Jobs'
                          : index == 4
                              ? 'Completed Payments'
                              : 'Pending Payment',
          value: index == 0
              ? '40,689'
              : index == 1
                  ? '40,999'
                  : '193',
          image: index == 0 || index == 1
              ? AppIcons.personIcon
              : index == 2
                  ? AppIcons.jobGreen
                  : index == 3
                      ? AppIcons.jobYellow
                      : index == 4
                          ? AppIcons.paymentGreen
                          : AppIcons.paymentYellow,
          detailText: index == 0 || index == 1 || index == 2
              ? '8.5% Up from yesterday'
              : 'Transaction Overview',
          icon: Icons.trending_down,
        );
      },
    );
  }
}
