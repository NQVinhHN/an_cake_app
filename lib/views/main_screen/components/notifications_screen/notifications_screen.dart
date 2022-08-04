import 'package:an_cake_app/models/notification_state.dart';
import 'package:an_cake_app/views/main_screen/components/notifications_screen/components/noti_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../translations/locale_keys.g.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NotificationState>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.grey,
              height: 2.0,
            ),
          ),
          elevation: 0,
          leadingWidth: 150,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  LocaleKeys.ns_notifications.tr(),
                  style: const TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: TextButton(
                    onPressed: () {
                      provider.deleteAllList();
                    },
                    child: Text(
                      LocaleKeys.ns_clear_all_notifications.tr(),
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: const NotificationList(),
      ),
    );
  }
}
