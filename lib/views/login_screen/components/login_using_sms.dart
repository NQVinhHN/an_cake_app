import 'package:an_cake_app/views/user_detail_screen/user_detail_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/login_using_sms_getx.dart';

class LoginUsingSMS extends StatefulWidget {
  LoginUsingSMS({Key? key}) : super(key: key);
  final loginUsingGetX = Get.put(LoginUsingGetX());
  @override
  State<LoginUsingSMS> createState() => _LoginUsingSMSState();
}

class _LoginUsingSMSState extends State<LoginUsingSMS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Login Using SMS',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: Colors.blueGrey,
                  thickness: 3,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'What is your phone number',
                  style: TextStyle(fontSize: 25),
                ),
                const Image(
                  image: AssetImage('login_sms_mobile.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey[300]),
                      ),
                      onPressed: () {
                        showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            setState(() {
                              widget.loginUsingGetX.displayPhoneNumber.text =
                                  '+${country.phoneCode}';
                            });
                          },
                          // Optional. Sets the theme for the country list picker.
                          countryListTheme: CountryListThemeData(
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Image(
                        height: 30,
                        width: 30,
                        image: AssetImage(
                          'login_sms_earth_icon.png',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextField(
                        readOnly: true,
                        controller: widget.loginUsingGetX.displayPhoneNumber,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: widget.loginUsingGetX.displayPhoneNumber,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.pink[300]),
                      ),
                      onPressed: () {},
                      child: const Text("Send Request"),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 60,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.pink[300]),
                            ),
                            onPressed: () {
                              Get.to(const UserDetailScreen());
                            },
                            child: const Text("Confirm"),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
