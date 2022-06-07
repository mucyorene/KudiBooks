import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/lock_icon.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LockIcon(),
          const PageTitle(title: 'Account Sign In'),
          const CustomFormField(hintText: 'Email'),
          const CustomFormField(hintText: 'Password'),
          const HyperLinkText(directingText: 'Forgot Password ?'),
          const LoginButton(text: 'Login'),
          const CustomDevider(middleText: 'Or sign in with'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Row(
              children: const [
                CircledLogo(
                  logo: 'assets/images/categories/logoutIcon.png',
                  navigateTo: '/phoneLogin',
                ),
                CircledLogo(
                  logo: 'assets/images/categories/googleIcon.png',
                  navigateTo: '/signup',
                ),
                CircledLogo(
                  logo: 'assets/images/categories/appleIcon.png',
                  navigateTo: '/phoneSignup',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
