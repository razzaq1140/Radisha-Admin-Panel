import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_colors.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';
import 'package:flutter_application_radisha_admin_pannel/src/models/reports_analtic.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/responsive_layout/responsive_layout.dart';

class ReportsAndAnalyticsPage extends StatefulWidget {
  const ReportsAndAnalyticsPage({super.key});

  @override
  ReportsAndAnalyticsPageState createState() => ReportsAndAnalyticsPageState();
}

class ReportsAndAnalyticsPageState extends State<ReportsAndAnalyticsPage> {
  final List<FlSpot> line1Spots = [
    const FlSpot(2, 900),
    const FlSpot(4, 800),
    const FlSpot(6, 700),
    const FlSpot(8, 600),
    const FlSpot(10, 550),
    const FlSpot(12, 700),
    const FlSpot(14, 800),
    const FlSpot(16, 750),
    const FlSpot(18, 700),
    const FlSpot(20, 800),
    const FlSpot(22, 750),
    const FlSpot(24, 830),
    const FlSpot(26, 800),
    const FlSpot(28, 770),
    const FlSpot(30, 700),
  ];

  final List<FlSpot> line2Spots = [
    const FlSpot(2, 500),
    const FlSpot(4, 700),
    const FlSpot(6, 750),
    const FlSpot(8, 700),
    const FlSpot(10, 600),
    const FlSpot(12, 900),
    const FlSpot(14, 800),
    const FlSpot(16, 700),
    const FlSpot(18, 710),
    const FlSpot(20, 730),
    const FlSpot(22, 770),
    const FlSpot(24, 850),
    const FlSpot(26, 800),
    const FlSpot(28, 700),
    const FlSpot(30, 710),
  ];

  List<String> choseValue = [
    '1 day',
    '1 week',
    '1 month',
    '1 year',
    'All time'
  ];

