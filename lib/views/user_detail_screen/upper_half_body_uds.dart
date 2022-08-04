import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../image_avatar_provider.dart';
import '../login_screen/components/ls_provider.dart';

class UpperHalfBodyUDS extends StatefulWidget {
  UpperHalfBodyUDS({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;

  @override
  State<UpperHalfBodyUDS> createState() => _UpperHalfBodyUDSState();
}

class _UpperHalfBodyUDSState extends State<UpperHalfBodyUDS> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginScreenProvider>(context, listen: false);
    var provider2 = Provider.of<ImageAvatarProvider>(context, listen: false);
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
                        height: widget.size.height / 5,
                        width: widget.size.width,
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
                  GestureDetector(
                    onTap: () => provider2.pickImage(),
                    child: Container(
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
                        child:
                            context.watch<ImageAvatarProvider>().image == null
                                ? Icon(
                                    Icons.add,
                                    size: 50,
                                    color: Colors.black,
                                  )
                                : Image.file(
                                    context.watch<ImageAvatarProvider>().image!,
                                    fit: BoxFit.cover,
                                  ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<LoginScreenProvider>(
                      builder: (context, value, child) => Text(
                        value.name.toString(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      provider.phone.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
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
