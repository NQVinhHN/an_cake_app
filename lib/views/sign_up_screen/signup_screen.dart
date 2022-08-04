import 'package:an_cake_app/views/user_detail_screen/user_detail_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../bloc/register_logic.dart';
import '../login_screen/components/ls_provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  static final TextEditingController _name = TextEditingController();

  static final TextEditingController _phoneNumber = TextEditingController();

  static final TextEditingController _email = TextEditingController();

  static final TextEditingController _passWord = TextEditingController();

  RegisterLogic bloc = RegisterLogic();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginScreenProvider>(context, listen: false);
    _email.text = provider.name;
    _phoneNumber.text = provider.phone;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StreamBuilder(
                          stream: bloc.userName,
                          builder: (context, snapshot) {
                            return TextFormField(
                              textAlign: TextAlign.start,
                              controller: _name,
                              onChanged: provider.setName,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person),
                                labelText: 'Name',
                                errorText: snapshot.hasError
                                    ? snapshot.error.toString()
                                    : null,
                              ),
                            );
                          }),
                      StreamBuilder(
                        stream: bloc.userPhone,
                        builder: (context, snapshot) {
                          return TextFormField(
                            controller: _phoneNumber,
                            onChanged: provider.setPhone,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelText: 'Phone Number',
                            ),
                          );
                        },
                      ),
                      StreamBuilder(
                          stream: bloc.userEmail,
                          builder: (context, snapshot) {
                            return textFieldEmail(snapshot);
                          }),
                      StreamBuilder(
                          stream: bloc.userPass,
                          builder: (context, snapshot) {
                            return textFieldPass(snapshot);
                          }),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey[300]),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 15)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {
                                onSignUpClick();
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                        child: Row(
                          children: [
                            const Text(
                              'Have account?',
                              style: TextStyle(fontSize: 15),
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Login now',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textFieldPass(AsyncSnapshot<Object?> snapshot) {
    return TextFormField(
      controller: _passWord,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        labelText: 'Password',
        errorText: snapshot.hasError ? snapshot.error.toString() : null,
      ),
    );
  }

  TextFormField textFieldEmail(AsyncSnapshot<Object?> snapshot) {
    return TextFormField(
      controller: _email,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        labelText: 'Email',
        errorText: snapshot.hasError ? snapshot.error.toString() : null,
      ),
    );
  }

  void onSignUpClick() async {
    if (bloc.isValidInfo(
        _name.text, _phoneNumber.text, _email.text, _passWord.text)) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text, password: _passWord.text)
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserDetailScreen(),
          ),
        );
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
      });
    }
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
