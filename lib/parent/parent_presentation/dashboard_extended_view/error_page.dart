import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schulupparent/admin/widgets/custom_elevated_button.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/student/routes/app_routes.dart' show AppRoutes;
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

DashboardExtendedViewController controller =
    Get.find<DashboardExtendedViewController>();

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.network_check, size: 150),
            const Center(child: Text('Network Error')),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomElevatedButton(
                onPressed: () {
                  controller.byGuardian();
                  Navigator.pop(context);
                  // Get.offAllNamed(
                  //   AppRoutes.studentAcademicsAssignmentStatusScreen,
                  // );
                },
                text: 'Reload',
                buttonStyle: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xFFFF8D2A)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
