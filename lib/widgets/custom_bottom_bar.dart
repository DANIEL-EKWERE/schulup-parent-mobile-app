import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

enum BottomBarEnum { Home, Academics, Attendance, Reports, News }

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({Key? key, this.onChanged}) : super(key: key);

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavAcademics,
      activeIcon: ImageConstant.imgNavAcademics,
      title: "lbl_academics".tr,
      type: BottomBarEnum.Academics,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavAttendance,
      activeIcon: ImageConstant.imgNavAttendance,
      title: "lbl_attendance".tr,
      type: BottomBarEnum.Attendance,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavReports,
      activeIcon: ImageConstant.imgNavReports,
      title: "lbl_reports".tr,
      type: BottomBarEnum.Reports,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavNews,
      activeIcon: ImageConstant.imgNavNews,
      title: "lbl_news".tr,
      type: BottomBarEnum.News,
    ),
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        border: Border(top: BorderSide(color: appTheme.gray20001, width: 1.h)),
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].icon,
                    height: 24.h,
                    width: 24.h,
                    color: theme.colorScheme.secondaryContainer,
                  ),
                  Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.labelMediumSecondaryContainer
                        .copyWith(color: theme.colorScheme.secondaryContainer),
                  ),
                ],
              ),
              activeIcon: SizedBox(
                width: double.maxFinite,
                child: Column(
                  spacing: 4,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].activeIcon,
                      height: 24.h,
                      width: 26.h,
                      color: theme.colorScheme.primary,
                    ),
                    Text(
                      bottomMenuList[index].title ?? "",
                      style: CustomTextStyles.labelMediumPrimary.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
