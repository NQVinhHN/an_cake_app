import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(45))),
                        height: size.height / 2,
                        width: size.width,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 50.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 250,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/rotation_card.gif'),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Total Balance',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber),
                                ),
                                const Text(
                                  "\$0",
                                  style: TextStyle(
                                      fontSize: 35, color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.teal,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.navigate_before,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: size.height / 2,
                    width: size.width,
                    padding:
                        const EdgeInsets.only(top: 75, left: 10, right: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Log',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Divider(
                          color: Colors.blueAccent,
                          thickness: 2,
                        ),
                        Row(
                          children: const [
                            Text("Your log text..."),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.amberAccent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                height: 100,
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.request_page_outlined,
                                  color: Colors.deepOrange,
                                  size: 50,
                                ),
                                Text(
                                  'Bill',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Column(
                              children: const [
                                Icon(
                                  Iconsax.dollar_circle,
                                  color: Colors.deepPurple,
                                  size: 50,
                                ),
                                Text(
                                  'Recharge',
                                  style: TextStyle(
                                      color: Colors.purple, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.swap_horiz,
                                  color: Colors.green,
                                  size: 50,
                                ),
                                Text(
                                  'Transfer',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 20),
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
