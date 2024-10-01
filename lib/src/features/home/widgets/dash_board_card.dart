import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';
import 'package:flutter_svg/svg.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final String image;
  final String detailText;
  final IconData? icon;
  final double? titleSize; // Nullable size
  final double? detailSize; // Nullable size
  final double? valueSize; // Nullable size
  final double? circleSize; // Nullable size
  final double? iconSize; // Nullable size

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.detailText,
    this.icon,
    this.titleSize,
    this.detailSize,
    this.valueSize,
    this.circleSize,
    this.iconSize,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Fallback to MediaQuery size if no size is provided
    final double calculatedTitleSize = titleSize ?? size.width * 0.008;
    final double calculatedValueSize = valueSize ?? size.width * 0.023;
    final double calculatedDetailSize = detailSize ?? size.width * 0.008;
    final double cirularValueSize = circleSize ?? size.width * 0.017;
    final double iconValueSize = iconSize ?? size.width * 0.012;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize:
                          calculatedTitleSize, // Use calculated title size
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize:
                          calculatedValueSize, // Use calculated value size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: cirularValueSize,
                backgroundColor: colorScheme(context).primary.withOpacity(0.1),
                child: SvgPicture.asset(
                  image,
                  height: iconValueSize,
                  width: iconValueSize,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                icon,
                color: colorScheme(context).primary,
              ),
              const SizedBox(width: 8),
              Text(
                detailText,
                style: TextStyle(
                  fontSize: calculatedDetailSize, // Use calculated detail size
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
