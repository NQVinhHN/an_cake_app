import 'package:an_cake_app/utils/helper_widget.dart';
import 'package:an_cake_app/views/sign_up_screen/signup_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../bloc/login_logic.dart';
import '../../../translations/locale_keys.g.dart';
import '../../forgot_password_screen/findpass_screen.dart';
import '../../user_detail_screen/user_detail_screen.dart';
import 'login_using_sms.dart';

class LowerHalfBodyLS extends StatefulWidget {
  const LowerHalfBodyLS({
    Key? key,
  }) : super(key: key);

  @override
  State<LowerHalfBodyLS> createState() => _LowerHalfBodyLSState();
}

class _LowerHalfBodyLSState extends State<LowerHalfBodyLS>
    with SingleTickerProviderStateMixin {
  final TextEditingController email = TextEditingController();
  final TextEditingController passWord = TextEditingController();
  LoginLogic bloc = LoginLogic();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                LocaleKeys.ls_welcome_text.tr(),
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                LocaleKeys.ls_welcome_text_name.tr(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          addDividerTrans(),
          Text(
            LocaleKeys.ls_user_name_title.tr(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          StreamBuilder(
              stream: bloc.userEmail,
              builder: (context, snapshot) {
                return TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                    ),
                    errorText:
                        snapshot.hasError ? snapshot.error.toString() : null,
                    fillColor: Colors.grey[400],
                    filled: true,
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    border: InputBorder.none,
                    hintText: LocaleKeys.ls_user_name_hint.tr(),
                  ),
                );
              }),
          addDividerTrans(),
          Text(
            LocaleKeys.ls_password_title.tr(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          StreamBuilder(
              stream: bloc.userPass,
              builder: (context, snapshot) {
                return TextFormField(
                  controller: passWord,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    fillColor: Colors.grey[400],
                    filled: true,
                    errorText:
                        snapshot.hasError ? snapshot.error.toString() : null,
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    border: InputBorder.none,
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: LocaleKeys.ls_password_hint.tr(),
                  ),
                );
              }),
          addDividerTrans(),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginUsingSMS(),
                    ),
                  );
                },
                child: Text(
                  LocaleKeys.ls_login_using_sms_text.tr(),
                  style: TextStyle(
                    decorationThickness: 1,
                    decoration: TextDecoration.underline,
                    color: Colors.blue[900],
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FindPassword(),
                    ),
                  );
                },
                child: Text(
                  LocaleKeys.ls_forgot_password.tr(),
                  style: TextStyle(
                      decorationThickness: 1,
                      decoration: TextDecoration.underline,
                      color: Colors.blue[900]),
                ),
              ),
            ],
          ),
          addVerticalSpace(5),
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
                    onPressed: () async {
                      await signIn();
                    },
                    child: Text(
                      LocaleKeys.ls_login_button.tr(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          addVerticalSpace(5),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Register(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.ls_register.tr(),
                  style: const TextStyle(color: Colors.pinkAccent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future signIn() async {
    if (bloc.isValidInfo(email.text, passWord.text)) {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: passWord.text)
          .then(
        (value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserDetailScreen(),
            ),
          );
        },
      );
    }
  }
}
