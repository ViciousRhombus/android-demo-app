import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final _plugin = FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;

  Future<void> initNotification() async {
    if (_isInitialized) return;

    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );
    await _plugin.initialize(settings);

    // Android 13+ runtime permission
    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    _isInitialized = true;
  }

  NotificationDetails _details(String title, String body) {
    final bigText = BigTextStyleInformation(
      body,
      contentTitle: ' $title',
      summaryText: body,
    );

    return NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notifications',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
        ticker: title,
        // heads‑up text on legacy devices
        channelAction: AndroidNotificationChannelAction.createIfNotExists,
        color: const Color(0xFF5EBCF2),
        // tray accent colour
        enableLights: true,
        ledColor: const Color(0xFF5EBCF2),
        ledOnMs: 800,
        ledOffMs: 400,
        enableVibration: true,
        vibrationPattern: Int64List.fromList([0, 300, 100, 400]),
        styleInformation: bigText,
      ),
    );
  }

  Future<void> showNotification({
    int id = 0,
    required String title,
    required String body,
  }) async {
    await _plugin.show(id, title, body, _details(title, body));
  }
}
