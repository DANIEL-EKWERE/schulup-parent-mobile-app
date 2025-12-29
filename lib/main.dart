import 'dart:developer' as myLog;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/firebase_options.dart';
//import 'package:schulupparent/parent/localization/app_localization.dart';
import 'package:schulupparent/parent/parent_presentation/signalr_chat/controller/signalr_service.dart';
import 'package:schulupparent/send_token_service.dart';
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

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  myLog.log('Handling a background message: ${message.messageId}');

  // Initialize flutter_local_notifications for background messages
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Show notification for background message
  if (message.notification != null) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
          ),
        ),
      );
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Handle notification that launched the app from terminated state
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    myLog.log(
      'App launched from terminated state by notification: ${initialMessage.messageId}',
    );
    // Handle the initial message here (e.g., navigate to specific screen)
  }
SendTokenService sendTokenService = Get.put(SendTokenService());
  final fcm = FirebaseMessaging.instance;
  // NotificationSettings settings = await fcm.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // var token = await fcm.getToken();
  //myLog.log('FCM Token: $token');

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  NotificationSettings notificationSettings = await fcm.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (notificationSettings.authorizationStatus ==
      AuthorizationStatus.authorized) {
    myLog.log('User granted permission');
    var token = await fcm.getToken();
    if (token != null) {
      myLog.log('FCM Token: $token');
      sendTokenService.registerToken(token, null, null);
    }
  } else if (notificationSettings.authorizationStatus ==
      AuthorizationStatus.provisional) {
    myLog.log('User granted provisional permission');
  } else {
    myLog.log('User declined or has not accepted permission');
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    myLog.log('Received a message while in the foreground!');
    myLog.log('Message data: ${message.data}');

    if (message.notification != null) {
      myLog.log(
        'Message also contained a notification: ${message.notification}',
      );

      myLog.log('title: ${message.notification!.title}');

      myLog.log('title: ${message.notification!.body}');

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel', // id
              'High Importance Notifications', // title
              channelDescription:
                  'This channel is used for important notifications.', // description
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker',
            ),
          ),
        );
      }

      // LocalNotifications.show(
      //   message.notification!.hashCode,
      //   message.notification!.title ?? '',
      //   message.notification!.body ?? '',
      //   message.data,
      // );
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    myLog.log('Message clicked!: $message');
  });

  FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
    myLog.log('FCM Token refreshed: $newToken');
    sendTokenService.registerToken(newToken, null, null);
  });

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
