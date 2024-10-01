import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_colors.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/custom_textfield.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/widgets/custom_button.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/utils/responsive_layout/responsive_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileManagementPage extends StatefulWidget {
  const ProfileManagementPage({super.key});

  @override
  State<ProfileManagementPage> createState() => _ProfileManagementPageState();
}

class _ProfileManagementPageState extends State<ProfileManagementPage> {
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
                child: Container(
                  // width: double.infinity,
                  // height: size.height * 0.3,
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                      horizontal: size.width * 0.1),
                  decoration: BoxDecoration(
                    color: colorScheme(context).onPrimary,
                    borderRadius: BorderRadius.circular(size.width * 0.01),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          _showPersistentBottomSheet(context);
                          // _pickImage();
                        },
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: AppColor.bdColor,
                            radius: size.width * 0.08,
                            backgroundImage: image != null
                                ? FileImage(File(image!.path))
                                : null,
                            child: image == null
                                ? Icon(
                                    Icons.camera_alt_rounded,
                                    size: size.width * 0.06,
                                    color: colorScheme(context).onSurface,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Center(
                          child: Text(
                        'Upload Photo',
                        style: textTheme(context).labelLarge!.copyWith(
                            color: colorScheme(context).primary,
                            fontSize: size.width * 0.03,
                            letterSpacing: 0),
                      )),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Text(
                        'First Name',
                        style: textTheme(context).bodySmall!.copyWith(
                            fontSize: size.width * 0.03, letterSpacing: 0),
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: CustomTextFormField(
                            hint: 'Enter your first name',
                            hintSize: size.width * 0.03,
                            validationType: ValidationType.name,
                          )),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        'Last Name',
                        style: textTheme(context).bodySmall!.copyWith(
                            fontSize: size.width * 0.03, letterSpacing: 0),
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: CustomTextFormField(
                            hint: 'Enter your last name',
                            hintSize: size.width * 0.03,
                            validationType: ValidationType.name,
                          )),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        'Email',
                        style: textTheme(context).bodySmall!.copyWith(
                            fontSize: size.width * 0.03, letterSpacing: 0),
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: CustomTextFormField(
                            hint: 'Enter your email',
                            hintSize: size.width * 0.03,
                            validationType: ValidationType.email,
                          )),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        'Phone ',
                        style: textTheme(context).bodySmall!.copyWith(
                            fontSize: size.width * 0.03, letterSpacing: 0),
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: CustomTextFormField(
                            hintSize: size.width * 0.03,
                            hint: 'Enter your phone number',
                            validationType: ValidationType.phoneNumber,
                          )),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        'Country',
                        style: textTheme(context).bodySmall!.copyWith(
                            fontSize: size.width * 0.03, letterSpacing: 0),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: colorScheme(context).outlineVariant,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: colorScheme(context).outlineVariant)),
                          width: double.infinity,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              hint: Text(
                                'Select country',
                                style: textTheme(context).labelMedium!.copyWith(
                                    fontSize: size.width * 0.03,
                                    letterSpacing: 0),
                              ),
                              isExpanded: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              validator: (newValue) {
                                if (newValue == null) {
                                  return 'Please select country';
                                }
                                return null;
                              },
                              value: selectCountry,
                              style: GoogleFonts.poppins(
                                  color: colorScheme(context).outline,
                                  fontSize: 14),
                              items: country.map((String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectCountry = value;
                                });
                              },
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        'Gender',
                        style: textTheme(context).bodySmall!.copyWith(
                            fontSize: size.width * 0.03, letterSpacing: 0),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: colorScheme(context).outlineVariant,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: colorScheme(context).outlineVariant)),
                          width: double.infinity,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              hint: Text(
                                'Select gender',
                                style: textTheme(context).labelMedium!.copyWith(
                                    fontSize: size.width * 0.03,
                                    letterSpacing: 0),
                              ),
                              isExpanded: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              validator: (newValue) {
                                if (newValue == null) {
                                  return 'Please select gender';
                                }
                                return null;
                              },
                              value: selectedGender,
                              style: GoogleFonts.poppins(
                                  color: colorScheme(context).outline,
                                  fontSize: 14),
                              items: genders.map((String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.05,
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
                    borderRadius: BorderRadius.circular(size.width * 0.01),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _showPersistentBottomSheet(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColor.bdColor,
                          radius: size.width * 0.04,
                          backgroundImage: image != null
                              ? FileImage(File(image!.path))
                              : null,
                          child: image == null
                              ? Icon(
                                  Icons.camera_alt_rounded,
                                  color: colorScheme(context).onSurface,
                                  size: size.width * 0.03,
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
                            fontSize: size.width * 0.017,
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
                                'First Name',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.021,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                  width: size.width * 0.32,
                                  child: CustomTextFormField(
                                    hint: 'Enter your first name',
                                    hintSize: size.width * 0.017,
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
                                'Last Name',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.021,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                  width: size.width * 0.32,
                                  child: CustomTextFormField(
                                    hint: 'Enter your last name',
                                    hintSize: size.width * 0.017,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.021,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                  width: size.width * 0.32,
                                  child: CustomTextFormField(
                                    hint: 'Enter your email',
                                    hintSize: size.width * 0.017,
                                    validationType: ValidationType.email,
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
                                'Phone',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.021,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                  width: size.width * 0.32,
                                  child: CustomTextFormField(
                                    hint: 'Enter your phone number',
                                    hintSize: size.width * 0.017,
                                    validationType: ValidationType.phoneNumber,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Country',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.021,
                                    letterSpacing: 0),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color:
                                          colorScheme(context).outlineVariant,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: colorScheme(context)
                                              .outlineVariant)),
                                  width: size.width * 0.32,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      hint: Text(
                                        'Select country',
                                        style: textTheme(context)
                                            .labelMedium!
                                            .copyWith(
                                                fontSize: size.width * 0.017,
                                                letterSpacing: 0),
                                      ),
                                      isExpanded: true,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      validator: (newValue) {
                                        if (newValue == null) {
                                          return 'Please select country';
                                        }
                                        return null;
                                      },
                                      value: selectCountry,
                                      style: GoogleFonts.poppins(
                                          color: colorScheme(context).outline,
                                          fontSize: 14),
                                      items: country.map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectCountry = value;
                                        });
                                      },
                                    ),
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
                                'Gender',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.021,
                                    letterSpacing: 0),
                              ),
                              Container(
                                  width: size.width * 0.32,
                                  decoration: BoxDecoration(
                                      color:
                                          colorScheme(context).outlineVariant,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: colorScheme(context)
                                              .outlineVariant)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      hint: Text(
                                        'Select gender',
                                        style: textTheme(context)
                                            .labelSmall!
                                            .copyWith(
                                                fontSize: size.width * 0.017,
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: 0),
                                      ),
                                      isExpanded: true,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      validator: (newValue) {
                                        if (newValue == null) {
                                          return 'Please select gender';
                                        }
                                        return null;
                                      },
                                      value: selectedGender,
                                      style: GoogleFonts.poppins(
                                          color: colorScheme(context).outline,
                                          fontSize: 14),
                                      items: genders.map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGender = value;
                                        });
                                      },
                                    ),
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
                                'First Name',
                                style: textTheme(context).bodySmall!.copyWith(
                                    fontSize: size.width * 0.01,
                                    letterSpacing: 0),
                              ),
                              SizedBox(
                                  width: size.width * 0.24,
                                  child: const CustomTextFormField(
                                    hint: 'Enter your first name',
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
                              const Text('Last Name'),
                              SizedBox(
                                  width: size.width * 0.24,
                                  child: const CustomTextFormField(
                                    hint: 'Enter your last name',
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Email'),
                              SizedBox(
                                  width: size.width * 0.24,
                                  child: const CustomTextFormField(
                                    hint: 'Enter your email',
                                    validationType: ValidationType.email,
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.06,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Language '),
                              SizedBox(
                                  width: size.width * 0.24,
                                  child: const CustomTextFormField(
                                    hint: 'Enter your language',
                                    validationType: ValidationType.phoneNumber,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Country'),
                              Container(
                                  decoration: BoxDecoration(
                                      color:
                                          colorScheme(context).outlineVariant,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: colorScheme(context)
                                              .outlineVariant)),
                                  width: size.width * 0.24,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      hint: const Text('Select country'),
                                      isExpanded: true,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      validator: (newValue) {
                                        if (newValue == null) {
                                          return 'Please select country';
                                        }
                                        return null;
                                      },
                                      value: selectCountry,
                                      style: GoogleFonts.poppins(
                                          color: colorScheme(context).outline,
                                          fontSize: 14),
                                      items: country.map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectCountry = value;
                                        });
                                      },
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.06,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Gender'),
                              Container(
                                  decoration: BoxDecoration(
                                      color:
                                          colorScheme(context).outlineVariant,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: colorScheme(context)
                                              .outlineVariant)),
                                  width: size.width * 0.24,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      hint: const Text('Select gender'),
                                      isExpanded: true,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      validator: (newValue) {
                                        if (newValue == null) {
                                          return 'Please select gender';
                                        }
                                        return null;
                                      },
                                      value: selectedGender,
                                      style: GoogleFonts.poppins(
                                          color: colorScheme(context).outline,
                                          fontSize: 14),
                                      items: genders.map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGender = value;
                                        });
                                      },
                                    ),
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
