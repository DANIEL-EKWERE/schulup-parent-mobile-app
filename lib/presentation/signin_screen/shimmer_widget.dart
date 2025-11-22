import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class ListlineShimmerWidget extends StatelessWidget {
  const ListlineShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.h),
        decoration: AppDecoration.primaryC11.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image/Icon shimmer on the left
              Container(
                width: 40.h,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),

              SizedBox(width: 10.h),

              // Content column shimmer on the right
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top row with date and label shimmer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100.h,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 16.h,
                              height: 16.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            SizedBox(width: 4.h),
                            Container(
                              width: 60.h,
                              height: 12.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    // Description text shimmer
                    Container(
                      width: double.infinity,
                      height: 14.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 200.h,
                      height: 14.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
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
