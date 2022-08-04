import 'package:an_cake_app/translations/locale_keys.g.dart';
import 'package:an_cake_app/utils/helper_widget.dart';
import 'package:an_cake_app/views/user_detail_screen/components/lower_half_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_screen/main_bottom_nav_bar.dart';

class LowerHalfBodyUDS extends StatelessWidget {
  const LowerHalfBodyUDS({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    LocaleKeys.uds_language_title.tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              addDividerTrans(),
              SizedBox(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                  color: context
                                      .watch<LowerHalfProvider>()
                                      .colorButtonLang1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          context.read<LowerHalfProvider>().pressButtonLang1();
                          await context.setLocale(
                            const Locale('en'),
                          );
                        },
                        child: Text(
                          LocaleKeys.uds_language_english.tr(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    addHorizontalSpace(20),
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                  color: context
                                      .watch<LowerHalfProvider>()
                                      .colorButtonLang2),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          context.read<LowerHalfProvider>().pressButtonLang2();
                          await context.setLocale(
                            const Locale('vi'),
                          );
                        },
                        child: Text(
                          LocaleKeys.uds_language_vietnam.tr(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    LocaleKeys.uds_city_title.tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              addDividerTrans(),
              SizedBox(
                height: 150,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                  color: context
                                      .watch<LowerHalfProvider>()
                                      .colorButtonCity1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.read<LowerHalfProvider>().pressButtonCity1();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage("assets/whitehouse.png"),
                            ),
                            Text(
                              LocaleKeys.uds_washington_city.tr(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    addHorizontalSpace(20),
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                  color: context
                                      .watch<LowerHalfProvider>()
                                      .colorButtonCity2),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.read<LowerHalfProvider>().pressButtonCity2();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              height: 100,
                              image: AssetImage("assets/hanoi_logo.png"),
                            ),
                            Text(
                              LocaleKeys.uds_hanoi_city.tr(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            width: size.width,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink[300]),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainBottomNavBar(),
                  ),
                );
              },
              child: Text(LocaleKeys.next_button.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
