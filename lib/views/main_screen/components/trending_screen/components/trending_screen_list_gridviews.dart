import 'dart:math';

import 'package:an_cake_app/models/notification_state.dart';
import 'package:an_cake_app/models/trending_screen_list_gridviews_product.dart';
import 'package:an_cake_app/utils/helper_widget.dart';
import 'package:an_cake_app/views/cart_screen/widget/cart_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../event/notification_api.dart';
import '../../../../../theme/theme_manager.dart';
import '../../../../../translations/locale_keys.g.dart';
import 'add_product_image_provider.dart';
import 'add_product_trending_list.dart';

class TrendingListGridViews extends StatefulWidget {
  TrendingListGridViews({
    Key? key,
  }) : super(key: key);
  final productList = ProductList().productList;
  @override
  State<TrendingListGridViews> createState() => _TrendingListGridViewsState();
}

class _TrendingListGridViewsState extends State<TrendingListGridViews> {
  @override
  void initState() {
    super.initState();
    NotificationApi.init();
    listenNotifications();
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);
  void onClickedNotification(String? payload) {}
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //     builder: (context) => const NotificationScreen(),
  //   ),
  // );
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductList>(context, listen: true);
    var provider2 = Provider.of<AddProductImageProvider>(context, listen: true);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Row(
            children: [
              Text(
                'All Product',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProductTrendingList(),
                    ),
                  );
                  provider.resetAllInput();
                  provider2.resetImageFile();
                },
                icon: Icon(
                  Icons.add,
                  size: 35,
                  color: context.watch<ThemeManager>().themeDark
                      ? Colors.red
                      : Colors.blue,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Consumer<ProductList>(
            builder: (context, value, child) {
              final cakeProductList = value.productList;
              return GridView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    mainAxisExtent: 360),
                children: List.generate(
                  cakeProductList.length,
                  (index) {
                    var cakeProductItem = provider.productList[index];
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          enableDrag: false,
                          isScrollControlled: true,
                          isDismissible: true,
                          elevation: 0,
                          builder: (BuildContext context) {
                            return buildDraggableScrollableSheet(
                                cakeProductItem);
                          },
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15)),
                                  child: Image(
                                    image: cakeProductItem.img,
                                    fit: BoxFit.fill,
                                    width: 220,
                                    height: 180,
                                  ),
                                ),
                                Positioned(
                                  right: 1,
                                  top: 5,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0.5),
                                      minimumSize: MaterialStateProperty.all(
                                        const Size(80, 50),
                                      ),
                                      maximumSize: MaterialStateProperty.all(
                                        const Size(80, 50),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                      shape: MaterialStateProperty.all<
                                          CircleBorder>(
                                        const CircleBorder(),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(
                                        () {
                                          cakeProductItem.favTap =
                                              !cakeProductItem.favTap;
                                        },
                                      );
                                    },
                                    child: cakeProductItem.favTap
                                        ? const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : Icon(
                                            Icons.favorite,
                                            color: Colors.grey[300],
                                          ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(15),
                                    ),
                                    gradient: LinearGradient(
                                      colors: [Colors.white, Colors.grey],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.centerRight,
                                    )),
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cakeProductItem.name,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '\$${cakeProductItem.price}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.red),
                                          ),
                                          const Spacer(),
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.pink,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  Text(
                                                    cakeProductItem.rating
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        color: Colors.yellow),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${LocaleKeys.ts_trending_shipping_on.tr()} ",
                                          style: const TextStyle(
                                              color: Colors.deepPurple),
                                        ),
                                        Text(
                                          '${cakeProductItem.shippingStatus.toString()}' +
                                              " " +
                                              '${LocaleKeys.ts_shipping_on_days.tr()}',
                                          style: const TextStyle(
                                              color: Colors.pink,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.discount_outlined,
                                          color: Colors.blue,
                                        ),
                                        addHorizontalSpace(5),
                                        Text(
                                          cakeProductItem.discountType,
                                          style: const TextStyle(
                                              color: Colors.blue, fontSize: 12),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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
          ),
        ),
      ],
    );
  }

  DraggableScrollableSheet buildDraggableScrollableSheet(
      Product cakeProductItem) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      maxChildSize: 0.65,
      minChildSize: 0.65,
      expand: true,
      builder: (context, scrollController) {
        return Stack(
          children: [
            Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.transparent,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(360, 180)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 100.0,
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cakeProductItem.name,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.pinkAccent,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.pinkAccent,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.pinkAccent,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.pinkAccent,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.pinkAccent,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  cakeProductItem.rating.toString(),
                                  style:
                                      const TextStyle(color: Colors.pinkAccent),
                                ),
                                addHorizontalSpace(10),
                                const Text('(1526)'),
                              ],
                            ),
                            Text(
                              '\$${cakeProductItem.price.toString()}',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${LocaleKeys.ts_trending_shipping_on.tr()} ",
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      '${cakeProductItem.shippingStatus.toString()}' +
                                          " " +
                                          '${LocaleKeys.ts_shipping_on_days.tr()}',
                                      style: const TextStyle(
                                          color: Colors.pinkAccent,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.discount_outlined,
                                      color: Colors.blue,
                                    ),
                                    addHorizontalSpace(5),
                                    Text(
                                      cakeProductItem.discountType,
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Divider(),
                            SizedBox(
                              height: 50,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Consumer<CartState>(
                                      builder: (context, cartState, child) =>
                                          ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                        ),
                                        onPressed: () {
                                          cartState.addToCart(cakeProductItem);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          LocaleKeys.ts_al_add_to_cart.tr(),
                                          style: const TextStyle(
                                              color: Colors.pinkAccent),
                                        ),
                                      ),
                                    ),
                                  ),
                                  addHorizontalSpace(20),
                                  Expanded(
                                    child: Consumer<NotificationState>(
                                      builder:
                                          (context, notificationState, child) =>
                                              ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.pinkAccent),
                                        ),
                                        onPressed: () {
                                          notificationState
                                              .addToNotificationList(
                                                  cakeProductItem);
                                          NotificationApi.showNotification(
                                              id: Random().nextInt(100),
                                              title: 'An Cake',
                                              body: LocaleKeys
                                                  .ns_notification_quotes
                                                  .tr(),
                                              payload: '');
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          LocaleKeys.ts_al_buy_now.tr(),
                                          style: const TextStyle(
                                              color: Colors.white),
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: cakeProductItem.img,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.5),
                  minimumSize: MaterialStateProperty.all(
                    const Size(80, 50),
                  ),
                  maximumSize: MaterialStateProperty.all(
                    const Size(80, 50),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all<CircleBorder>(
                    const CircleBorder(
                      side: BorderSide(
                          color: Colors.white,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
