import 'package:an_cake_app/utils/helper_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FindPassword extends StatefulWidget {
  const FindPassword({Key? key}) : super(key: key);

  @override
  State<FindPassword> createState() => _FindPasswordState();
}

class _FindPasswordState extends State<FindPassword> {
  TextEditingController findPass = TextEditingController();

  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Forgot Password ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                addVerticalSpace(20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: findPass,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                ),
                addVerticalSpace(20),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey[300])),
                  onPressed: () {
                    resetPass();
                  },
                  child: const Text(
                    'Send',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                addVerticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Remember now?',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue[400],
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future resetPass() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: findPass.text.trim());
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('sent Email')));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }
}
