// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/news_all_variants_page/models/news_model.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../controller/news_news_content_contains_controller.dart';

// ignore_for_file: must_be_immutable
class ListweburlItemWidget extends StatelessWidget {
  ListweburlItemWidget(this.listweburlItemModelObj, {Key? key})
    : super(key: key);

  Attachment listweburlItemModelObj;

  var controller = Get.find<NewsNewsContentContainsController>();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      readOnly: true,
      //controller: listweburlItemModelObj.weburlController,
      hintText: //"lbl_image_jpeg".tr,
          listweburlItemModelObj.fileNameAndExtention,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgIconsTinyImageFilled,
          height: 16.h,
          width: 16.h,
          fit: BoxFit.contain,
        ),
      ),
      prefixConstraints: BoxConstraints(maxHeight: 44.h),
      suffix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgIconsTinyDownload,
          height: 16.h,
          width: 16.h,
          fit: BoxFit.contain,
        ),
      ),
      suffixConstraints: BoxConstraints(maxHeight: 44.h),
      contentPadding: EdgeInsets.all(14.h),
      borderDecoration: TextFormFieldStyleHelper.fillGray,
      fillColor: appTheme.gray20001,
    );
  }
}
