import 'package:flutter/material.dart';

import 'components/lower_half_body.dart';
import 'components/upper_half_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: const [
            UpperHalfBodyLS(),
            Divider(
              color: Colors.transparent,
            ),
            LowerHalfBodyLS(),
          ],
        ),
      ),
    );
  }
}
