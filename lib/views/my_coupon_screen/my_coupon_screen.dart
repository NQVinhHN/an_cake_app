import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyCouponScreen extends StatelessWidget {
  const MyCouponScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: Icon(
                Iconsax.back_square,
                color: Colors.lightBlue,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          title: Center(
              child: Text(
            'My Coupons',
            style: TextStyle(
                color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
          )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(
                Iconsax.barcode,
                color: Colors.deepPurpleAccent,
                size: 30,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/coupon.gif'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Coupons',
                        style: TextStyle(
                            color: Colors.lime,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: const Divider(
                      color: Colors.deepPurple,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
