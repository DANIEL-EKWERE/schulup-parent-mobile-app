import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class TeacherShimmerWidget extends StatelessWidget {
  const TeacherShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.h),
      decoration: AppDecoration.primaryC11.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
                        padding: EdgeInsets.all(12),
                        height: 90.h,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffffeed4)),
                          // color: Color(0xffffeed4),
                          color: Color(0xffFFF7ED),
                          //color: Color(0xffffeed4),
                          borderRadius: BorderRadiusStyle.circleBorder12,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              // backgroundImage: AssetImage(
                              //   'assets/images/class_teacher.png',
                              // ),
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(width: 10),
                            // Text(
                            //   'Class Teacher',
                            //   style: CustomTextStyles.titleMediumOnPrimary,
                            // ),
                            Container(
                              height: 5.h,
                              width: 10.h,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
      ),
    );
  }
}
