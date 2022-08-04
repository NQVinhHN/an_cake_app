import 'dart:io';

import 'package:an_cake_app/views/my_wallet_screen/my_wallet_screen.dart';
import 'package:an_cake_app/views/user_detail_screen/user_detail_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../../../image_avatar_provider.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../login_screen/components/ls_provider.dart';
import '../../../../my_coupon_screen/my_coupon_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginScreenProvider>(context, listen: false);
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/291800038_174597985020214_6382467277579918807_n.jpg'),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          provider.name.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              LocaleKeys.dr_silver_member.tr(),
                              style: const TextStyle(color: Colors.pinkAccent),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const UserDetailScreen(),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              LocaleKeys.dr_my_profile.tr(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.deepPurple),
                                            ),
                                          ),
                                        ],
                                      )),
                                  const Divider(),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MyWalletScreen(),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              LocaleKeys.dr_my_wallet.tr(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.teal),
                                            ),
                                          ),
                                        ],
                                      )),
                                  const Divider(),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MyCouponScreen(),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            LocaleKeys.dr_my_coupon.tr(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.deepOrange),
                                          )),
                                        ],
                                      )),
                                  const Divider(),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // set to false if you want to force a rating
                                          builder: (context) => RatingDialog(
                                            initialRating: 1.0,
                                            // your app's name?
                                            title: Text(
                                              LocaleKeys.dr_rate_us.tr(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            // encourage your user to leave a high rating?
                                            message: Text(
                                              LocaleKeys.dr_rate_quotes.tr(),
                                              textAlign: TextAlign.center,
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            image: const Image(
                                              width: 180,
                                              height: 180,
                                              image: AssetImage(
                                                  'assets/an_cake_logo.png'),
                                            ),
                                            submitButtonText:
                                                LocaleKeys.dr_rate_submit.tr(),
                                            commentHint: LocaleKeys
                                                .dr_rate_comment_us
                                                .tr(),
                                            onCancelled: () => null,
                                            onSubmitted: (response) => null,
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              LocaleKeys.dr_rate_us.tr(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        ],
                                      )),
                                  const Divider(),
                                ],
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
          ),
          Positioned(
            left: 15,
            top: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailScreen(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage:
                    context.watch<ImageAvatarProvider>().image == null
                        ? null
                        : FileImage(File(
                            context.watch<ImageAvatarProvider>().image!.path,
                          )) as ImageProvider,
                child: Visibility(
                  visible: context.watch<ImageAvatarProvider>().image != null
                      ? false
                      : true,
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
