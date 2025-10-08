// Notification Item Model
import 'package:flutter/material.dart';

class NotificationItem {
  final String id;
  final String type; // 'order', 'offer', 'account', 'general'
  final String title;
  final String message;
  final DateTime timestamp;
  bool isRead;
  final IconData icon;
  final Color color;

  NotificationItem({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.isRead,
    required this.icon,
    required this.color,
  });
}