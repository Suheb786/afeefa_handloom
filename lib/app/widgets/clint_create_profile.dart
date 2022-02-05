import 'package:afeefa_handloom/app/widgets/custom_button.dart';
import 'package:afeefa_handloom/app/widgets/custom_text_form_field.dart';
import 'package:afeefa_handloom/app/widgets/snakbars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:afeefa_handloom/app/modules/home/create_edit_profile/controllers/create_edit_profile_controller.dart';

import '../constents/colors.dart';
import '../controllers/db_controller.dart';

class ClintCreateProfile extends StatelessWidget {
  const ClintCreateProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Colors.grey,
                offset: Offset(1, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: offWhite,
            // gradient: LinearGradient(
            //   colors: [
            //     concrete,
            //     offWhite,
            //   ],
            //   begin: Alignment(0, -1),
            //   end: Alignment(0, 0),
            // ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: concrete,
                    // gradient: LinearGradient(
                    //   colors: [
                    //     concrete,
                    //     offWhite,
                    //   ],
                    //   begin: Alignment(0, -1),
                    //   end: Alignment(0, 0),
                    // ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        GradientText(
                          'User Info',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: royal,
                                    fontSize: 20,
                                  ),
                          colors: [royal, redOrenge],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(50),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(50),
                                splashColor: redOrenge,
                                onTap: () =>
                                    Get.find<CreateEditProfileController>()
                                        .picImageSquare(ImageType.user),
                                child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 40,
                                    child: Obx(
                                      () {
                                        if (Get.find<
                                                    CreateEditProfileController>()
                                                .uploadImageFile
                                                .value !=
                                            null) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 2,
                                                color: royal.withOpacity(0.6),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(17),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.file(Get.find<
                                                      CreateEditProfileController>()
                                                  .uploadImageFile
                                                  .value!),
                                            ),
                                          );
                                        } else {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.upload,
                                                size: 40,
                                              ),
                                              Text(
                                                'Image',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                      color: royal,
                                                      fontSize: 10,
                                                    ),
                                              ),
                                            ],
                                          );
                                        }
                                      },
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomTextFormField(
                                    validator: ((val) {
                                      if (val!.length < 5) {
                                        return "Name length can't be less then 5";
                                      } else {
                                        return null;
                                      }
                                    }),
                                    controller:
                                        Get.find<CreateEditProfileController>()
                                            .userNameController,
                                    labelText: "Name",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () => {
                                      customBar(
                                        title: "Phone No. can not be changed",
                                        duration: 2,
                                      )
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: slate.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: royal.withOpacity(0.4),
                                              width: 2)),
                                      child: GradientText(
                                        "Phone No. ${Get.find<DbController>().userData.value!['phoneNumber']}",
                                        colors: [
                                          royal,
                                          redOrenge,
                                        ],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: concrete,
                    // gradient: LinearGradient(
                    //   colors: [
                    //     concrete,
                    //     offWhite,
                    //   ],
                    //   begin: Alignment(0, -1),
                    //   end: Alignment(0, 0),
                    // ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        GradientText(
                          'Farm Info',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: royal,
                                    fontSize: 20,
                                  ),
                          colors: [royal, redOrenge],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(50),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(50),
                                splashColor: redOrenge,
                                onTap: () =>
                                    Get.find<CreateEditProfileController>()
                                        .picImageSquare(ImageType.logo),
                                child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 40,
                                    child: Obx(
                                      () {
                                        if (Get.find<
                                                    CreateEditProfileController>()
                                                .uploadLogoFile
                                                .value !=
                                            null) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 2,
                                                color: royal.withOpacity(0.6),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(17),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.file(Get.find<
                                                      CreateEditProfileController>()
                                                  .uploadLogoFile
                                                  .value!),
                                            ),
                                          );
                                        } else {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.upload,
                                                size: 40,
                                              ),
                                              Text(
                                                'Logo',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                      color: royal,
                                                      fontSize: 10,
                                                    ),
                                              ),
                                            ],
                                          );
                                        }
                                      },
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomTextFormField(
                                    validator: ((val) {
                                      if (val!.length < 5) {
                                        return "Farm Name can't be less then 5 characters";
                                      } else {
                                        return null;
                                      }
                                    }),
                                    controller:
                                        Get.find<CreateEditProfileController>()
                                            .farmNameController,
                                    labelText: 'Farm Name',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFormField(
                                    validator: ((val) {
                                      if (val!.length != 15) {
                                        return "GST No. can't be less then 15 digits";
                                      } else {
                                        return null;
                                      }
                                    }),
                                    controller:
                                        Get.find<CreateEditProfileController>()
                                            .gstNumberController,
                                    labelText: "GST Number",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          // height: 40,
                          color: royal.withOpacity(0.2),
                          thickness: 1,
                        ),
                        GradientText(
                          'Bank Account Info',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: royal,
                                    fontSize: 15,
                                  ),
                          colors: [royal, redOrenge],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          labelText: "Bank Name ( Optional )",
                          controller: Get.find<CreateEditProfileController>()
                              .bankNameController,
                        ),
                        SizedBox(height: 10),
                        CustomTextFormField(
                          keyboardType: TextInputType.number,
                          labelText: "Account No. ( Optional )",
                          controller: Get.find<CreateEditProfileController>()
                              .accountNumberController,
                        ),
                        SizedBox(height: 10),
                        CustomTextFormField(
                          labelText: "IFSC Code ( Optional )",
                          controller: Get.find<CreateEditProfileController>()
                              .ifscCodeController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Divider(
          height: 30,
          color: royal.withOpacity(0.2),
          thickness: 1,
        ),
        CustomButton(
          onTap: () {
            if (Get.find<CreateEditProfileController>().uploadImageFile.value ==
                null) {
              customBar(
                title: "Please Select Profile Picture",
                duration: 2,
              );
            } else if (Get.find<CreateEditProfileController>()
                    .uploadLogoFile
                    .value ==
                null) {
              customBar(
                title: "Please Select A Logo",
                duration: 2,
              );
            } else {
              if (Get.find<CreateEditProfileController>()
                  .formKey
                  .currentState!
                  .validate()) {
                Get.find<CreateEditProfileController>().createClintProfileModel();
              }
            }
          },
          label: 'Submit',
        ),
      ],
    );
  }
}