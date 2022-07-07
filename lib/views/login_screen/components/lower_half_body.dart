import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../user_detail_screen/user_detail_screen.dart';
import 'login_using_sms.dart';

class LowerHalfBodyLS extends StatelessWidget {
  const LowerHalfBodyLS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  "Welcome to",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  " An Cake",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              color: Colors.transparent,
            ),
            const Text(
              "User Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.grey[400],
                  filled: true,
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  border: InputBorder.none,
                  hintText: 'Enter User Name'),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            const Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  fillColor: Colors.grey[400],
                  filled: true,
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  border: InputBorder.none,
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Enter password'),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(LoginUsingSMS());
                  },
                  child: Text(
                    "Login Using SMS",
                    style: TextStyle(
                      decorationThickness: 5,
                      decoration: TextDecoration.underline,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                      decorationThickness: 5,
                      decoration: TextDecoration.underline,
                      color: Colors.blue[900]),
                ),
              ],
            ),
            const Divider(
              color: Colors.transparent,
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
                            MaterialStateProperty.all(Colors.pink[300]),
                      ),
                      onPressed: () {
                        Get.to(const UserDetailScreen());
                      },
                      child: const Text(
                        "Login",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Don't have access? Register Now",
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
