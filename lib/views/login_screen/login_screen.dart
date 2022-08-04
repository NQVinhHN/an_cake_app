import 'package:an_cake_app/utils/helper_widget.dart';
import 'package:flutter/material.dart';

import 'components/lower_half_body.dart';
import 'components/upper_half_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            UpperHalfBodyLS(),
            addDividerTrans(),
            LowerHalfBodyLS(),
          ],
        ),
      ),
    );
  }
}
