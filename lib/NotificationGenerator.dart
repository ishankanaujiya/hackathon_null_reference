import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;

  NotificationService._internal();

  final notificationPlugin = FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  Future<void> initNotification() async {
    if (_isInitialized) return;

    const initSettingAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: initSettingAndroid);

    await notificationPlugin.initialize(initSettings);

    // Request notification permission (Android 13+)
    if (Platform.isAndroid) {
      if (await Permission.notification.isDenied) {
        await Permission.notification.request();
      }
    }

    _isInitialized = true;
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'expense_channel_id',
        'Expense Notifications',
        channelDescription: 'Expense Notification Channel',
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    if (!_isInitialized) {
      await initNotification();
    }
    return notificationPlugin.show(id, title, body, notificationDetails());
  }
}

