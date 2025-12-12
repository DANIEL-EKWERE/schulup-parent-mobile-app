import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/app_export.dart';

class AttendanceShimmerWidget extends StatelessWidget {
  const AttendanceShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            _buildDateHeaderShimmer(),
            SizedBox(height: 10.h),
            _buildAttendanceLogsShimmer(),
          ],
        ),
      ),
    );
  }

  /// Date header shimmer
  Widget _buildDateHeaderShimmer() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 10.h),
          Container(
            height: 16.h,
            width: 150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  /// All attendance logs shimmer
  Widget _buildAttendanceLogsShimmer() {
    return Column(
      children: [
        _buildAttendanceRowShimmer(),
        SizedBox(height: 4.h),
        _buildAttendanceRowShimmer(hasTopPadding: true),
        SizedBox(height: 4.h),
        _buildAttendanceRowShimmer(),
        SizedBox(height: 4.h),
        _buildAttendanceRowShimmer(hasTopPadding: true),
        SizedBox(height: 4.h),
        _buildAttendanceRowShimmer(),
        SizedBox(height: 4.h),
        _buildAttendanceRowShimmer(hasTopPadding: true),
        SizedBox(height: 4.h),
        _buildAttendanceRowShimmer(),
        SizedBox(height: 4.h),
        _buildAttendanceRowShimmer(),
      ],
    );
  }

  /// Individual attendance row shimmer
  Widget _buildAttendanceRowShimmer({bool hasTopPadding = false}) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            hasTopPadding
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: hasTopPadding ? 8.h : 0),
            child: Container(
              height: 12.h,
              width: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
            ),
          ),
          _buildTimeFieldShimmer(),
        ],
      ),
    );
  }

  /// Time field shimmer
  Widget _buildTimeFieldShimmer() {
    return Container(
      width: 244.h,
      height: 36.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
    );
  }
}
