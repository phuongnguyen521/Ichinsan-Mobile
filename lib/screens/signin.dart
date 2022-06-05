import 'package:flutter/material.dart';
//Screen
import '../main.dart';
//Firebase Auth
import 'package:firebase_auth/firebase_auth.dart';
//Google Sign In
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
//flutter sign in button
import 'package:flutter_signin_button/flutter_signin_button.dart';
//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late User user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: SignInButton(
                Buttons.Google,
                text: "Sign in with Google",
                onPressed: () {
                  _signInWithGoogle();
                },
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final googleAuth = await googleUser.authentication;

      if (googleAuth != null) {
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the UserCredential
        await _auth.signInWithCredential(credential);
        user = FirebaseAuth.instance.currentUser!;
        print(await user.getIdToken());
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Ichinsan()),
            ((route) => false));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        print('${e.message}');
      });
    }
  }
}
