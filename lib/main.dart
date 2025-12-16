import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_kit/overlay_kit.dart';
//import 'package:schulupparent/parent/localization/app_localization.dart';
import 'package:schulupparent/parent/parent_presentation/signalr_chat/controller/signalr_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//import 'package:schulupparent/parent/routes/app_routes.dart';
//import 'package:schulupparent/parent_presentation/signalr_chat/controller/signalr_service.dart';
// import 'package:schulupparent/presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'parent/core/app_export.dart';
import 'dart:io' show Platform;
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// import 'parent/core/utils/logger.dart';
// import 'parent/core/utils/size_utils.dart';
// import 'parent/theme/theme_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize FFI for desktop platforms
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }


  Get.put(SignalRChatService());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    value,
  ) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });

  // AcademicsAssignmentStatusController controllerxxx =
  //     Get.put(AcademicsAssignmentStatusController());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return OverlayKit(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            translations: AppLocalization(),
            locale: Locale('en', ''),
            fallbackLocale: Locale('en', ''),
            title: 'Schulup Parent',
            initialRoute: AppRoutes.initialRoute,
            getPages: AppRoutes.pages,
            builder: (context, child) {
              // return MediaQuery(
              //   data: MediaQuery.of(
              //     context,
              //   ).copyWith(textScaler: TextScaler.linear(1.0)),
              //   child: child!,
              // );
              final mediaQuery = MediaQuery.maybeOf(context);
              if (mediaQuery == null) return child!; // safety for first build
              return MediaQuery(
                data: mediaQuery.copyWith(
                  textScaler: const TextScaler.linear(1.0),
                ),
                child: child!,
              );
            },
          ),
        );
      },
    );
  }
}
