import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_colors.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/custom_textfield.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/widgets/custom_button.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/utils/responsive_layout/responsive_layout.dart';

import 'package:image_picker/image_picker.dart';

class GeneralSettingPage extends StatefulWidget {
  const GeneralSettingPage({super.key});

  @override
  State<GeneralSettingPage> createState() => _GeneralSettingPageState();
}

class _GeneralSettingPageState extends State<GeneralSettingPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedGender;
  List<String> genders = ['Male', 'Female', 'Other'];

  String? selectCountry;
  List<String> country = [
    'Pakistan',
    'Saudi Arabia',
    'Iran',
    'Turkey',
    'Bangladesh',
    'Afghanistan'
  ];
  File? image;
  void _pickImageGallery() async {
    final imagePicker =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePicker != null) {
      setState(() {
        image = File(imagePicker.path);
      });
    }
  }

  void _pickImageCamera() async {
    final imagePicker =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagePicker != null) {
      setState(() {
        image = File(imagePicker.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveLayout(
      mobileLayout: Scaffold(
        backgroundColor: AppColor.bdColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.width * 0.01),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Center(
                  child: Container(
                    // width: double.infinity,
                    // height: size.height * 0.3,
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.08),
                    decoration: BoxDecoration(
                        color: colorScheme(context).onPrimary,
                        borderRadius: BorderRadius.circular(size.width * 0.01)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            _showPersistentBottomSheet(context);
                          },
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: AppColor.bdColor,
                              radius: size.width * 0.055,
                              backgroundImage: image != null
                                  ? FileImage(File(image!.path))
                                  : null,
                              child: image == null
                                  ? Icon(Icons.camera_alt_rounded,
                                      color: colorScheme(context).onSurface,
                                      size: size.width * 0.04)
                                  : null,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Center(
                            child: Text(
                          'Upload Photo',
                          style: textTheme(context).labelLarge!.copyWith(
                              color: colorScheme(context).primary,
                              fontSize: size.width * 0.02,
                              letterSpacing: 0),
                        )),
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        Text(
                          'Site Name',
                          style: textTheme(context).bodySmall!.copyWith(
                              fontSize: size.width * 0.02, letterSpacing: 0),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: CustomTextFormField(
                              hint: 'Bright Future',
                              hintSize: size.width * 0.02,
                              validationType: ValidationType.name,
                            )),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Text(
                          'Copy Right',
                          style: textTheme(context).bodySmall!.copyWith(
                              fontSize: size.width * 0.02, letterSpacing: 0),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: CustomTextFormField(
                              hint: 'All rights Reserved@Bright Future',
                              hintSize: size.width * 0.02,
                              validationType: ValidationType.name,
                            )),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Text(
                          'SEO Title',
                          style: textTheme(context).bodySmall!.copyWith(
                              fontSize: size.width * 0.02, letterSpacing: 0),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: CustomTextFormField(
                              hint: 'Bright web is a hybrid dashboard',
                              hintSize: size.width * 0.02,
                              validationType: ValidationType.email,
                            )),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Text(
                          'SEO Keywords',
                          style: textTheme(context).bodySmall!.copyWith(
                              fontSize: size.width * 0.02, letterSpacing: 0),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: CustomTextFormField(
                              hint: 'Bright web is a hybrid dashboard',
                              hintSize: size.width * 0.02,
                              validationType: ValidationType.email,
                            )),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Text(
                          'SEO Description ',
                          style: textTheme(context).bodySmall!.copyWith(
                              fontSize: size.width * 0.02, letterSpacing: 0),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: CustomTextFormField(
                              maxline: 8,
                              hint: 'Bright Future is a hybrid dashboard',
                              hintSize: size.width * 0.02,
                              validationType: ValidationType.name,
                            )),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        CustomButton(
                            width: double.infinity,
                            text: 'Add Now',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                debugPrint('build');
                              } else {
                                debugPrint('Not build');
                              }
                            })
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
        backgroundColor: AppColor.bdColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.width * 0.01),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Container(
                  // width: double.infinity,
                  // height: size.height * 0.3,
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                      horizontal: size.width * 0.02),
                  decoration: BoxDecoration(
                      color: colorScheme(context).onPrimary,
                      borderRadius: BorderRadius.circular(size.width * 0.01)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _showPersistentBottomSheet(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColor.bdColor,
                          radius: size.width * 0.032,
                          backgroundImage: image != null
                              ? FileImage(File(image!.path))
                              : null,
                          child: image == null
                              ? Icon(
                                  Icons.camera_alt_rounded,
                                  color: colorScheme(context).onSurface,
                                )
                              : null,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        'Upload Photo',
                        style: textTheme(context).labelLarge!.copyWith(
                            color: colorScheme(context).primary,
                            fontSize: size.width * 0.012,
                            letterSpacing: 0),
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Site Name',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.014,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                  width: size.width * 0.3,
                                  child: CustomTextFormField(
                                    hint: 'Bright Future',
                                    hintSize: size.width * 0.014,
                                    validationType: ValidationType.name,
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.06,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Copy Right',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.014,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                  width: size.width * 0.3,
                                  child: CustomTextFormField(
                                    hint: 'All rights Reserved@Bright Future',
                                    hintSize: size.width * 0.014,
                                    validationType: ValidationType.name,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SEO Title',
                                    style: textTheme(context)
                                        .bodySmall!
                                        .copyWith(
                                            fontSize: size.width * 0.012,
                                            letterSpacing: 0),
                                  ),
                                  SizedBox(
                                      width: size.width * 0.3,
                                      child: CustomTextFormField(
                                        hint:
                                            'Bright web is a hybrid dashboard',
                                        hintSize: size.width * 0.014,
                                        validationType: ValidationType.email,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.1,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SEO Keywords',
                                    style: textTheme(context)
                                        .bodySmall!
                                        .copyWith(
                                            fontSize: size.width * 0.014,
                                            letterSpacing: 0),
                                  ),
                                  SizedBox(
                                      width: size.width * 0.3,
                                      child: CustomTextFormField(
                                        hint:
                                            'Bright web is a hybrid dashboard',
                                        hintSize: size.width * 0.014,
                                        validationType: ValidationType.email,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.06,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SEO Description ',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.014,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                  width: size.width * 0.3,
                                  child: CustomTextFormField(
                                    maxline: 8,
                                    hint: 'Bright Future is a hybrid dashboard',
                                    hintSize: size.width * 0.014,
                                    validationType: ValidationType.name,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      CustomButton(
                          width: size.width * 0.2,
                          text: 'Add Now',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              debugPrint('build');
                            } else {
                              debugPrint('Not build');
                            }
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      desktopLayout: Scaffold(
        backgroundColor: AppColor.bdColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.width * 0.01),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Container(
                  // width: double.infinity,
                  // height: size.height * 0.3,
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                      horizontal: size.width * 0.02),
                  decoration: BoxDecoration(
                      color: colorScheme(context).onPrimary,
                      borderRadius: BorderRadius.circular(size.width * 0.01)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _showPersistentBottomSheet(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColor.bdColor,
                          radius: size.width * 0.03,
                          backgroundImage: image != null
                              ? FileImage(File(image!.path))
                              : null,
                          child: image == null
                              ? Icon(
                                  Icons.camera_alt_rounded,
                                  color: colorScheme(context).onSurface,
                                )
                              : null,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        'Upload Photo',
                        style: textTheme(context).labelLarge!.copyWith(
                            color: colorScheme(context).primary,
                            fontSize: size.width * 0.01,
                            letterSpacing: 0),
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Site Name',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.012,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                  width: size.width * 0.24,
                                  child: const CustomTextFormField(
                                    hint: 'Bright Future',
                                    validationType: ValidationType.name,
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.06,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Copy Right',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.012,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                  width: size.width * 0.24,
                                  child: const CustomTextFormField(
                                    hint: 'All rights Reserved@Bright Future',
                                    validationType: ValidationType.name,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SEO Title',
                                    style: textTheme(context)
                                        .bodySmall!
                                        .copyWith(
                                            fontSize: size.width * 0.012,
                                            letterSpacing: 0),
                                  ),
                                  SizedBox(
                                      width: size.width * 0.24,
                                      child: const CustomTextFormField(
                                        hint:
                                            'Bright web is a hybrid dashboard',
                                        validationType: ValidationType.email,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.1,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SEO Keywords',
                                    style: textTheme(context)
                                        .bodySmall!
                                        .copyWith(
                                            fontSize: size.width * 0.012,
                                            letterSpacing: 0),
                                  ),
                                  SizedBox(
                                      width: size.width * 0.24,
                                      child: const CustomTextFormField(
                                        hint:
                                            'Bright web is a hybrid dashboard',
                                        validationType: ValidationType.email,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.06,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SEO Description ',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.012,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                  width: size.width * 0.24,
                                  child: const CustomTextFormField(
                                    maxline: 8,
                                    hint: 'Bright Future is a hybrid dashboard',
                                    validationType: ValidationType.name,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      CustomButton(
                          width: size.width * 0.2,
                          text: 'Add Now',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              debugPrint('build');
                            } else {
                              debugPrint('Not build');
                            }
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPersistentBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              )),
          padding: EdgeInsets.all(16.0),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Chosse camera',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: colorScheme(context).outline,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageCamera();
                },
              ),
              ListTile(
                leading: Icon(Icons.image_outlined),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageGallery();
                  // Do something
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
