import 'package:an_cake_app/event/notification_api.dart';
import 'package:an_cake_app/utils/helper_widget.dart';
import 'package:an_cake_app/views/login_screen/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme_manager.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../user_detail_screen/user_detail_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

ThemeManager _themeManager = ThemeManager();

class _SettingsScreenState extends State<SettingsScreen> {
  bool turnOffNoti = false;
  bool changTheme = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeManager>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    LocaleKeys.ss_settings_title.tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.indigo),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const UserDetailScreen(),
                                ),
                              );
                            },
                            child: Text(
                              LocaleKeys.ss_my_account.tr(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.cyan),
                            ),
                          ),
                        ),
                      ],
                    ),
                    addDividerTrans(),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.ss_change_to_dark_themes.tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purpleAccent),
                        ),
                        Spacer(),
                        Switch(
                            value: provider.themeDark,
                            activeColor: Colors.pink,
                            inactiveThumbColor: Colors.teal,
                            inactiveTrackColor: Colors.teal.withOpacity(0.5),
                            onChanged: (value) {
                              setState(() {
                                provider.changeSwitch();
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [],
                    ),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.ss_turn_off_notification.tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.orange),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              NotificationApi.cancelAll();
                            },
                            child: Icon(
                              Icons.remove_circle_rounded,
                              size: 30,
                              color: Colors.pink,
                            )),
                      ],
                    ),
                    addDividerTrans(),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  title: Text(
                                    LocaleKeys.ss_al_contact.tr(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.blueAccent),
                                  ),
                                  content: SizedBox(
                                    height: 70,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${LocaleKeys.ss_al_name.tr()}Nguyen Quoc Vinh',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.deepPurpleAccent),
                                        ),
                                        addDividerTrans(),
                                        Text(
                                          '${LocaleKeys.ss_al_phone.tr()}+84393682399',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.deepPurpleAccent),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.indigoAccent),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              LocaleKeys.ss_technical_support.tr(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.lime),
                            ),
                          ),
                        ),
                      ],
                    ),
                    addDividerTrans(),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  title: Text(
                                    LocaleKeys.ss_delete_my_account.tr(),
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: Text(
                                    LocaleKeys.ss_al2_quotes.tr(),
                                    style: TextStyle(
                                        color: Colors.deepPurpleAccent,
                                        fontSize: 20),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        LocaleKeys.ss_al2_cancel.tr(),
                                        style: TextStyle(
                                            color: Colors.indigoAccent,
                                            fontSize: 18),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(
                                            color: Colors.indigoAccent,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              LocaleKeys.ss_delete_my_account.tr(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.amber),
                            ),
                          ),
                        ),
                      ],
                    ),
                    addDividerTrans(),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  title: Text(
                                    LocaleKeys.ss_about_us.tr(),
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: SizedBox(
                                    height: 180,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${LocaleKeys.ss_al_name.tr()}An Cake Bakery',
                                          style: TextStyle(
                                              color: Colors.deepPurpleAccent,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          '${LocaleKeys.ss_al3_owner.tr()} Binh Pham - An Le',
                                          style: TextStyle(
                                              color: Colors.deepPurpleAccent,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          '${LocaleKeys.ss_al3_version.tr()}  0.0.0.1',
                                          style: TextStyle(
                                              color: Colors.deepPurpleAccent,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          '${LocaleKeys.ss_al3_address.tr()}  ...',
                                          style: TextStyle(
                                              color: Colors.deepPurpleAccent,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          '${LocaleKeys.ss_al_phone.tr()}...',
                                          style: TextStyle(
                                              color: Colors.deepPurpleAccent,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(
                                            color: Colors.indigoAccent,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              LocaleKeys.ss_about_us.tr(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.indigo),
                            ),
                          ),
                        ),
                      ],
                    ),
                    addDividerTrans(),
                    SizedBox(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.pinkAccent),
                              ),
                              onPressed: () async {
                                await signOut();
                              },
                              child: Text(
                                LocaleKeys.ss_sign_out.tr(),
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut().then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          ),
        );
  }
}
