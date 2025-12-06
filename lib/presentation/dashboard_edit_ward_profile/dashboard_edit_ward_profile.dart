// TODO Implement this library.
import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:schulupparent/data/model/selectionPopupModel/selection_popup_model.dart';
import 'package:schulupparent/presentation/dashboard_edit_ward_profile/controller/dashboard_edit_ward_profile_controller.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/widgets/custom_drop_down.dart';
import 'package:schulupparent/widgets/custom_text_form_field.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();

DashboardEditWardProfileController controller = Get.put(
  DashboardEditWardProfileController(),
);

class DashboardEditWardProfileScreen extends StatefulWidget {
  const DashboardEditWardProfileScreen({Key? key}) : super(key: key);

  @override
  State<DashboardEditWardProfileScreen> createState() =>
      _DashboardEditWardProfileScreenState();
}

class _DashboardEditWardProfileScreenState
    extends State<DashboardEditWardProfileScreen> {
  @override
  void initState() {
    super.initState();
    controller.getStudentInfo();
    print('calling init state here');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: ListView(
            //  mainAxisSize: MainAxisSize.max,
            children: [
              Obx(
                () =>
                    controller.isLoading.value
                        ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 100.h),
                            child: CircularProgressIndicator(),
                          ),
                        )
                        : Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.only(
                            left: 24.h,
                            top: 20.h,
                            right: 24.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              //  _buildColumntherespir()
                              SizedBox(height: 30),
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundImage: AssetImage(
                                      'assets/images/ward_image.png',
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CustomImageView(
                                      imagePath:
                                          'assets/images/img_take_photo.svg',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'Last Name',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextFormField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: controller.lastNameController,
                                hintText: "Last Name",
                                hintStyle:
                                    CustomTextStyles.labelLargeBluegray700,
                                // prefix: Container(
                                //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgPassword,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                // suffix: Container(
                                //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgVisibility,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                contentPadding: EdgeInsets.all(14.h),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineGray,
                                fillColor: appTheme.gray100,
                              ),

                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'First Name',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextFormField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: controller.firstNameController,
                                hintText: "First Name",
                                hintStyle:
                                    CustomTextStyles.labelLargeBluegray700,
                                // prefix: Container(
                                //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgPassword,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                // suffix: Container(
                                //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgVisibility,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                contentPadding: EdgeInsets.all(14.h),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineGray,
                                fillColor: appTheme.gray100,
                              ),

                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'Middle Name',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextFormField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: controller.middleNameController,
                                hintText: "Middle Name",
                                hintStyle:
                                    CustomTextStyles.labelLargeBluegray700,
                                // prefix: Container(
                                //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgPassword,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                // suffix: Container(
                                //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgVisibility,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                contentPadding: EdgeInsets.all(14.h),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineGray,
                                fillColor: appTheme.gray100,
                              ),

                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'Gender',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),

                              // CustomDropDown(
                              //   //controller: controller.genderController,
                              //   onChanged: (value) {
                              //     setState(() {});
                              //   },
                              //   items: [
                              //     SelectionPopupModel(title: 'Male'),
                              //     SelectionPopupModel(title: 'Female'),
                              //   ],
                              //   hintText: "Gender",
                              //   hintStyle: CustomTextStyles.labelLargeBluegray700,
                              //   // prefix: Container(
                              //   //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                              //   //   child: CustomImageView(
                              //   //     imagePath: ImageConstant.imgPassword,
                              //   //     height: 16.h,
                              //   //     width: 16.h,
                              //   //     fit: BoxFit.contain,
                              //   //   ),
                              //   // ),
                              //   prefixConstraints: BoxConstraints(maxHeight: 44.h),
                              //   // suffix: Container(
                              //   //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                              //   //   child: CustomImageView(
                              //   //     imagePath: ImageConstant.imgChevronDown,
                              //   //     height: 16.h,
                              //   //     width: 16.h,
                              //   //     fit: BoxFit.contain,
                              //   //   ),
                              //   // ),
                              //   // suffixConstraints: BoxConstraints(maxHeight: 44.h),
                              //   // contentPadding: EdgeInsets.all(14.h),
                              //   // borderDecoration: TextFormFieldStyleHelper.outlineGray,
                              //   // fillColor: appTheme.gray100,
                              // ),
                              SizedBox(
                                height: 50.h,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(14.h),
                                    filled: true,
                                    fillColor: appTheme.gray100,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.h),
                                      borderSide: BorderSide(
                                        color: appTheme.gray200,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.h),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                  initialValue:
                                      ['Male', 'Female', 'Other'].contains(
                                            controller.selectedGender.value,
                                          )
                                          ? controller.selectedGender.value
                                          : null,
                                  hint: Text('Select Gender'),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'Male',
                                      child: Text('Male'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Female',
                                      child: Text('Female'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Other',
                                      child: Text('Other'),
                                    ),
                                  ],
                                  onChanged: (String? value) {
                                    controller.selectedGender.value =
                                        value ?? '';
                                    print(
                                      "${controller.selectedGender.value} selected",
                                    );
                                  },
                                ),
                              ),

                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'Date Of Birth',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextFormField(
                                controller: controller.dateOfBirthController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                hintText: "Date Of Birth",
                                hintStyle:
                                    CustomTextStyles.labelLargeBluegray700,
                                // prefix: Container(
                                //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgPassword,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                suffix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                    16.h,
                                    14.h,
                                    14.h,
                                    14.h,
                                  ),
                                  child: CustomImageView(
                                    imagePath:
                                        'assets/images/img_icons_small_calender_outlined.svg',
                                    height: 16.h,
                                    width: 16.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                contentPadding: EdgeInsets.all(14.h),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineGray,
                                fillColor: appTheme.gray100,
                              ),

                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'Blood Group',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),
                              // CustomTextFormField(
                              //   controller: controller.bloodGroupController,
                              //   onChanged: (value) {
                              //     setState(() {});
                              //   },
                              //   hintText: "Blood Group",
                              //   hintStyle: CustomTextStyles.labelLargeBluegray700,
                              //   // prefix: Container(
                              //   //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                              //   //   child: CustomImageView(
                              //   //     imagePath: ImageConstant.imgPassword,
                              //   //     height: 16.h,
                              //   //     width: 16.h,
                              //   //     fit: BoxFit.contain,
                              //   //   ),
                              //   // ),
                              //   prefixConstraints: BoxConstraints(maxHeight: 44.h),
                              //   // suffix: Container(
                              //   //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                              //   //   child: CustomImageView(
                              //   //     imagePath: ImageConstant.imgVisibility,
                              //   //     height: 16.h,
                              //   //     width: 16.h,
                              //   //     fit: BoxFit.contain,
                              //   //   ),
                              //   // ),
                              //   suffixConstraints: BoxConstraints(maxHeight: 44.h),
                              //   contentPadding: EdgeInsets.all(14.h),
                              //   borderDecoration: TextFormFieldStyleHelper.outlineGray,
                              //   fillColor: appTheme.gray100,
                              // ),
                              SizedBox(
                                height: 50.h,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(14.h),
                                    filled: true,
                                    fillColor: appTheme.gray100,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.h),
                                      borderSide: BorderSide(
                                        color: appTheme.gray200,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.h),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                  initialValue:
                                      [
                                            'A+',
                                            'A-',
                                            'B+',
                                            'B-',
                                            'AB+',
                                            'AB-',
                                            'O+',
                                            'O-',
                                          ].contains(
                                            controller.selectedBloodGroup.value,
                                          )
                                          ? controller.selectedBloodGroup.value
                                          : null,
                                  hint: Text('Blood Group'),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'A+',
                                      child: Text('A+'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'A-',
                                      child: Text('A-'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'B+',
                                      child: Text('B+'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'B-',
                                      child: Text('B-'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'B+',
                                      child: Text('B+'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'AB+',
                                      child: Text('AB+'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'AB-',
                                      child: Text('AB-'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'O+',
                                      child: Text('O+'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'O-',
                                      child: Text('O-'),
                                    ),
                                  ],
                                  onChanged: (String? value) {
                                    controller.selectedBloodGroup.value =
                                        value ?? '';
                                  },
                                ),
                              ),

                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'Genotype',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),
                              // CustomTextFormField(
                              //   controller: controller.genotypeController,
                              //   onChanged: (value) {
                              //     setState(() {});
                              //   },
                              //   hintText: "Genotype",
                              //   hintStyle:
                              //       CustomTextStyles.labelLargeBluegray700,
                              //   // prefix: Container(
                              //   //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                              //   //   child: CustomImageView(
                              //   //     imagePath: ImageConstant.imgPassword,
                              //   //     height: 16.h,
                              //   //     width: 16.h,
                              //   //     fit: BoxFit.contain,
                              //   //   ),
                              //   // ),
                              //   prefixConstraints: BoxConstraints(
                              //     maxHeight: 44.h,
                              //   ),
                              //   // suffix: Container(
                              //   //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                              //   //   child: CustomImageView(
                              //   //     imagePath: ImageConstant.imgVisibility,
                              //   //     height: 16.h,
                              //   //     width: 16.h,
                              //   //     fit: BoxFit.contain,
                              //   //   ),
                              //   // ),
                              //   suffixConstraints: BoxConstraints(
                              //     maxHeight: 44.h,
                              //   ),
                              //   contentPadding: EdgeInsets.all(14.h),
                              //   borderDecoration:
                              //       TextFormFieldStyleHelper.outlineGray,
                              //   fillColor: appTheme.gray100,
                              // ),
                              SizedBox(
                                height: 50.h,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(14.h),
                                    filled: true,
                                    fillColor: appTheme.gray100,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.h),
                                      borderSide: BorderSide(
                                        color: appTheme.gray200,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.h),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                  initialValue:
                                      ['AA', 'AS', 'SS'].contains(
                                            controller.selectedGenotype.value,
                                          )
                                          ? controller.selectedGenotype.value
                                          : null,
                                  hint: Text('Genotype'),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'AA',
                                      child: Text('AA'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'AS',
                                      child: Text('AS'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'SS',
                                      child: Text('SS'),
                                    ),
                                  ],
                                  onChanged: (String? value) {
                                    controller.selectedGenotype.value =
                                        value ?? '';
                                  },
                                ),
                              ),

                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'Place Of Birth',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextFormField(
                                controller:
                                    controller.placeOfBirthNameController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                hintText: "Place Of Birth",
                                hintStyle:
                                    CustomTextStyles.labelLargeBluegray700,
                                // prefix: Container(
                                //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgPassword,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                // suffix: Container(
                                //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgVisibility,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                contentPadding: EdgeInsets.all(14.h),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineGray,
                                fillColor: appTheme.gray100,
                              ),

                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'State',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextFormField(
                                controller: controller.stateController,
                                hintText: "State",
                                hintStyle:
                                    CustomTextStyles.labelLargeBluegray700,
                                // prefix: Container(
                                //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgPassword,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                // suffix: Container(
                                //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgVisibility,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                contentPadding: EdgeInsets.all(14.h),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineGray,
                                fillColor: appTheme.gray100,
                              ),
                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'City',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextFormField(
                                controller: controller.cityController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                //  controller: controller.passwordController,
                                hintText: "City",
                                hintStyle:
                                    CustomTextStyles.labelLargeBluegray700,
                                // prefix: Container(
                                //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgPassword,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                // suffix: Container(
                                //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgVisibility,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                contentPadding: EdgeInsets.all(14.h),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineGray,
                                fillColor: appTheme.gray100,
                              ),

                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'Address',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextFormField(
                                controller: controller.addressController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                //  controller: controller.passwordController,
                                hintText: "Address",
                                hintStyle:
                                    CustomTextStyles.labelLargeBluegray700,
                                // prefix: Container(
                                //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgPassword,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                // suffix: Container(
                                //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgVisibility,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                contentPadding: EdgeInsets.all(14.h),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineGray,
                                fillColor: appTheme.gray100,
                              ),

                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'Phone Number',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextFormField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: controller.phoneController,
                                hintText: "Phone Number",
                                hintStyle:
                                    CustomTextStyles.labelLargeBluegray700,
                                // prefix: Container(
                                //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgPassword,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                // suffix: Container(
                                //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgVisibility,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                contentPadding: EdgeInsets.all(14.h),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineGray,
                                fillColor: appTheme.gray100,
                              ),
                              SizedBox(height: 30),
                              Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'Religion',
                                  style: CustomTextStyles.bodyMediumOnPrimary,
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextFormField(
                                controller: controller.religionController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                //  controller: controller.passwordController,
                                hintText: "Religion",
                                hintStyle:
                                    CustomTextStyles.labelLargeBluegray700,
                                // prefix: Container(
                                //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgPassword,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                // suffix: Container(
                                //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                                //   child: CustomImageView(
                                //     imagePath: ImageConstant.imgVisibility,
                                //     height: 16.h,
                                //     width: 16.h,
                                //     fit: BoxFit.contain,
                                //   ),
                                // ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 44.h,
                                ),
                                contentPadding: EdgeInsets.all(14.h),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineGray,
                                fillColor: appTheme.gray100,
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
      //  bottomNavigationBar: _buildColumniconssmal(),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      height: 70,

      leadingWidth: 75.h,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 10,
          width: 10,
          //margin: EdgeInsets.only(left: 25.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffEF5A07),
            border: Border.all(color: Color(0xffFFBC71)),
          ),
          child: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeftWhiteA700,
            //margin: EdgeInsets.only(left: 25.h),
            onTap: () {
              onTapArrowleftone();
              // controller.getStudentInfo();
            },
          ),
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleOne(text: "Ward Profile"),
          AppbarSubtitleFive(
            text: dashboardExtendedViewController.selectedStudent1!.firstName!,
            margin: EdgeInsets.symmetric(horizontal: 33.h),
          ),
        ],
      ),
      actions: [
        (controller.lastNameController.text.isEmpty ||
                controller.firstNameController.text.isEmpty ||
                controller.middleNameController.text.isEmpty ||
                controller.selectedGender.value.isEmpty ||
                controller.dateOfBirthController.text.isEmpty ||
                controller.selectedBloodGroup.value.isEmpty ||
                controller.selectedGenotype.value.isEmpty ||
                controller.placeOfBirthNameController.text.isEmpty ||
                controller.stateController.text.isEmpty ||
                controller.cityController.text.isEmpty ||
                controller.addressController.text.isEmpty ||
                controller.phoneController.text.isEmpty ||
                controller.religionController.text.isEmpty)
            ? SizedBox.shrink()
            : ElevatedButton(
              onPressed: () {
                print(controller.lastNameController.text);
                print(controller.firstNameController.text);
                print(controller.middleNameController.text);
                print(controller.selectedGender.value);
                print(controller.dateOfBirthController.text);
                print(controller.selectedBloodGroup.value);
                print(controller.selectedGenotype.value);
                print(controller.placeOfBirthNameController.text);
                print(controller.stateController.text);
                print(controller.cityController.text);
                print(controller.addressController.text);
                print(controller.phoneController.text);
                print(controller.religionController.text);

                controller.updateStudentInfo();
                
                //controller.changePassword();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff20C6E6),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffA8EFF9)),
                  borderRadius: BorderRadius.circular(16.h),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
                textStyle: CustomTextStyles.bodySmallWhiteA700_1,
              ),
              child: Text('save', style: TextStyle(color: Colors.white)),
            ),
        SizedBox(width: 16.h),
      ],
      styleType: Style.bgFillPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumntherespir() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "msg_the_respiratory".tr,
            style: CustomTextStyles.titleMediumOnPrimary,
          ),
          SizedBox(height: 18.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(color: appTheme.gray400.withValues(alpha: 0.5)),
          ),
          SizedBox(height: 18.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRowpostedon(
              postedonOne: "lbl_subject".tr,
              oct272025One: "lbl_basic_science".tr,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRowpostedon(
              postedonOne: "lbl_posted_on".tr,
              oct272025One: "lbl_oct_27_2025".tr,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.h),
            decoration: AppDecoration.errorC1.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Text(
              "msg_due_on_oct_30".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodySmallWhiteA700,
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(color: appTheme.gray400.withValues(alpha: 0.5)),
          ),
          SizedBox(height: 20.h),
          Text("lbl_question".tr, style: CustomTextStyles.bodyMediumOnPrimary),
          SizedBox(height: 6.h),
          Text(
            "msg_in_your_own_words".tr,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall!.copyWith(height: 1.50),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumniconssmal() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
      decoration: AppDecoration.grayC12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgIconsSmallAttachment,
                  height: 24.h,
                  width: 24.h,
                  alignment: Alignment.bottomCenter,
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                      left: 18.h,
                      top: 12.h,
                      bottom: 12.h,
                    ),
                    decoration: AppDecoration.grayC11.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 228.h,
                          child: Text(
                            "msg_the_respiratory2".tr,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyMediumGray700.copyWith(
                              height: 1.50,
                            ),
                          ),
                        ),
                        CustomIconButton(
                          height: 24.h,
                          width: 24.h,
                          padding: EdgeInsets.all(4.h),
                          decoration: IconButtonStyleHelper.fillPrimary,
                          alignment: Alignment.centerRight,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgVector,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildRowpostedon({
    required String postedonOne,
    required String oct272025One,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          postedonOne,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
        Text(
          oct272025One,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
      ],
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    // Get.back();
    Navigator.pop(context);
  }
}
