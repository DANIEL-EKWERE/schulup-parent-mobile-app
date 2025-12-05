import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../custom_search_view.dart';

class AppbarTitleSearchview extends StatelessWidget {
  AppbarTitleSearchview({Key? key, this.hintText, this.controller, this.margin, this.onChange})
    : super(key: key);

  final String? hintText;

  final TextEditingController? controller;

  final EdgeInsetsGeometry? margin;

  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: SizedBox(
        width: double.maxFinite,
        child: CustomSearchView(
          onChanged: onChange,
          controller: controller,
          hintText: "msg_search_for_an_assignment".tr,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 14.h,
          ),
        ),
      ),
    );
  }
}
