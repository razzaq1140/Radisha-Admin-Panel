import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_colors.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/custom_textfield.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/widgets/custom_button.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/utils/responsive_layout/responsive_layout.dart';
import 'package:flutter_application_radisha_admin_pannel/src/routes/go_router.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Create an Account",
                              style: textTheme(context).headlineLarge?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.4),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Create a account to continue",
                              style: textTheme(context).titleMedium?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.35),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Email address",
                            style: textTheme(context).titleMedium?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.56),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            height: 56,
                            verticalPadding: 20,
                            hintColor: AppColor.hintText,
                            controller: email,
                            hint: 'Email',
                            validationType: ValidationType.email,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Username",
                            style: textTheme(context).titleMedium?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.56),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            height: 56,
                            verticalPadding: 20,
                            hintColor: AppColor.hintText,
                            controller: username,
                            hint: 'Username',
                            validationType: ValidationType.name,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Password:",
                            style: textTheme(context).titleMedium?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.56),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            height: 56,
                            verticalPadding: 20,
                            hintColor: AppColor.hintText,
                            controller: password,
                            hint: 'Password',
                            validationType: ValidationType.password,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Checkbox with custom border and tick color
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value ?? false;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: BorderSide(
                                    color: colorScheme(context).onSurface),
                                // Border color
                                checkColor: colorScheme(context)
                                    .onSurface, // Tick color when checked
                                activeColor: Colors
                                    .transparent, // Transparent background when checked
                              ),
                              const SizedBox(
                                  width:
                                      10), // Spacing between the checkbox and text
                              const Text('Remember Password'),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButton(onTap: () {}, text: 'Sign Up'),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an account?',
                                    style:
                                        textTheme(context).bodyLarge?.copyWith(
                                              color: colorScheme(context)
                                                  .outline
                                                  .withOpacity(0.4),
                                            ),
                                  ),
                                  TextSpan(
                                    text: 'Login',
                                    style: textTheme(context)
                                        .bodyLarge
                                        ?.copyWith(
                                            color:
                                                colorScheme(context).primary),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pushNamed(AppRoute.loginPage);
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Create an Account",
                                style: textTheme(context)
                                    .headlineLarge
                                    ?.copyWith(
                                        color: colorScheme(context)
                                            .onSurface
                                            .withOpacity(0.4),
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                "Create a account to continue",
                                style: textTheme(context).titleMedium?.copyWith(
                                    color: colorScheme(context)
                                        .onSurface
                                        .withOpacity(0.35),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Email address",
                              style: textTheme(context).titleMedium?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.56),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              height: 56,
                              verticalPadding: 20,
                              hintColor: AppColor.hintText,
                              controller: email,
                              hint: 'Email',
                              validationType: ValidationType.email,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Username",
                              style: textTheme(context).titleMedium?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.56),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              height: 56,
                              verticalPadding: 20,
                              hintColor: AppColor.hintText,
                              controller: username,
                              hint: 'Username',
                              validationType: ValidationType.name,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Password:",
                              style: textTheme(context).titleMedium?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.56),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              height: 56,
                              verticalPadding: 20,
                              hintColor: AppColor.hintText,
                              controller: password,
                              hint: 'Password',
                              validationType: ValidationType.password,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Checkbox with custom border and tick color
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value ?? false;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: BorderSide(
                                      color: colorScheme(context).onSurface),
                                  // Border color
                                  checkColor: colorScheme(context)
                                      .onSurface, // Tick color when checked
                                  activeColor: Colors
                                      .transparent, // Transparent background when checked
                                ),
                                const SizedBox(
                                    width:
                                        10), // Spacing between the checkbox and text
                                const Text('Remember Password'),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomButton(onTap: () {}, text: 'Sign Up'),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Already have an account?',
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(
                                            color: colorScheme(context)
                                                .outline
                                                .withOpacity(0.4),
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Login',
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(
                                              color:
                                                  colorScheme(context).primary),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          context.pushNamed(AppRoute.loginPage);
                                        },
                                    ),
                                  ],
                                ),
                              ),
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
                            horizontal: 40, vertical: 37),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Create an Account",
                                style: textTheme(context)
                                    .headlineLarge
                                    ?.copyWith(
                                        color: colorScheme(context)
                                            .onSurface
                                            .withOpacity(0.4),
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                "Create a account to continue",
                                style: textTheme(context).titleMedium?.copyWith(
                                    color: colorScheme(context)
                                        .onSurface
                                        .withOpacity(0.35),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Email address",
                              style: textTheme(context).titleMedium?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.56),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              height: 56,
                              verticalPadding: 20,
                              controller: email,
                              hint: 'esteban_schiller@gmail.com',
                              hintColor: AppColor.hintText,
                              validationType: ValidationType.email,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Username",
                              style: textTheme(context).titleMedium?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.56),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              height: 56,
                              verticalPadding: 20,
                              controller: username,
                              hintColor: AppColor.hintText,
                              hint: 'Username',
                              validationType: ValidationType.name,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Password:",
                              style: textTheme(context).titleMedium?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.56),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              height: 56,
                              verticalPadding: 20,
                              controller: password,
                              hint: '*************',
                              hintColor: AppColor.hintText,
                              validationType: ValidationType.password,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Checkbox with custom border and tick color
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value ?? false;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: BorderSide(
                                      color: colorScheme(context).onSurface),
                                  // Border color
                                  checkColor: colorScheme(context)
                                      .onSurface, // Tick color when checked
                                  activeColor: Colors
                                      .transparent, // Transparent background when checked
                                ),
                                const SizedBox(
                                    width:
                                        10), // Spacing between the checkbox and text
                                const Text('Remember Password'),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomButton(onTap: () {}, text: 'Sign Up'),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Already have an account?',
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(
                                            color: colorScheme(context)
                                                .outline
                                                .withOpacity(0.4),
                                          ),
                                    ),
                                    TextSpan(
                                      text: '  Login',
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(
                                              color:
                                                  colorScheme(context).primary),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          context.pushNamed(AppRoute.loginPage);
                                        },
                                    ),
                                  ],
                                ),
                              ),
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
