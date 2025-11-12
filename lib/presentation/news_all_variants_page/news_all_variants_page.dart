// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/news_all_variants_controller.dart';
import 'models/news_all_item_model.dart';
import 'models/news_all_variants_model.dart';
import 'widgets/news_all_item_widget.dart';

// ignore_for_file: must_be_immutable
class NewsAllVariantsPage extends StatelessWidget {
  NewsAllVariantsPage({Key? key}) : super(key: key);

  NewsAllVariantsController controller = Get.put(
    NewsAllVariantsController(NewsAllVariantsModel().obs),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 24.h, top: 14.h, right: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_buildNewsall()],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleOne(text: "lbl_news".tr),
          AppbarSubtitleFive(
            text: "lbl_ogechi".tr,
            margin: EdgeInsets.symmetric(horizontal: 6.h),
          ),
        ],
      ),
      actions: [
        AppbarTrailingIconbutton(imagePath: ImageConstant.imgIconsSmallEvents),
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgUserWhiteA700,
          margin: EdgeInsets.only(left: 11.h, right: 25.h),
        ),
      ],
      styleType: Style.bgFillPrimary,
    );
  }

  /// Section Widget
  Widget _buildNewsall() {
    return Expanded(
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.h);
          },
          itemCount:
              controller
                  .newsAllVariantsModelObj
                  .value
                  .newsAllItemList
                  .value
                  .length,
          itemBuilder: (context, index) {
            NewsAllItemModel model =
                controller
                    .newsAllVariantsModelObj
                    .value
                    .newsAllItemList
                    .value[index];
            return NewsAllItemWidget(model);
          },
        ),
      ),
    );
  }
}