  String value = '1 day';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveLayout(
      mobileLayout: Scaffold(
        backgroundColor: AppColor.bdColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User Growth Trend',
                  style: textTheme(context).bodyLarge!.copyWith(
                      fontSize: size.width * 0.05,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0)),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.01,
                    horizontal: size.width * 0.02),
                decoration: BoxDecoration(
                  color: colorScheme(context).onPrimary,
                  borderRadius: BorderRadius.circular(size.width * 0.01),
                ),
                child: Column(
                  children: [
                    Container(
                      height: size.width * 0.4,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: size.width * 0.1),
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(
                            show: false,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: Colors.grey.withOpacity(0.3),
                                strokeWidth: 1,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return FlLine(
                                color: Colors.grey.withOpacity(0.3),
                                strokeWidth: 1,
                              );
                            },
                          ),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  if (value % 2 == 0 &&
                                      value >= 2 &&
                                      value <= 30) {
                                    return Text(
                                      value.toInt().toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    );
                                  }
                                  return const Text('');
                                },
                                interval: 2,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: textTheme(context)
                                        .labelSmall!
                                        .copyWith(
                                            fontSize: size.width * 0.009,
                                            letterSpacing: 0,
                                            color: AppColor.textColor),
                                  );
                                },
                                interval: 100,
                              ),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                          minX: 0,
                          maxX: 30,
                          minY: 500,
                          maxY: 1000,
                          lineBarsData: [
                            LineChartBarData(
                              spots: line1Spots,
                              isCurved: true,
                              color: colorScheme(context).primary,
                              barWidth: 1,
                              dotData: const FlDotData(show: false),
                            ),
                            LineChartBarData(
                              spots: line2Spots,
                              isCurved: true,
                              color: colorScheme(context).primary,
                              barWidth: 1,
                              dotData: const FlDotData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          'Download Report',
                          style: textTheme(context).labelSmall!.copyWith(
                              fontSize: size.width * 0.03,
                              color: AppColor.textColor,
                              letterSpacing: 0),
                        ),
                        SizedBox(
                          width: size.width * 0.007,
                        ),
                        Icon(
                          Icons.download_outlined,
                          size: size.width * 0.025,
                          color: AppColor.textColor,
                        ),
                        SizedBox(
                          width: size.width * 0.025,
                        ),
                        Text(
                          '+8.8%',
                          style: textTheme(context).labelMedium!.copyWith(
                              color: colorScheme(context).primary,
                              fontSize: size.width * 0.03,
                              letterSpacing: 0),
                        ),
                        SizedBox(
                          width: size.width * 0.018,
                        ),
                        Text('All Time High',
                            style: textTheme(context).labelSmall!.copyWith(
                                fontSize: size.width * 0.03,
                                color: AppColor.textColor,
                                letterSpacing: 0)),
                        const Spacer(),
                        Text(
                          '98.78%',
                          style: textTheme(context).headlineSmall!.copyWith(
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.021),
                        ),
                        Text('Total',
                            style: textTheme(context).labelSmall!.copyWith(
                                fontSize: size.width * 0.03,
                                color: AppColor.textColor,
                                letterSpacing: 0))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorScheme(context).onPrimary,
                  borderRadius: BorderRadius.circular(size.width * 0.01),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: size.width * 0.005,
                    horizontal: size.width * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.cake_outlined),
                      title: Text(
                        'User  Breakdown',
                        style: textTheme(context).bodyLarge!.copyWith(
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0),
                      ),
                      subtitle: Text(
                        'Here you can track your  user’s performance everyday.',
                        style: textTheme(context).labelSmall!.copyWith(
                            fontSize: size.width * 0.029,
                            color: AppColor.textColor,
                            letterSpacing: 0),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    SizedBox(
                      height: size.width * 0.2,
                      child: BarChart(
                        BarChartData(
                          barTouchData: BarTouchData(enabled: false),
                          alignment: BarChartAlignment.spaceEvenly,
                          maxY: 8,
                          barGroups: _buildBarGroups(),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget:
                                    (double value, TitleMeta meta) {
                                  const monthNames = [
                                    'Jan',
                                    'Feb',
                                    'Mar',
                                    'Apr',
                                    'May',
                                    'Jun',
                                    'Jul',
                                    'Aug',
                                    'Sep',
                                    'Oct',
                                    'Nov',
                                    'Dec'
                                  ];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      monthNames[value.toInt()],
                                      style: textTheme(context)
                                          .labelMedium!
                                          .copyWith(
                                              fontSize: size.width * 0.015,
                                              letterSpacing: 0),
                                    ),
                                  );
                                },
                              ),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(
                            show: false,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.019,
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: size.width * 0.5,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.007,
                                vertical: size.width * 0.007),
                            decoration: BoxDecoration(
                                color: AppColor.bdColor,
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.02)),
                            child: Consumer<ReportsAnalyticsModel>(
                              builder: (context, newValue, child) {
                                return SizedBox(
                                  height: 18,
                                  child: ListView.builder(
                                    itemCount: choseValue.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          newValue
                                              .changeValue(choseValue[index]);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                              height: 40,
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: newValue.day ==
                                                          choseValue[index]
                                                      ? colorScheme(context)
                                                          .onPrimary
                                                      : AppColor.bdColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Text(
                                                choseValue[index],
                                                style: textTheme(context)
                                                    .labelSmall!
                                                    .copyWith(
                                                        fontSize:
                                                            size.width * 0.017,
                                                        color:
                                                            colorScheme(context)
                                                                .outline,
                                                        letterSpacing: 0),
                                              )),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'View Full Report',
                          style: textTheme(context).labelLarge!.copyWith(
                              fontSize: size.width * 0.03,
                              color: AppColor.textColor,
                              letterSpacing: 0),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Icon(
                          Icons.picture_as_pdf_outlined,
                          size: size.width * 0.03,
                          color: AppColor.textColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.013,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorScheme(context).onPrimary.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.045,
                          vertical: size.height * 0.0001),
                      decoration: BoxDecoration(
                        color: colorScheme(context).onPrimary,
                        borderRadius: BorderRadius.circular(size.width * 0.01),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Overall Radisha Performance',
                            style: textTheme(context).bodyLarge!.copyWith(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0),
                          ),
                          CircularPercentIndicator(
                            radius: size.width * 0.09,
                            animation: true,
                            animationDuration: 1200,
                            lineWidth: size.width * 0.012,
                            percent: 0.4,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: size.width * 0.028,
                                  backgroundColor: AppColor.bdColor,
                                  child: Icon(
                                    Icons.group_outlined,
                                    color: colorScheme(context).primary,
                                    size: size.width * 0.029,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Text(
                                  "565",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.02),
                                ),
                              ],
                            ),
                            circularStrokeCap: CircularStrokeCap.butt,
                            backgroundColor: AppColor.bdColor,
                            progressColor: AppColor.appGreen,
                          ),
                          Row(
                            children: [
                              Text(
                                'New',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.03,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                '4.5k',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.03,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Text(
                                '•',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.03,
                                    color: colorScheme(context).primary,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                'Returning',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.03,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                '5.6k',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.03,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.018,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.045,
                          vertical: size.height * 0.0001),
                      decoration: BoxDecoration(
                        color: colorScheme(context).onPrimary,
                        borderRadius: BorderRadius.circular(size.width * 0.01),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Overall Radisha Performance',
                            style: textTheme(context).bodyLarge!.copyWith(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0),
                          ),
                          CircularPercentIndicator(
                            radius: size.width * 0.09,
                            animation: true,
                            animationDuration: 1200,
                            lineWidth: size.width * 0.012,
                            percent: 0.4,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: size.width * 0.028,
                                  backgroundColor: AppColor.bdColor,
                                  child: Icon(
                                    Icons.group_outlined,
                                    color: colorScheme(context).primary,
                                    size: size.width * 0.029,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Text(
                                  "565",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.02),
                                ),
                              ],
                            ),
                            circularStrokeCap: CircularStrokeCap.butt,
                            backgroundColor: AppColor.bdColor,
                            progressColor: AppColor.appGreen,
                          ),
                          Row(
                            children: [
                              Text(
                                'New',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.03,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                '4.5k',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.03,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Text(
                                '•',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.03,
                                    color: colorScheme(context).primary,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                'Returning',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.03,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                '5.6k',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.03,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      tabletLayout: Scaffold(
        backgroundColor: AppColor.bdColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User Growth Trend',
                  style: textTheme(context).bodyLarge!.copyWith(
                      fontSize: size.width * 0.026,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0)),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: size.width * 0.01, horizontal: size.width * 0.02),
                decoration: BoxDecoration(
                  color: colorScheme(context).onPrimary,
                  borderRadius: BorderRadius.circular(size.width * 0.01),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.34,
                      width: double.infinity,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(
                            show: false,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: Colors.grey.withOpacity(0.3),
                                strokeWidth: 1,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return FlLine(
                                color: Colors.grey.withOpacity(0.3),
                                strokeWidth: 1,
                              );
                            },
                          ),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  if (value % 2 == 0 &&
                                      value >= 2 &&
                                      value <= 30) {
                                    return Text(
                                      value.toInt().toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    );
                                  }
                                  return const Text('');
                                },
                                interval: 2,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: textTheme(context)
                                        .labelSmall!
                                        .copyWith(
                                            fontSize: size.width * 0.009,
                                            letterSpacing: 0,
                                            color: AppColor.textColor),
                                  );
                                },
                                interval: 100,
                              ),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                          minX: 0,
                          maxX: 30,
                          minY: 500,
                          maxY: 1000,
                          lineBarsData: [
                            LineChartBarData(
                              spots: line1Spots,
                              isCurved: true,
                              color: colorScheme(context).primary,
                              barWidth: 1,
                              dotData: const FlDotData(show: false),
                            ),
                            LineChartBarData(
                              spots: line2Spots,
                              isCurved: true,
                              color: colorScheme(context).primary,
                              barWidth: 1,
                              dotData: const FlDotData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          'Download Report',
                          style: textTheme(context).labelSmall!.copyWith(
                              fontSize: size.width * 0.015,
                              color: AppColor.textColor,
                              letterSpacing: 0),
                        ),
                        SizedBox(
                          width: size.width * 0.007,
                        ),
                        Icon(
                          Icons.download_outlined,
                          size: size.width * 0.025,
                          color: AppColor.textColor,
                        ),
                        SizedBox(
                          width: size.width * 0.025,
                        ),
                        Text(
                          '+8.8%',
                          style: textTheme(context).labelMedium!.copyWith(
                              color: colorScheme(context).primary,
                              fontSize: size.width * 0.012,
                              letterSpacing: 0),
                        ),
                        SizedBox(
                          width: size.width * 0.018,
                        ),
                        Text('All Time High',
                            style: textTheme(context).labelSmall!.copyWith(
                                fontSize: size.width * 0.015,
                                color: AppColor.textColor,
                                letterSpacing: 0)),
                        const Spacer(),
                        Text(
                          '98.78%',
                          style: textTheme(context).headlineSmall!.copyWith(
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.021),
                        ),
                        Text('Total',
                            style: textTheme(context).labelSmall!.copyWith(
                                fontSize: size.width * 0.015,
                                color: AppColor.textColor,
                                letterSpacing: 0))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorScheme(context).onPrimary,
                  borderRadius: BorderRadius.circular(size.width * 0.01),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: size.width * 0.005,
                    horizontal: size.width * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.cake_outlined),
                      title: Text(
                        'User  Breakdown',
                        style: textTheme(context).bodyLarge!.copyWith(
                            fontSize: size.width * 0.02,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0),
                      ),
                      subtitle: Text(
                        'Here you can track your  user’s performance everyday.',
                        style: textTheme(context).labelSmall!.copyWith(
                            fontSize: size.width * 0.015,
                            color: AppColor.textColor,
                            letterSpacing: 0),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    SizedBox(
                      height: size.height * 0.17,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceEvenly,
                          maxY: 8,
                          barGroups: _buildBarGroups(),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget:
                                    (double value, TitleMeta meta) {
                                  const monthNames = [
                                    'Jan',
                                    'Feb',
                                    'Mar',
                                    'Apr',
                                    'May',
                                    'Jun',
                                    'Jul',
                                    'Aug',
                                    'Sep',
                                    'Oct',
                                    'Nov',
                                    'Dec'
                                  ];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      monthNames[value.toInt()],
                                      style: textTheme(context)
                                          .labelMedium!
                                          .copyWith(
                                              fontSize: size.width * 0.015,
                                              letterSpacing: 0),
                                    ),
                                  );
                                },
                              ),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(
                            show: false,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.019,
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: size.width * 0.36,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.01,
                                vertical: size.width * 0.007),
                            decoration: BoxDecoration(
                                color: AppColor.bdColor,
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.02)),
                            child: Consumer<ReportsAnalyticsModel>(
                              builder: (context, newValue, child) {
                                return SizedBox(
                                  height: 25,
                                  child: ListView.builder(
                                    itemCount: choseValue.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          newValue
                                              .changeValue(choseValue[index]);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                              height: 40,
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: newValue.day ==
                                                          choseValue[index]
                                                      ? colorScheme(context)
                                                          .onPrimary
                                                      : AppColor.bdColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Text(
                                                choseValue[index],
                                                style: textTheme(context)
                                                    .labelSmall!
                                                    .copyWith(
                                                        fontSize:
                                                            size.width * 0.014,
                                                        color:
                                                            colorScheme(context)
                                                                .outline,
                                                        letterSpacing: 0),
                                              )),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'View Full Report',
                          style: textTheme(context).labelLarge!.copyWith(
                              fontSize: size.width * 0.017,
                              color: AppColor.textColor,
                              letterSpacing: 0),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Icon(
                          Icons.picture_as_pdf_outlined,
                          size: size.width * 0.03,
                          color: AppColor.textColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.013,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorScheme(context).onPrimary.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.045,
                          vertical: size.height * 0.0001),
                      decoration: BoxDecoration(
                        color: colorScheme(context).onPrimary,
                        borderRadius: BorderRadius.circular(size.width * 0.01),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Overall Radisha Performance',
                            style: textTheme(context).bodyLarge!.copyWith(
                                fontSize: size.width * 0.02,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: CircularPercentIndicator(
                              radius: size.width * 0.09,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: size.width * 0.012,
                              percent: 0.4,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: size.width * 0.028,
                                    backgroundColor: AppColor.bdColor,
                                    child: Icon(
                                      Icons.group_outlined,
                                      color: colorScheme(context).primary,
                                      size: size.width * 0.029,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    "565",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.02),
                                  ),
                                ],
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: AppColor.bdColor,
                              progressColor: AppColor.appGreen,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'New',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.018,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                '4.5k',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.018,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Text(
                                '•',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.05,
                                    color: colorScheme(context).primary,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                'Returning',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.018,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                '5.6k',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.018,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.018,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.045,
                          vertical: size.height * 0.0001),
                      decoration: BoxDecoration(
                        color: colorScheme(context).onPrimary,
                        borderRadius: BorderRadius.circular(size.width * 0.01),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Overall Radisha Performance',
                            style: textTheme(context).bodyLarge!.copyWith(
                                fontSize: size.width * 0.02,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularPercentIndicator(
                              radius: size.width * 0.09,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: size.width * 0.012,
                              percent: 0.4,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: size.width * 0.028,
                                    backgroundColor: AppColor.bdColor,
                                    child: Icon(
                                      Icons.group_outlined,
                                      color: colorScheme(context).primary,
                                      size: size.width * 0.029,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    "565",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.02),
                                  ),
                                ],
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: AppColor.bdColor,
                              progressColor: AppColor.appGreen,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'New',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.018,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                '4.5k',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.018,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Text(
                                '•',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.05,
                                    color: colorScheme(context).primary,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                'Returning',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.018,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                '5.6k',
                                style: textTheme(context).labelSmall!.copyWith(
                                    fontSize: size.width * 0.018,
                                    color: AppColor.textColor,
                                    letterSpacing: 0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      desktopLayout: Scaffold(
        backgroundColor: AppColor.bdColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User Growth Trend',
                      style: textTheme(context).bodyLarge!.copyWith(
                          fontSize: size.width * 0.014,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0)),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: size.width * 0.55,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme(context).onPrimary,
                      borderRadius: BorderRadius.circular(size.width * 0.01),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.3,
                          width: size.width * 0.55,
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(
                                show: false,
                                getDrawingHorizontalLine: (value) {
                                  return FlLine(
                                    color: Colors.grey.withOpacity(0.3),
                                    strokeWidth: 1,
                                  );
                                },
                                getDrawingVerticalLine: (value) {
                                  return FlLine(
                                    color: Colors.grey.withOpacity(0.3),
                                    strokeWidth: 1,
                                  );
                                },
                              ),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      if (value % 2 == 0 &&
                                          value >= 2 &&
                                          value <= 30) {
                                        return Text(
                                          value.toInt().toString(),
                                          style: const TextStyle(
                                              fontSize: 10, color: Colors.grey),
                                        );
                                      }
                                      return const Text('');
                                    },
                                    interval: 2,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      return Text(
                                        value.toInt().toString(),
                                        style: const TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      );
                                    },
                                    interval: 100,
                                  ),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                              minX: 0,
                              maxX: 30,
                              minY: 500,
                              maxY: 1000,
                              lineBarsData: [
                                LineChartBarData(
                                  spots: line1Spots,
                                  isCurved: true,
                                  color: colorScheme(context).primary,
                                  barWidth: 1,
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: line2Spots,
                                  isCurved: true,
                                  color: colorScheme(context).primary,
                                  barWidth: 1,
                                  dotData: const FlDotData(show: false),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              'Download Report',
                              style: textTheme(context).labelMedium!.copyWith(
                                    color: colorScheme(context).outline,
                                    letterSpacing: 0,
                                    fontSize: size.width * 0.01,
                                  ),
                            ),
                            SizedBox(
                              width: size.width * 0.003,
                            ),
                            Icon(
                              Icons.download_outlined,
                              size: size.width * 0.02,
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              '+8.8%',
                              style: textTheme(context).labelMedium!.copyWith(
                                  color: colorScheme(context).primary),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              'All Time High',
                              style: textTheme(context).bodyLarge!.copyWith(
                                  letterSpacing: 0,
                                  fontSize: size.width * 0.01,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              '98.78%',
                              style: textTheme(context).headlineSmall!.copyWith(
                                  letterSpacing: 0,
                                  fontSize: size.width * 0.014,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text('Total',
                                style: textTheme(context).labelMedium!.copyWith(
                                      color: colorScheme(context).outline,
                                      letterSpacing: 0,
                                      fontSize: size.width * 0.01,
                                    ))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    width: size.width * 0.55,
                    decoration: BoxDecoration(
                      color: colorScheme(context).onPrimary,
                      borderRadius: BorderRadius.circular(size.width * 0.01),
                    ),
                    padding: EdgeInsets.all(size.width * 0.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                              backgroundColor:
                                  colorScheme(context).outlineVariant,
                              child: Icon(
                                Icons.cake_outlined,
                                size: size.width * 0.015,
                                color: colorScheme(context).primary,
                              )),
                          title: Text('User  Breakdown',
                              style: textTheme(context).labelMedium!.copyWith(
                                    color: colorScheme(context).outline,
                                    letterSpacing: 0,
                                    fontSize: size.width * 0.013,
                                    fontWeight: FontWeight.w700,
                                  )),
                          subtitle: Text(
                            'Here you can track your  user’s performance everyday.',
                            style: textTheme(context).labelMedium!.copyWith(
                                color: colorScheme(context).outline,
                                letterSpacing: 0,
                                fontSize: size.width * 0.01),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        SizedBox(
                          height: 100,
                          width: size.width * 0.66,
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceEvenly,
                              maxY: 9,
                              barGroups: _buildBarGroups(),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget:
                                        (double value, TitleMeta meta) {
                                      const monthNames = [
                                        'Jan',
                                        'Feb',
                                        'Mar',
                                        'Apr',
                                        'May',
                                        'Jun',
                                        'Jul',
                                        'Aug',
                                        'Sep',
                                        'Oct',
                                        'Nov',
                                        'Dec'
                                      ];
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Text(
                                          monthNames[value.toInt()],
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                leftTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              gridData: const FlGridData(show: false),
                              borderData: FlBorderData(
                                show: false,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.017,
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: size.width * 0.32,
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.01,
                                    vertical: size.width * 0.007),
                                decoration: BoxDecoration(
                                    color: AppColor.bdColor,
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.02)),
                                child: Consumer<ReportsAnalyticsModel>(
                                  builder: (context, newValue, child) {
                                    return SizedBox(
                                      height: 25,
                                      child: ListView.builder(
                                        itemCount: choseValue.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              newValue.changeValue(
                                                  choseValue[index]);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Container(
                                                  height: 40,
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      color: newValue.day ==
                                                              choseValue[index]
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : AppColor.bdColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Text(
                                                    choseValue[index],
                                                    style: textTheme(context)
                                                        .labelSmall!
                                                        .copyWith(
                                                            fontSize:
                                                                size.width *
                                                                    0.01,
                                                            color: colorScheme(
                                                                    context)
                                                                .outline,
                                                            letterSpacing: 0),
                                                  )),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'View Full Report',
                              style: textTheme(context).labelLarge!.copyWith(
                                  fontSize: size.width * 0.01,
                                  color: AppColor.textColor,
                                  letterSpacing: 0),
                            ),
                            Icon(
                              Icons.picture_as_pdf_outlined,
                              size: size.width * 0.015,
                              color: AppColor.textColor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: size.width * 0.23,
                padding: EdgeInsets.symmetric(
                    vertical: size.width * 0.01,
                    horizontal: size.width * 0.017),
                decoration: BoxDecoration(
                  color: colorScheme(context).onPrimary.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.24,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.01,
                          vertical: size.height * 0.01),
                      decoration: BoxDecoration(
                        color: colorScheme(context).onPrimary,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Overall Radisha Performance',
                            style: textTheme(context).labelLarge!.copyWith(
                                fontSize: size.width * 0.01, letterSpacing: 0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularPercentIndicator(
                              radius: size.width * 0.05,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: size.width * 0.012,
                              percent: 0.4,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: size.width * 0.014,
                                    backgroundColor: AppColor.bdColor,
                                    child: Icon(
                                      Icons.group_outlined,
                                      color: colorScheme(context).primary,
                                      size: size.width * 0.017,
                                    ),
                                  ),
                                  Text(
                                    "565",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.015),
                                  ),
                                ],
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: AppColor.bdColor,
                              progressColor: AppColor.appGreen,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  'New',
                                  style: textTheme(context)
                                      .labelLarge!
                                      .copyWith(
                                          fontSize: size.width * 0.008,
                                          letterSpacing: 0),
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  '4.5k',
                                  style: textTheme(context)
                                      .labelLarge!
                                      .copyWith(
                                          fontSize: size.width * 0.008,
                                          letterSpacing: 0),
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Text(
                                  '•',
                                  style: textTheme(context)
                                      .displayMedium!
                                      .copyWith(
                                          color: colorScheme(context).primary),
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  'Returning',
                                  style: textTheme(context)
                                      .labelLarge!
                                      .copyWith(
                                          fontSize: size.width * 0.008,
                                          letterSpacing: 0),
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  '5.6k',
                                  style: textTheme(context)
                                      .labelLarge!
                                      .copyWith(
                                          fontSize: size.width * 0.008,
                                          letterSpacing: 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      width: size.width * 0.24,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.01,
                          vertical: size.height * 0.01),
                      decoration: BoxDecoration(
                        color: colorScheme(context).onPrimary,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Overall Radisha Performance',
                            style: textTheme(context).labelLarge!.copyWith(
                                fontSize: size.width * 0.01, letterSpacing: 0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularPercentIndicator(
                              radius: size.width * 0.05,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: size.width * 0.012,
                              percent: 0.4,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: size.width * 0.014,
                                    backgroundColor: AppColor.bdColor,
                                    child: Icon(
                                      Icons.group_outlined,
                                      color: colorScheme(context).primary,
                                      size: size.width * 0.017,
                                    ),
                                  ),
                                  Text(
                                    "565",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.015),
                                  ),
                                ],
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: AppColor.bdColor,
                              progressColor: AppColor.appGreen,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  'New',
                                  style: textTheme(context)
                                      .labelLarge!
                                      .copyWith(
                                          fontSize: size.width * 0.008,
                                          letterSpacing: 0),
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  '4.5k',
                                  style: textTheme(context)
                                      .labelLarge!
                                      .copyWith(
                                          fontSize: size.width * 0.008,
                                          letterSpacing: 0),
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Text(
                                  '•',
                                  style: textTheme(context)
                                      .displayMedium!
                                      .copyWith(
                                          color: colorScheme(context).primary),
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  'Returning',
                                  style: textTheme(context)
                                      .labelLarge!
                                      .copyWith(
                                          fontSize: size.width * 0.008,
                                          letterSpacing: 0),
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  '5.6k',
                                  style: textTheme(context)
                                      .labelLarge!
                                      .copyWith(
                                          fontSize: size.width * 0.008,
                                          letterSpacing: 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return [
      _buildGroup(0, 3, 3, 3),
      _buildGroup(1, 5, 5, 5),
      _buildGroup(2, 2, 2, 2),
      _buildGroup(3, 6, 6, 6),
      _buildGroup(4, 5, 5, 5),
      _buildGroup(5, 2, 2, 2),
      _buildGroup(6, 3, 3, 3),
      _buildGroup(7, 4, 4, 4),
      _buildGroup(8, 6, 6, 6),
      _buildGroup(9, 4, 4, 4),
      _buildGroup(10, 3, 3, 3),
      _buildGroup(11, 1, 1, 1),
    ];
  }

  BarChartGroupData _buildGroup(int x, double y1, double y2, double y3) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1 + y2 + y3,
          rodStackItems: [
            BarChartRodStackItem(0, y1, Colors.grey),
            BarChartRodStackItem(y1, y1 + y2, AppColor.appYellow),
            BarChartRodStackItem(
                y1 + y2, y1 + y2 + y3, colorScheme(context).primary),
          ],
          width: 14,
          borderRadius: BorderRadius.circular(12),
        ),
      ],
    );
  }
}
