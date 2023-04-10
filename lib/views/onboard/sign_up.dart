import 'package:flutter/material.dart';
import 'package:lawbook/constants/color_palette.dart';
import 'package:lawbook/home_view.dart';
import 'package:lawbook/services/auth_services.dart';
import 'package:lawbook/utils/tools.dart';
import 'package:lawbook/views/onboard/sign_in.dart';
import 'package:lawbook/widgets/custom_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: ListView(
          children: [
            // the main title above text
            const Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            SizedBox(
              height: height * 0.05,
            ),

            TopLabelTextField(
                    controller: emailController,
                    borderColor: ColorPalette().primaryGreen,
                    borderRadius: 12,
                    label: 'email',
                    hintText: '',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    requiredField: false)
                .topLabelTextField(),
            SizedBox(
              height: height * 0.03,
            ),

            TopLabelTextField(
                    controller: passwordController,
                    borderRadius: 12,
                    borderColor: ColorPalette().primaryGreen,
                    label: 'password',
                    hintText: '',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    requiredField: false)
                .topLabelTextField(),

            SizedBox(
              height: height * 0.02,
            ),

            SizedBox(
              height: height * 0.34,
            ),
            // sign in button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPalette().primaryGreen,
                side: BorderSide(
                  width: 1,
                  color: ColorPalette().inactiveIconGrey,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 0,
                padding: const EdgeInsets.all(12),
              ),

              // sign up here

              onPressed: () async {
                setState(() {
                  _isLoading = !_isLoading;
                });
                // Create user with email and password
                if (Tools().isValidEmail(emailController.text.trim()) &&
                    Tools()
                        .isValidPassword(password: passwordController.text)) {
                  var res = await AuthServices().signUserUpWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text);

                  if (res == '1') {
                    CustomWidget().moveToPage(
                        page: const HomeView(),
                        context: context,
                        replacement: true);
                  } else {
                    setState(() {
                      _isLoading = !_isLoading;
                    });
                    CustomWidget().customSnackBarWithText(
                        content: Tools().errorTextHandling(res),
                        context: context);
                  }
                } else {
                  setState(() {
                    _isLoading = !_isLoading;
                  });
                  CustomWidget().customSnackBarWithText(
                      content: 'Please fill in the fields correctly.',
                      context: context);
                }
              },

              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      'Sign Up',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
            ),

            SizedBox(
              height: height * 0.05,
            ),

            // The new to button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                      fontSize: 15, color: ColorPalette().tertiaryTextColor),
                ),
                InkWell(
                  // go to sign In page
                  onTap: () {
                    // move to sign in page
                    CustomWidget().moveToPage(
                        page: const SignIn(),
                        context: context,
                        replacement: true);
                  },

                  child: Text(
                    'Sign In',
                    style:
                        TextStyle(fontSize: 15, color: ColorPalette().linkBlue),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
