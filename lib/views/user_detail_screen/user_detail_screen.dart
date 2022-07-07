import 'package:flutter/material.dart';

import 'components/lower_half_body_uds.dart';
import 'components/upper_half_body_uds.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: UpperHalfBodyUDS(size: size),
            ),
            Divider(
              color: Colors.grey[300],
              indent: 120,
              endIndent: 120,
              thickness: 3,
            ),
            Expanded(
              flex: 3,
              child: LowerHalfBodyUDS(size: size),
            ),
          ],
        ),
      ),
    );
  }
}
