import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/login_using_sms_getx.dart';

class UpperHalfBodyUDS extends StatelessWidget {
  UpperHalfBodyUDS({
    Key? key,
    required this.size,
  }) : super(key: key);
  final displayPhoneNumber = Get.put(LoginUsingGetX());

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.pink,
                        height: size.height / 5,
                        width: size.width,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 10),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(60, 40),
                            ),
                            maximumSize: MaterialStateProperty.all(
                              const Size(60, 40),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<CircleBorder>(
                              const CircleBorder(),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.navigate_before,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://c8.alamy.com/comp/J0A3CJ/simple-avatar-collection-flat-cartoon-style-faces-vector-illustration-J0A3CJ.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  const Text(
                    "Hello Fiona Gabrielle,",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    displayPhoneNumber.displayPhoneNumber.text,
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
