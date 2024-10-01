import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_colors.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/job_managemnet/lists/list.dart';
import 'package:flutter_application_radisha_admin_pannel/src/models/job_model/job_models.dart';

class JobManagement extends StatefulWidget {
  const JobManagement({
    super.key,
  });

  @override
  State<JobManagement> createState() => _JobManagementState();
}

class _JobManagementState extends State<JobManagement>
    with TickerProviderStateMixin {
  TabController? _tabController;
  int currentPage = 0;
  static const int itemsPerPage = 9;

  // Method to build the paginated rows
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
                                child: const Text('All Jobs'),
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
                                child: const Text('In Progress'),
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
                                child: const Text('Completed'),
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
                                child: const Text('Disputes'),
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
                                child: const Text('Active'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          width: width *
                              0.2), // Space between TabBar and Add New button
                      // 'Add New' Button
                      Container(
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
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    // Disable swipe gesture
                    children: [
                      buildAllJobsTabContent(width),
                      buildInProgressTabContent(width),
                      buildICompletedTabContent(width),
                      buildDisputeTabContent(width),
                      buildActiveJobsTabContent(width),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInProgressTabContent(double width) {
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
                        tableCell('LAST UPDATE', isHeader: true),
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
                    ...buildInProgressRows(),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (currentPage == 0) {
                  print("Already on the first page");
                  return;
                }
                setState(() {
                  currentPage--;
                  print("Navigated to page: $currentPage");
                });
              },
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
                        color: currentPage == 0
                            ? AppColor.lightBlack.withOpacity(0.4)
                            : AppColor.lightBlack.withOpacity(0.5),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Prev. Date',
                        style: textTheme(context).bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: currentPage == 0
                                  ? AppColor.lightBlack.withOpacity(0.4)
                                  : AppColor.lightBlack.withOpacity(0.5),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if ((currentPage + 1) * itemsPerPage >= inProgressJobs.length) {
                  print("Already on the last page");
                  return;
                }
                setState(() {
                  currentPage++;
                  print("Navigated to page: $currentPage");
                });
              },
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
                              color: (currentPage + 1) * itemsPerPage >=
                                      inProgressJobs.length
                                  ? AppColor.lightBlack.withOpacity(0.4)
                                  : AppColor.lightBlack.withOpacity(0.5),
                            ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: (currentPage + 1) * itemsPerPage >=
                                inProgressJobs.length
                            ? AppColor.lightBlack.withOpacity(0.4)
                            : AppColor.lightBlack.withOpacity(0.5),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildICompletedTabContent(double width) {
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
                        tableCell('Completion Date', isHeader: true),
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
                    ...buildCompletedRows(),
                    // Add more rows as needed
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (currentPage == 0) {
                  print("Already on the first page");
                  return;
                }
                setState(() {
                  currentPage--;
                  print("Navigated to page: $currentPage");
                });
              },
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
              onTap: () {
                if ((currentPage + 1) * itemsPerPage >= completedJobs.length) {
                  print("Already on the last page");
                  return;
                }
                setState(() {
                  currentPage++;
                  print("Navigated to page: $currentPage");
                });
              },
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

  Widget buildDisputeTabContent(double width) {
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
                        tableCell('DISPUTE REASON', isHeader: true),
                        tableCell('DATE FILED',
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
                    ...buildDisputeRows(),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (currentPage == 0) {
                  print("Already on the first page");
                  return;
                }
                setState(() {
                  currentPage--;
                  print("Navigated to page: $currentPage");
                });
              },
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
              onTap: () {
                if ((currentPage + 1) * itemsPerPage >= disputeList.length) {
                  print("Already on the last page");
                  return;
                }
                setState(() {
                  currentPage++;
                  print("Navigated to page: $currentPage");
                });
              },
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

  Widget buildActiveJobsTabContent(double width) {
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
                    6: FixedColumnWidth(170),
                    // Last Update column
                    // Status column
                    // Action column
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
                        tableCell('Status', isHeader: true),
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
                    // Example Data Rows
                    ...buildIActiveRow(),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (currentPage == 0) {
                  print("Already on the first page");
                  return;
                }
                setState(() {
                  currentPage--;
                  print("Navigated to page: $currentPage");
                });
              },
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
              onTap: () {
                if ((currentPage + 1) * itemsPerPage >= activeJobs.length) {
                  print("Already on the last page");
                  return;
                }
                setState(() {
                  currentPage++;
                  print("Navigated to page: $currentPage");
                });
              },
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

  Widget buildAllJobsTabContent(double width) {
    return Column(children: [
      Flexible(
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme(context).surface,
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
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
                      tableCell('LAST UPDATE', isHeader: true),
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
                  ...buildAllJobsRows(),
                ],
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (currentPage == 0) {
                print("Already on the first page");
                return;
              }
              setState(() {
                currentPage--;
                print("Navigated to page: $currentPage");
              });
            },
            child: Container(
              alignment: Alignment.center,
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if ((currentPage + 1) * itemsPerPage >= allJobs.length) {
                print("Already on the last page");
                return;
              }
              setState(() {
                currentPage++;
                print("Navigated to page: $currentPage");
              });
            },
            child: Container(
              alignment: Alignment.center,
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
            ),
          ),
        ],
      ),
    ]);
  }

  List<TableRow> buildIActiveRow() {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = (startIndex + itemsPerPage) > activeJobs.length
        ? activeJobs.length
        : startIndex + itemsPerPage;

    // Slice the list based on current page and items per page
    List<JobModel> currentItems = activeJobs.sublist(startIndex, endIndex);
    return currentItems.map((job) {
      return TableRow(
        children: [
          tableCell(job.srNo.toString()), // Convert srNo to string
          tableCell(job.jobTitle ?? ''),
          tableCell(job.clientName ?? ''),
          tableCell(job.radishaName ?? ''),
          tableCell(job.date ?? ''),
          tableCell(job.jobStatus ?? ''), // Assuming disputeReason for status
          actionButtons('View'), // Add your action buttons here
        ],
      );
    }).toList();
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

//all jobs table row
  List<TableRow> buildAllJobsRows() {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = (startIndex + itemsPerPage) > allJobs.length
        ? allJobs.length
        : startIndex + itemsPerPage;

    // Slice the list based on current page and items per page
    List<JobModel> currentItems = allJobs.sublist(startIndex, endIndex);

    return currentItems.map((job) {
      return TableRow(
        children: [
          tableCell(job.srNo.toString()), // Convert srNo to string
          tableCell(job.jobTitle ?? ''),
          tableCell(job.clientName ?? ''),
          tableCell(job.radishaName ?? ''),
          tableCell(job.date ?? ''),
          tableCell(job.jobStatus ?? ''), // Assuming disputeReason for status
          actionButtons('View'), // Add your action buttons here
        ],
      );
    }).toList();
  }

  // inProgress table row
  List<TableRow> buildInProgressRows() {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = (startIndex + itemsPerPage) > inProgressJobs.length
        ? inProgressJobs.length
        : startIndex + itemsPerPage;

    // Slice the list based on current page and items per page
    List<JobModel> currentItems = inProgressJobs.sublist(startIndex, endIndex);

    return currentItems.map((job) {
      return TableRow(
        children: [
          tableCell(job.srNo.toString()),
          tableCell(job.jobTitle!),
          tableCell(job.clientName!),
          tableCell(job.radishaName!),
          tableCell(job.date!),
          tableCell(job.jobStatus!),
          tableCell('Action'), // Replace with actual action buttons if needed
        ],
      );
    }).toList();
  }

  // completed table row
  List<TableRow> buildCompletedRows() {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = (startIndex + itemsPerPage) > completedJobs.length
        ? completedJobs.length
        : startIndex + itemsPerPage;

    // Slice the list based on current page and items per page
    List<JobModel> currentItems = completedJobs.sublist(startIndex, endIndex);
    return currentItems.map((job) {
      return TableRow(
        children: [
          tableCell(job.srNo.toString()), // Convert srNo to string
          tableCell(job.jobTitle ?? ''),
          tableCell(job.clientName ?? ''),
          tableCell(job.radishaName ?? ''),
          tableCell(job.completionDate ?? ''),
          tableCell(job.jobStatus ?? ''), // Assuming disputeReason for status
          actionButtons('View'), // Add your action buttons here
        ],
      );
    }).toList();
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
  Widget actionButtons(
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

//job dispute table row
  List<TableRow> buildDisputeRows() {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = (startIndex + itemsPerPage) > disputeList.length
        ? disputeList.length
        : startIndex + itemsPerPage;

    // Slice the list based on current page and items per page
    List<JobModel> currentItems = disputeList.sublist(startIndex, endIndex);
    return currentItems.map((job) {
      return TableRow(
        children: [
          tableCell(job.srNo.toString()), // Convert srNo to string
          tableCell(job.jobTitle ?? ''),
          tableCell(job.clientName ?? ''),
          tableCell(job.radishaName ?? ''),
          tableCell(job.dateFiled ?? ''),
          tableCell(
              job.disputeReason ?? ''), // Assuming disputeReason for status
          actionDisputeButton('Dispute'), // Add your action buttons here
        ],
      );
    }).toList();
  }

  Widget actionDisputeButton(String button) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            'Resolve', // The label for the single button
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      )
    ]);
  }

  Widget actionJobAssignmentButton(String jobassignmnetbuttons) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            'Assign', // The label for the single button
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      )
    ]);
  }
}
