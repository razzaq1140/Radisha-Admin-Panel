import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_colors.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_images.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/widgets/custom_button.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/utils/responsive_layout/responsive_layout.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage({super.key});

  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  var height, width;
  bool isChecked = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
        mobileLayout: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Card(
                        elevation: 10,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Container(
                            height: height * 0.89,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: colorScheme(context).surface,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(50),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Center(
                                        child: Image.asset(
                                          AppImages.errorImage,
                                          height: 296,
                                          width: 390,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Center(
                                        child: Text(
                                          "Looks like you’ve got lost….",
                                          style: textTheme(context)
                                              .headlineLarge
                                              ?.copyWith(
                                                  color: colorScheme(context)
                                                      .onSurface
                                                      .withOpacity(0.4),
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Center(
                                        child: CustomButton(
                                            height: 56,
                                            width: 418,
                                            onTap: () {},
                                            text: 'Back to Dashboard'),
                                      ),
                                    ]))))),
              ],
            ),
          ),
        ),
        tabletLayout: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Container(
                      height: height * 0.89,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                        color: colorScheme(context).surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Image.asset(
                                AppImages.errorImage,
                                height: 296,
                                width: 390,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Text(
                                "Looks like you’ve got lost….",
                                style: textTheme(context)
                                    .headlineLarge
                                    ?.copyWith(
                                        color: colorScheme(context)
                                            .onSurface
                                            .withOpacity(0.4),
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: CustomButton(
                                  height: 56,
                                  width: 418,
                                  onTap: () {},
                                  text: 'Back to Dashboard'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        desktopLayout: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Container(
                      height: height * 0.89,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: colorScheme(context).surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 56),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Image.asset(
                                AppImages.errorImage,
                                height: 296,
                                width: 390,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Text(
                                "Looks like you’ve got lost….",
                                style: textTheme(context)
                                    .headlineLarge
                                    ?.copyWith(
                                        color: colorScheme(context)
                                            .onSurface
                                            .withOpacity(0.4),
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: CustomButton(
                                  height: 56,
                                  width: 418,
                                  onTap: () {},
                                  text: 'Back to Dashboard'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
