import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_images.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/home/widgets/dash_board_card.dart';

class DashboardOverview extends StatelessWidget {
  const DashboardOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        DashboardCard(
          title: 'Total Clients',
          value: '40,689',
          image: AppIcons.personIcon,
          detailText: '8.5% Up from yesterday',
          icon: Icons.trending_down,
        ),
        DashboardCard(
          title: 'Total Radisha',
          value: '40,999',
          image: AppIcons.personIcon,
          detailText: '8.5% Up from yesterday',
          icon: Icons.trending_down,
        ),
        DashboardCard(
          title: 'Active Jobs',
          value: '193',
          image: AppIcons.jobGreen,
          detailText: '8.5% Up from yesterday',
          icon: Icons.trending_down,
        ),
        DashboardCard(
          title: 'Pending Jobs',
          value: '193',
          image: AppIcons.jobYellow,
          detailText: 'Jobs Awaits Approval',
          icon: Icons.trending_down,
        ),
        DashboardCard(
          title: 'Completed Payements',
          value: '193',
          image: AppIcons.paymentGreen,
          detailText: 'Transaction Overview',
          icon: Icons.trending_down,
        ),
        DashboardCard(
          title: 'Pending Payement',
          value: '193',
          image: AppIcons.paymentYellow,
          detailText: 'Transaction Overview',
          icon: Icons.trending_down,
        ),
      ],
    );
  }
}
