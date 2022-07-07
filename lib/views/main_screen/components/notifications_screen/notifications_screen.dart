import 'package:an_cake_app/views/main_screen/components/notifications_screen/components/noti_list.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: const [
              Text(
                "Notifications",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                "Clear all notifications",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: const NotiList(),
      ),
    );
  }
}
