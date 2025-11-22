import 'package:flutter/material.dart';
import 'package:schulupparent/core/utils/size_utils.dart';
import 'package:schulupparent/presentation/news_events_screen/widgets/listline_item_widget.dart';
import 'package:schulupparent/presentation/signin_screen/shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          itemCount: 5,
          //isLoading ? 5 : newsItems.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            // if (isLoading) {
            return ListlineShimmerWidget();
            // }
            // return ListlineItemWidget(newsItems[index]);
          },
        ),
      ),
    );
  }
}
