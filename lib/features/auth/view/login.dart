import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter/features/auth/view/signup.dart';

import '../../../common/common.dart';
import '../../../constants/constants.dart';
import '../../../theme/theme.dart';
import '../widget/auth_field.dart';

class LoginScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = UiConstants.appBar();
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AuthField(
                  controller: emailController,
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 25,
                ),
                AuthField(
                  controller: passwordController,
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RoundedSmallButton(
                    onTap: () {},
                    label: 'Done',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle(fontSize: 16),
                        children: [
                          TextSpan(
                              text: '  Sign up',
                              style: const TextStyle(
                                  color: Pallete.blueColor, fontSize: 16),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    SignupScreen.route(),
                                  );
                                }),
                        ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
