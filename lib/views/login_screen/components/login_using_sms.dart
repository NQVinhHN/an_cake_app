import 'package:an_cake_app/utils/helper_widget.dart';
import 'package:an_cake_app/views/user_detail_screen/user_detail_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/login_using_sms_provider.dart';
import 'ls_provider.dart';

class LoginUsingSMS extends StatefulWidget {
  const LoginUsingSMS({Key? key}) : super(key: key);
  @override
  State<LoginUsingSMS> createState() => _LoginUsingSMSState();
}

class _LoginUsingSMSState extends State<LoginUsingSMS> {
  @override
  Widget build(BuildContext context) {
    var provider1 = Provider.of<LoginUsingSMSProvider>(context, listen: false);
    final TextEditingController phoneNumberController = TextEditingController(
      text: provider1.phoneNumber,
    );
    final TextEditingController phoneNumberCodeController =
        TextEditingController(
      text: provider1.phoneNumberCode,
    );
    var provider2 = Provider.of<LoginScreenProvider>(context, listen: false);
    final TextEditingController nameController = TextEditingController(
      text: provider2.name,
    );

    return SafeArea(
      child: Scaffold(
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
                    style: TextStyle(fontSize: 23),
                  ),
                  const Image(
                    image: AssetImage('assets/login_sms_mobile.png'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              phoneNumberCodeController.text =
                                  '+${country.phoneCode}';
                            },
                            // Optional. Sets the theme for the country list picker.
                            countryListTheme: CountryListThemeData(
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF8C98A8)
                                        .withOpacity(0.2),
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
                            'assets/login_sms_earth_icon.png',
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: TextField(
                              readOnly: true,
                              controller: phoneNumberCodeController,
                              onChanged: provider1.changePhoneNumberCode,
                            ),
                          ),
                          addHorizontalSpace(5),
                          SizedBox(
                            width: 150,
                            child: TextField(
                              controller: phoneNumberController,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  addDividerTrans(),
                  SizedBox(
                    height: 10,
                  ),
                  // ElevatedButton(
                  //   style: ButtonStyle(
                  //     elevation: MaterialStateProperty.all(0),
                  //     backgroundColor:
                  //         MaterialStateProperty.all(Colors.pink[300]),
                  //   ),
                  //   onPressed: () {},
                  //   child: const Text("Send Request"),
                  // ),
                  addDividerTrans(),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UserDetailScreen(),
                                  ),
                                );
                                provider2.setPhone(
                                    phoneNumberCodeController.text +
                                        phoneNumberController.text);
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            provider2
                                                .setName(nameController.text);
                                          },
                                          child: const Text('OK')),
                                    ],
                                    title: const Text('Information'),
                                    contentPadding: const EdgeInsets.all(20.0),
                                    content: SizedBox(
                                      height: 120,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Text('Name: '),
                                              SizedBox(
                                                width: 200,
                                                child: TextField(
                                                  controller: nameController,
                                                  onChanged: provider2.setName,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                    'Phone: ${provider2.phone}'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
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
      ),
    );
  }
}
