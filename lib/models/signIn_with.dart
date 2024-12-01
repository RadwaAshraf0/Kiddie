import 'package:flutter/material.dart';
import 'package:kiddie/models/CustomNavBarModel.dart';

import '../components/user_auth/FirebaseAuthService.dart';
import 'Button/circle_button.dart';

class SigninWith extends StatelessWidget {
  const SigninWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 0.05,
          ),
          child: const Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  height: 0.0,
                  thickness: 0.7,
                  color: Colors.black54,
                ),
              ),
              Text(
                '   Sign In With   ',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Playfair Display',
                ),
              ),
              Expanded(
                child: Divider(
                  height: 0.0,
                  thickness: 0.7,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleButton(
              onPressed: () async {
                bool result =
                    await FirebaseeAuthService().signinWithGoogle(context);
                if (result) {
                  Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomNavBar()),
                  );
                }
              },
              child: Image.asset('assets/images/Registration/google.png'),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            CircleButton(
              onPressed: () {},
              child: Image.asset('assets/images/Registration/apple.png'),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            CircleButton(
              child: Image.asset('assets/images/Registration/facebook.png'),
              onPressed: () async {
                bool result =(await FirebaseeAuthService().signInWithFacebook(context)) as bool;

                if (result) {
                  Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomNavBar()),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
