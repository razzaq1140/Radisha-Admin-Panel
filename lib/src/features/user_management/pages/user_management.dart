import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_colors.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/dashboard/provider/dash_board_provider.dart';

import 'package:provider/provider.dart';

class AdminUserManagementPage extends StatefulWidget {
  const AdminUserManagementPage({super.key});

  @override
  State<AdminUserManagementPage> createState() =>
      _AdminUserManagementPageState();
}

class _AdminUserManagementPageState extends State<AdminUserManagementPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 5, // Match length with tab texts
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: SizedBox(
              height: height,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection:
                        Axis.horizontal, // Allow horizontal scrolling
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // TabBar wrapped in a SingleChildScrollView
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: TabBar(
                            controller: _tabController,
                            isScrollable: true,
                            indicatorPadding: EdgeInsets.zero,
                            labelColor:
                                Colors.green, // Text color when selected
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
                                  child: const Text('Clients'),
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
                                  child: const Text('Radisha'),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  height: 46,
                                  width: 170,
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
                                  child: const Text('Pending Approvals'),
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
                                  child: const Text('Suspended Users'),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  height: 46,
                                  width: 156,
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
                                  child: const Text('Deleted Users'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: width *
                                0.2), // Space between TabBar and Add New button
                        // 'Add New' Button
                        Consumer<DashboardProvider>(
                          builder: (context, value, child) => InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    colorScheme(context).secondary,
                                    colorScheme(context).primary,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Text(
                                  'Add New',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      // Disable swipe gesture
                      children: [
                        buildClientTabContent(width),
                        buildRadishaTabContent(width),
                        buildPendingApprovalsTabContent(width),
                        buildSuspendedUserTabContent(width),
                        buildDeleteUserTabContent(width),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadishaTabContent(double width) {
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
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(170), // SR column
                  1: FixedColumnWidth(170), // Client Name column
                  2: FixedColumnWidth(170), // Job Title column
                  3: FixedColumnWidth(170), // Radisha Name column
                  4: FixedColumnWidth(170), // Last Update column
                  5: FixedColumnWidth(170),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: colorScheme(context).surface,
                    ),
                    children: [
                      tableCell('SR.', isHeader: true),
                      tableCell('CLIENT NAME', isHeader: true),
                      tableCell('EMAIL', isHeader: true),
                      tableCell('REGISTER DATE', isHeader: true),
                      tableCell('STATUS', isHeader: true),
                      tableCell('ACTION', isHeader: true),
                    ],
                  ),
                  const TableRow(
                    children: [
                      SizedBox(height: 2), // Divider after header row
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
                    'Cleaning, Yard Work',
                    '2024-09-17',
                    'Active',
                  ),
                  buildTableRow(
                    '00002',
                    'Christine Brooks',
                    'Heavy Lifting',
                    '2024-09-17',
                    'In Progress',
                  ),
                  buildTableRow(
                    '00003',
                    'Christine Brooks',
                    'Gardening Garden',
                    '2024-09-17',
                    'Suspended',
                  ),
                  buildTableRow(
                    '00004',
                    'Christine Brooks',
                    'Gardening Garden',
                    '2024-09-17',
                    'Active',
                  ),
                  buildTableRow(
                    '00005',
                    'Christine Brooks',
                    'Gardening Garden',
                    '2024-09-17',
                    'In Progress',
                  ),
                  buildTableRow(
                    '00006',
                    'Christine Brooks',
                    'Gardening Garden',
                    '2024-09-17',
                    'Active',
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

  Widget buildPendingApprovalsTabContent(double width) {
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

  Widget buildSuspendedUserTabContent(double width) {
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
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(170), // SR column
                  1: FixedColumnWidth(170), // Client Name column
                  2: FixedColumnWidth(170), // Job Title column
                  3: FixedColumnWidth(170), // Radisha Name column
                  4: FixedColumnWidth(170), // Last Update column
                  5: FixedColumnWidth(170),
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
                      SizedBox(height: 2), // Divider after header row
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

  Widget buildDeleteUserTabContent(double width) {
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
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(170), // SR column
                  1: FixedColumnWidth(170), // Client Name column
                  2: FixedColumnWidth(170), // Job Title column
                  3: FixedColumnWidth(170), // Radisha Name column
                  4: FixedColumnWidth(170), // Last Update column
                  5: FixedColumnWidth(170),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: colorScheme(context).surface,
                    ),
                    children: [
                      tableCell('SR.', isHeader: true),
                      tableCell('USER NAME', isHeader: true),
                      tableCell('TYPE', isHeader: true),
                      tableCell('DELETION REASON', isHeader: true),
                      tableCell('DELETION DATE', isHeader: true),
                      tableCell(
                        'ACTION',
                        isHeader: true,
                      ),
                    ],
                  ),
                  const TableRow(
                    children: [
                      SizedBox(height: 2), // Divider after header row
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                      SizedBox(height: 1),
                    ],
                  ),
                  // Use the specialized buildTableRowForDeleteTab for this tab
                  buildTableRowForDeleteTab(
                    '00001',
                    'Christine Brooks',
                    'Client',
                    'Request Deletion',
                    '2024-09-17',
                  ),
                  buildTableRowForDeleteTab(
                    '00002',
                    'Christine Brooks',
                    'Client',
                    'Request Deletion',
                    '2024-09-17',
                  ),
                  buildTableRowForDeleteTab(
                    '00003',
                    'Christine Brooks',
                    'Radisha',
                    'Request Deletion',
                    '2024-09-17',
                  ),
                  buildTableRowForDeleteTab(
                    '00004',
                    'Christine Brooks',
                    'Radisha',
                    'Admin Deletion',
                    '2024-09-17',
                  ),
                  buildTableRowForDeleteTab(
                    '00005',
                    'Christine Brooks',
                    'Radisha',
                    'Admin Deletion',
                    '2024-09-17',
                  ),
                  buildTableRowForDeleteTab(
                    '00006',
                    'Christine Brooks',
                    'Radisha',
                    'Admin Deletion',
                    '2024-09-17',
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

  Widget buildClientTabContent(double width) {
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
                  5: FixedColumnWidth(170), // Action column
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: colorScheme(context).surface,
                    ),
                    children: [
                      tableCell('SR.', isHeader: true),
                      tableCell('CLIENT NAME', isHeader: true),
                      tableCell('EMAIL', isHeader: true),
                      tableCell('REGISTER DATE', isHeader: true),
                      tableCell('STATUS', isHeader: true),
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
                    'Christin@gmail.com',
                    '2024-09-17',
                    'Active',
                  ),
                  buildTableRow(
                    '00002',
                    'Christine Brooks',
                    'Christin@gmail.com',
                    '2024-09-17',
                    'In Progress',
                  ),
                  buildTableRow(
                    '00003',
                    'Christine Brooks',
                    'Christin@gmail.com',
                    '2024-09-17',
                    'Suspended',
                  ),
                  buildTableRow(
                    '00004',
                    'Christine Brooks',
                    'Christin@gmail.com',
                    '2024-09-17',
                    'Active',
                  ),
                  buildTableRow(
                    '00005',
                    'Christine Brooks',
                    'Christin@gmail.com',
                    '2024-09-17',
                    'In Progress',
                  ),
                  buildTableRow(
                    '00006',
                    'Christine Brooks',
                    'Christin@gmail.com',
                    '2024-09-17',
                    'Active',
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

  // Helper function to create each row for the table
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

  // Status cell with different colors based on status
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

// Modify the buildTableRow for buildDeleteUserTabContent
  TableRow buildTableRowForDeleteTab(
    String sr,
    String name,
    String type,
    String deletionReason,
    String deletionDate,
  ) {
    return TableRow(
      children: [
        tableCell(sr),
        tableCell(name),
        tableCell(type),
        tableCell(deletionReason),
        tableCell(deletionDate),
        actionButtons('delete',
            showSingleButton: true), // Only one button shown
      ],
    );
  }
}
