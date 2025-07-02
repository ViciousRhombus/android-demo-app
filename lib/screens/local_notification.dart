import 'package:atlanta_assignment/services/notification_service.dart';
import 'package:flutter/material.dart';

class LocalNotification extends StatelessWidget {
  const LocalNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text('Local Notification'),
        backgroundColor: const Color(0xFF5EBCF2),
        elevation: 2,
      ),
      body: Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF5EBCF2),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            NotificationService().showNotification(
              title: 'Notification Title',
              body: 'This is the body of the local notification.',
            );
          },
          icon: const Icon(Icons.send),
          label: const Text(
            'Send Notification',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
