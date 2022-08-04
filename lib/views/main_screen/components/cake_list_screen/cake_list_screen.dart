import 'dart:io';

import 'package:an_cake_app/utils/helper_widget.dart';
import 'package:an_cake_app/views/login_screen/components/ls_provider.dart';
import 'package:an_cake_app/views/main_screen/components/cake_list_screen/widget/cake_list_body.dart';
import 'package:an_cake_app/views/main_screen/components/cake_list_screen/widget/drawer_widget.dart';
import 'package:an_cake_app/views/user_detail_screen/components/lower_half_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../../image_avatar_provider.dart';
import '../../../../theme/theme_manager.dart';
import '../../../cart_screen/cart_screen.dart';
import '../../../cart_screen/widget/cart_state.dart';
import '../../../user_detail_screen/user_detail_screen.dart';

class CakeListScreen extends StatefulWidget {
  const CakeListScreen({Key? key}) : super(key: key);

  @override
  State<CakeListScreen> createState() => _CakeListScreenState();
}

class _CakeListScreenState extends State<CakeListScreen> {
  @override
  Widget build(BuildContext context) {
    var provider1 = Provider.of<LowerHalfProvider>(context, listen: false);
    var provider2 = Provider.of<LoginScreenProvider>(context, listen: false);
    var provider3 = Provider.of<CartState>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.grey,
              height: 2.0,
            ),
          ),
          leading: Builder(builder: (context) {
            return Center(
              child: Transform.scale(
                scale: 4,
                child: IconButton(
                  icon: const Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/menu.png'),
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            );
          }),
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                provider2.name.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
              Row(
                children: [
                  Text(
                    provider1.cityName,
                    style: TextStyle(color: Colors.green[800], fontSize: 18),
                  ),
                  addHorizontalSpace(10),
                  Icon(Icons.circle_rounded,
                      size: 10, color: Colors.green[800]),
                ],
              )
            ],
          ),
          actions: [
            Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Iconsax.shopping_bag,
                        size: 30,
                      ),
                      color: Colors.teal,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartScreen(),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 8,
                        child: Text(
                          provider3.cartList.length.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            addHorizontalSpace(20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserDetailScreen(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: context.watch<ThemeManager>().themeDark
                    ? Colors.white
                    : Colors.grey[200],
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
            addHorizontalSpace(10),
          ],
        ),
        body: const CakeListBody(),
      ),
    );
  }
}
