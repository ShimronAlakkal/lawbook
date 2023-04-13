import 'package:flutter/material.dart';
import 'package:lawbook/constants/color_palette.dart';
import 'package:lawbook/home_view.dart';
import 'package:lawbook/services/auth_services.dart';
import 'package:lawbook/utils/tools.dart';
import 'package:lawbook/views/onboard/password_reset_page.dart';
import 'package:lawbook/views/onboard/sign_up.dart';
import 'package:lawbook/widgets/custom_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final CustomWidget _customWidgetInstance = CustomWidget();

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
              'Sign In',
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
                    hintText: 'hintText',
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
                    hintText: 'hintText',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    requiredField: false)
                .topLabelTextField(),

            SizedBox(
              height: height * 0.02,
            ),

            // The forgot password text heere
            InkWell(
              onTap: () {
                // forgot password
                _customWidgetInstance.moveToPage(
                    page: PasswordResetPage(email: emailController.text.trim()),
                    context: context,
                    replacement: false);
              },
              child: Text(
                'Forgot Password? ',
                style: TextStyle(
                    color: ColorPalette().linkBlue,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
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

              // sign in as Vendor or delovery partner button action on click

              onPressed: () async {
                setState(() {
                  _isLoading = !_isLoading;
                });
                // sign in
                // Create user with email and password
                if (Tools().isValidEmail(emailController.text.trim())) {
                  var res = await AuthServices().signUserInWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text);
                  if (res == '1') {
                    _customWidgetInstance.moveToPage(
                        page: const HomeView(),
                        context: context,
                        replacement: true);
                  } else {
                    setState(() {
                      _isLoading = !_isLoading;
                    });
                    _customWidgetInstance.customSnackBarWithText(
                        content: Tools().errorTextHandling(res),
                        context: context);
                  }
                }
              },

              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      'Sign In',
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
                  'New to LawBook? ',
                  style: TextStyle(
                      fontSize: 15, color: ColorPalette().tertiaryTextColor),
                ),
                InkWell(
                  // Go to sign up page with an alert dialog pop  up
                  onTap: () {
                    CustomWidget().moveToPage(
                        page: const SignUp(),
                        context: context,
                        replacement: true);
                  },

                  child: Text(
                    'Sign Up',
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
