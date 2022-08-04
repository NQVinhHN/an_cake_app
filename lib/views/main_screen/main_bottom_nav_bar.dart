import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../models/notification_state.dart';
import '../../translations/locale_keys.g.dart';
import 'components/cake_list_screen/cake_list_screen.dart';
import 'components/notifications_screen/notifications_screen.dart';
import 'components/setting_screen/settings_screen.dart';
import 'components/trending_screen/trending_screen.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({Key? key}) : super(key: key);
  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int pageIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> pageList = const <Widget>[
    CakeListScreen(),
    TrendingScreen(),
    NotificationScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NotificationState>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            children: const <Widget>[
              CakeListScreen(),
              TrendingScreen(),
              NotificationScreen(),
              SettingsScreen(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          itemCornerRadius: 24,
          showElevation: true,
          selectedIndex: pageIndex,
          onItemSelected: _onItemTapped,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(
                size: 28,
                Iconsax.home_hashtag,
              ),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
              title: Text(LocaleKeys.nav_home.tr()),
            ),
            BottomNavyBarItem(
              icon: Icon(
                size: 28,
                Icons.format_list_bulleted,
              ),
              activeColor: Colors.purpleAccent,
              textAlign: TextAlign.center,
              title: Text(LocaleKeys.nav_trending.tr()),
            ),
            BottomNavyBarItem(
              icon: Stack(children: [
                Icon(
                  size: 28,
                  Iconsax.notification,
                ),
                Positioned(
                  top: 0,
                  right: 3,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 7,
                    child: Text(
                      provider.notificationList.length.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
              ]),
              activeColor: Colors.pink,
              textAlign: TextAlign.center,
              title: Text(LocaleKeys.nav_notification.tr()),
            ),
            BottomNavyBarItem(
              icon: Icon(
                Iconsax.setting_2,
                size: 28,
              ),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
              title: Text(LocaleKeys.nav_setting.tr()),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }
}
