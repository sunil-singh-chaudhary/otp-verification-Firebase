import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  final String verificationId;
  const OtpPage({super.key, required this.verificationId});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String code = "";
  final controller = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      TextFormField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Enter OTP"),
          keyboardType: TextInputType.number,
          maxLength: 6,
          onChanged: (value) {
            code = value;
          }),
      ElevatedButton(
          onPressed: () async {
            String verif = widget.verificationId;
            String ncode = controller.text;
            debugPrint('code is $ncode and id is $verif');
            var credential = PhoneAuthProvider.credential(
                verificationId: widget.verificationId, smsCode: ncode);
            try {
              UserCredential result =
                  await firebaseAuth.signInWithCredential(credential);
              user = result.user;
              debugPrint("user-Found $user");
            } catch (e) {
              debugPrint(e.toString());
            }
            if (user != null) {
              // OTP VERIFIED
              debugPrint('OTP VERIFIED');
            } else {
              debugPrint('Invalid OTP ');
            }
          },
          child: const Text("Submit"))
    ]));
  }
}
