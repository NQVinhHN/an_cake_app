import 'package:flutter/material.dart';

import '../../../utils/helper_widget.dart';

class UpperHalfBodyLS extends StatelessWidget {
  const UpperHalfBodyLS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
              ),
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/cake_login_screen.jpg'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 35.0, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(60, 40),
                      ),
                      maximumSize: MaterialStateProperty.all(
                        const Size(60, 40),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
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
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(60, 40),
                      ),
                      maximumSize: MaterialStateProperty.all(
                        const Size(60, 40),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pink[300]),
                      shape: MaterialStateProperty.all<CircleBorder>(
                        const CircleBorder(),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "G",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  addDividerTrans(),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(60, 40),
                      ),
                      maximumSize: MaterialStateProperty.all(
                        const Size(60, 40),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[900]),
                      shape: MaterialStateProperty.all<CircleBorder>(
                        const CircleBorder(),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "f",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
