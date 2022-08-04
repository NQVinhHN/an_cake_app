import 'package:an_cake_app/utils/helper_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../translations/locale_keys.g.dart';
import 'widget/cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartState>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black, size: 20),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            LocaleKeys.carts_your_cart.tr(),
            style: const TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              425,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var cartItem = provider.cartList[index];
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 150,
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: SizedBox(
                        height: 150,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image(
                            fit: BoxFit.fill,
                            image: cartItem.product.img,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  Text(
                                    cartItem.product.name,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        provider.removeCartItem(cartItem);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$${cartItem.product.price}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${LocaleKeys.ts_trending_shipping_on.tr()} ",
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '${cartItem.product.shippingStatus}' +
                                      " "
                                          '${LocaleKeys.ts_shipping_on_days.tr()}',
                                  style: const TextStyle(color: Colors.pink),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  cartItem.product.discountType,
                                  style: const TextStyle(color: Colors.blue),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    if (cartItem.quantity.value > 0) {
                                      provider.changeProductNumber(
                                          cartItem.id, -1);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  ),
                                ),
                                Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text('${cartItem.quantity}')),
                                IconButton(
                                  onPressed: () {
                                    provider.changeProductNumber(
                                        cartItem.id, 1);
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: provider.cartList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ),
        bottomSheet: Container(
          height: 350,
          decoration: BoxDecoration(
            color: Colors.pink[50],
            borderRadius: const BorderRadius.vertical(
              top: Radius.elliptical(360, 180),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 75.0, left: 30, right: 30, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {},
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.ticket_discount,
                          color: Colors.black,
                          size: 40,
                        ),
                        addHorizontalSpace(10),
                        Text(
                          LocaleKeys.carts_apply_coupon.tr(),
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Spacer(),
                        Text(
                          LocaleKeys.carts_add_coupon.tr(),
                          style: const TextStyle(color: Colors.pinkAccent),
                        ),
                      ],
                    ),
                  ),
                ),
                addDividerTrans(),
                Row(
                  children: [
                    Text(
                      '${LocaleKeys.carts_price_detail.tr()} ( ${provider.cartList.length} ${LocaleKeys.carts_item.tr()} )',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      LocaleKeys.carts_cart_total.tr(),
                    ),
                    const Spacer(),
                    Text('\$${provider.totalPrice}'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      LocaleKeys.carts_tax.tr(),
                    ),
                    const Spacer(),
                    const Text('\$0'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      LocaleKeys.carts_cart_total.tr(),
                    ),
                    const Spacer(),
                    Text('\$${provider.totalPrice}'),
                  ],
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.pink)),
                          onPressed: () {},
                          child: Text(
                            LocaleKeys.next_button.tr(),
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
    );
  }
}
