import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/utils/account_client.dart';
import 'package:nb_utils/nb_utils.dart';
//Screen
import '../constants/common.dart';
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

import 'signup.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignIn extends StatelessWidget {
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
                  _signInWithGoogle(context);
                },
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
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
        //print(await user.getIdToken());
        var account = await Ichinsanlogin(user.email!);
        if (account != null) {
          print(account.profileId);
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Ichinsan()));
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SignUp(
                        form: GlobalKey<FormState>(),
                      )));
        }
      }
    } on FirebaseAuthException catch (e) {
      print('${e.message}');
    }
  }
}
