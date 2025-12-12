import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class NewsShimmerWidget extends StatelessWidget {
  const NewsShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.h),
        decoration: AppDecoration.primaryC11.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage62,
                height: 170.h,
                width: double.maxFinite,
                radius: BorderRadius.circular(5.h),
              ),
              SizedBox(
                width: double.infinity,
                child:
                //  Obx(
                //   () =>
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(5.h),
                      decoration: BoxDecoration(
                        color: Color(0xffFFEED4),

                        shape: BoxShape.circle,
                      ),
                      child: CustomImageView(
                        imagePath: 'assets/images/img_icons_small_news.png',
                      ),
                      // CustomImageView(
                      //   imagePath:   dashboardItemModelObj.imagePath,
                      //   height: 40.h,
                      //   width: 40.h,
                      // ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: 250.h,
                        child: Container(
                          width: double.maxFinite,
                          height: 14.h,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                //   ),
              ),
              // Obx(
              //   () =>
              Container(
                width: double.maxFinite,
                height: 14.h,
                color: Colors.white,
              ),
              // Html(
              //   data: newsAllItemModelObj.content,
              //   style: {
              //     "body": Style(
              //       maxLines: 2,
              //       textOverflow: TextOverflow.ellipsis,
              //       fontSize: FontSize(12.0),
              //       fontWeight: FontWeight.w400,
              //       lineHeight: LineHeight(1.5),
              //       color: theme.colorScheme.secondaryContainer,
              //     ),
              //   },
              // ),
              // ),
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgIconsTinyAttachment,
                      height: 16.h,
                      width: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child:
                      //  Obx(
                      //   () =>
                      Container(width: 100.h, color: Colors.white),
                      //),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
