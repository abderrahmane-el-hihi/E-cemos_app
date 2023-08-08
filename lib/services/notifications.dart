import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialize = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
    var initializationsSettings = InitializationSettings(
      android: androidInitialize,
      iOS: iosInitialize,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
    );
  }

  var platformChannelSpecifics = const NotificationDetails(
    android: AndroidNotificationDetails(
      '',
      '',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
    ),
    iOS: DarwinNotificationDetails(),
  );
  //initialize the plugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  void scheduleBackgroundNotification(
      Map<String, dynamic> notificationData) async {
    // Initialize the settings for each platform (Android and iOS)
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: onSelectNotification
    );

    // Create the notification details
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    // Create the notification and schedule it
    await flutterLocalNotificationsPlugin.show(
      0,
      notificationData['title'], // Notification title from API data
      notificationData['body'], // Notification body from API data
      platformChannelSpecifics,
      payload: 'payload',
    );
  }

  Future<void> onSelectNotification(String payload) async {
    // If the app is in the background, resume the app
    // if (payload != null) {
    //   await flutterLocalNotificationsPlugin
    //       .resolvePlatformSpecificImplementation<
    //           AndroidFlutterLocalNotificationsPlugin>()
    //       ?.getNotificationChannels();

    //   // If the app is in the background, resume the app
    //   if (payload != null) {
    //     // In this example, I'm assuming that the main.dart contains the MaterialApp with the initial route '/'. Modify this line accordingly if your main.dart has a different initial route.
    //     await Navigator.pushNamedAndRemoveUntil(context, const LoginPage(), (route) => false);
    //   }
    // }
    print('Notification tapped: $payload');
  }

  // Create the notification and schedule it

  // static Future showBigTextNotification(
  //     {var id = 1,
  //     required String title,
  //     required String body,
  //     var payload,
  //     required FlutterLocalNotificationsPlugin fln}) async {
  //   AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       new AndroidNotificationDetails(
  //     '',
  //     '',
  //     playSound: true,
  //     sound: RawResourceAndroidNotificationSound('notification'),
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   var not = NotificationDetails(
  //     android: androidPlatformChannelSpecifics,
  //   );
  //   await fln.show(0, title, body, not);
  // }
}
