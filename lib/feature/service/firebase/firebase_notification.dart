// ignore_for_file: avoid_print, unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/elastic_log/elastic_log.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';

import 'local_notification.dart';

class FirebaseNotification {
  static void init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    final onNotifications = BehaviorSubject<String?>();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? firebaseToken = await messaging.getToken();
    print('TOKEN : ');
    print(firebaseToken);
    SharedManager()
        .setString(SharedEnum.firebaseToken, firebaseToken.toString());

    FirebaseMessaging.onBackgroundMessage(
      (message) => LocalNotification.showNotification(
          title: "message.notification?.title",
          body: "message.notification?.body",
          payload: 'asd'),
    );

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {}
      }
    });

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: ((data) async {
      onNotifications.add(data);
    }));

    void onClickedNotification(String? payload) {
      print('Foreground Payload : $payload');
      ElasticLog().sendLog(
          'info',
          'NotificationLogOnClicked',
          'Kullanıcı bildirime tıkladı. Bildirim içeriği : $payload',
          'notificationLogOnClicked');
    }

    onNotifications.stream.listen(onClickedNotification);
  }
}
