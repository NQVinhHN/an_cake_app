import 'package:an_cake_app/models/notification_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../translations/locale_keys.g.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NotificationState>(context, listen: true);
    return Consumer<NotificationState>(
      builder: (context, value, child) {
        final notificationList = value.notificationList;
        return ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          children: List.generate(
            notificationList.length,
            (index) {
              var notificationItem = provider.notificationList[index];
              return Container(
                color: Colors.grey[400],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: notificationItem.product.img,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            LocaleKeys.ns_notification_quotes.tr(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PopupMenuButton<String>(
                          icon: const Icon(Icons.more_horiz_outlined),
                          itemBuilder: (BuildContext context) {
                            return provider.choices.map((String choice) {
                              return PopupMenuItem<String>(
                                onTap: () {
                                  provider
                                      .removeNotificationItem(notificationItem);
                                },
                                value: choice,
                                child: Text(choice,
                                    style: const TextStyle(fontSize: 10)),
                              );
                            }).toList();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
