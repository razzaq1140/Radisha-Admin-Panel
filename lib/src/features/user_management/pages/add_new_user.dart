import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_colors.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/custom_textfield.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/widgets/custom_button.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({super.key});

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  TextEditingController genderController = TextEditingController();

  @override
  void dispose() {
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          color: colorScheme(context).surface,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  // Image Upload Section
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: colorScheme(context).outlineVariant,
                    child: Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: AppColor.lightBlack,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Upload Photo',
                    style: textTheme(context)
                        .titleSmall
                        ?.copyWith(color: AppColor.appGreen),
                  ),
                  const SizedBox(height: 30),
                  // Form Fields
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Name',
                              style: textTheme(context)
                                  .titleSmall
                                  ?.copyWith(color: AppColor.lightBlack),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              fillColor: colorScheme(context).outlineVariant,
                              hint: 'Enter your first name',
                              hintColor: AppColor.lightBlack.withOpacity(0.6),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 50),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last Name',
                              style: textTheme(context)
                                  .titleSmall
                                  ?.copyWith(color: AppColor.lightBlack),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              fillColor: colorScheme(context).outlineVariant,
                              hint: 'Enter your last name',
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your email',
                              style: textTheme(context)
                                  .titleSmall
                                  ?.copyWith(color: AppColor.lightBlack),
                            ),
                            CustomTextFormField(
                              fillColor: colorScheme(context).outlineVariant,
                              hint: 'Enter your email',
                              hintColor: AppColor.lightBlack.withOpacity(0.6),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                              style: textTheme(context)
                                  .titleSmall
                                  ?.copyWith(color: AppColor.lightBlack),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              fillColor: colorScheme(context).outlineVariant,
                              hint: 'Enter your phone number',
                              hintColor: AppColor.lightBlack.withOpacity(0.6),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Type',
                              style: textTheme(context)
                                  .titleSmall
                                  ?.copyWith(color: AppColor.lightBlack),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              fillColor: colorScheme(context).outlineVariant,
                              hint: 'Type',
                              hintColor: AppColor.lightBlack.withOpacity(0.6),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 50),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender',
                              style: textTheme(context)
                                  .titleSmall
                                  ?.copyWith(color: AppColor.lightBlack),
                            ),
                            const SizedBox(height: 10),
                            Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                CustomTextFormField(
                                  controller: genderController,
                                  fillColor:
                                      colorScheme(context).outlineVariant,
                                  hint: 'Male', // Default text
                                ),
                                PopupMenuButton<String>(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColor.lightBlack.withOpacity(0.5),
                                  ),
                                  onSelected: (String value) {
                                    setState(() {
                                      genderController.text = value;
                                    });
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: 'Male',
                                        child: Text('Male'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'Female',
                                        child: Text('Female'),
                                      ),
                                    ];
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Submit Button
                  CustomButton(width: 300, onTap: () {}, text: 'Add Now'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
