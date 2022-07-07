import 'package:an_cake_app/models/notification_list.dart';
import 'package:flutter/material.dart';

class NotiList extends StatelessWidget {
  const NotiList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      children: List.generate(
        notiList.length,
        (index) {
          return Container(
            color: Colors.grey[400],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(notiList[index].img),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(notiList[index].notiquotes),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: notiList[index].icon,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
