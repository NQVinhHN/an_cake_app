import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_screen/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('background_home_screen.jpg'),
                ),
              ),
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 2,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 100),
                      child: Column(
                        children: const [
                          Image(
                            image: AssetImage('assets/an_cake_brand.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: size.height / 2,
                    width: size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('cake_home_screen.jpg'),
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(250),
                        topRight: Radius.circular(250),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    const Size(300, 80),
                  ),
                  maximumSize: MaterialStateProperty.all(
                    const Size(300, 80),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                  shape: MaterialStateProperty.all<CircleBorder>(
                    const CircleBorder(),
                  ),
                ),
                onPressed: () {
                  Get.to(
                    const LoginScreen(),
                  );
                },
                child: const Text(
                  "Let's Try",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
