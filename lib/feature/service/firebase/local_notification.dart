import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:wm_ppp_4/feature/elastic_log/elastic_log.dart';

class LocalNotification {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        '1',
        'channel name',
        'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      (
        _notifications.show(id, title, body, await _notificationDetails(),
            payload: payload),
        ElasticLog().sendLog(
            'info',
            'NotificationLogForeground',
            'Kullanıcı uygulama açıkken bildirim aldı. Bildirim içeriği : $payload',
            'notificationLogForeground')
      );
}
