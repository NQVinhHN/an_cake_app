import 'package:an_cake_app/views/main_screen/components/cake_list_screen/widget/cake_list_body.dart';
import 'package:an_cake_app/views/main_screen/components/cake_list_screen/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class CakeListScreen extends StatefulWidget {
  const CakeListScreen({Key? key}) : super(key: key);

  @override
  State<CakeListScreen> createState() => _CakeListScreenState();
}

class _CakeListScreenState extends State<CakeListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.waves_outlined,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nguyen Quoc Vinh",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Row(
                children: [
                  Text(
                    "New York ",
                    style: TextStyle(color: Colors.green[800], fontSize: 15),
                  ),
                  Icon(Icons.circle_rounded,
                      size: 10, color: Colors.green[800]),
                ],
              )
            ],
          ),
          actions: const [
            Icon(Icons.shopping_bag_outlined, color: Colors.black),
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
              foregroundImage: AssetImage('assets/circle_avatar.jpg'),
              // backgroundImage: ,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        backgroundColor: Colors.grey[300],
        body: const CakeListBody(),
      ),
    );
  }
}
