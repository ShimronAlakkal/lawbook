import 'package:flutter/material.dart';
import 'package:lawbook/views/onboard/sign_up.dart';

import '../../constants/color_palette.dart';
import '../../widgets/custom_widgets.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
// The image or png that is used in the su screen
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                radius: width * 0.35,
                child: Image.asset(
                  'assets/illustrations/highfive.png',
                ),
              ),
            ),

// The welcome text that is the main thing
            const Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: (height * 0.035) / 2,
            ),

// The small desription on what to do next
            Text(
              "Organize files, curate cases, collaborate with colleagues, and more.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorPalette().tertiaryTextColor,
                fontSize: 14,
              ),
            ),

            SizedBox(
              height: height * 0.25,
            ),

// The elevated button for register with email
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPalette().primaryGreen,
                  side: BorderSide(
                    width: 1,
                    color: ColorPalette().inactiveIconGrey,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                  padding: const EdgeInsets.all(12)),

              // Register with email button action on click
              onPressed: () {
                // continue to email signUp page
                CustomWidget().moveToPage(
                    page: const SignUp(), context: context, replacement: false);
              },
              icon: const Icon(
                Icons.alternate_email_rounded,
                color: Colors.white,
              ),
              label: const Text(
                'Sign Up with email',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),

// The 'or' divider between the two main buttons
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: width * 0.1, vertical: height * 0.025),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Expanded(
            //         child: Divider(
            //             height: 1,
            //             thickness: 1,
            //             color: ColorPalette().tertiaryTextColor),
            //       ),
            //       Text(
            //         '  or  ',
            //         style: TextStyle(
            //             fontSize: 14, color: ColorPalette().tertiaryTextColor),
            //       ),
            //       Expanded(
            //         child: Divider(
            //           thickness: 1,
            //           height: 1,
            //           color: ColorPalette().tertiaryTextColor,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

// Button for sign up with phone
            // ElevatedButton.icon(
            //   style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.white,
            //       side: BorderSide(
            //         width: 1,
            //         color: ColorPalette().inactiveIconGrey,
            //       ),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(8)),
            //       elevation: 0,
            //       padding: const EdgeInsets.all(12)),

            //   // Move to the registration for delivery partners page on click action.
            //   onPressed: () async {
            //     // var msgToken = await FirebaseMessaging.instance.getToken();
            //     // var res = await AuthServices().signUserInWithGoogle(context);
            //     // if (res == '1') {
            //     //   final FirebaseAuth fbauthInstance = FirebaseAuth.instance;
            //     //   CustomWidgets().moveToPage(
            //     //       page: NavigationHolder(
            //     //         shouldUpdateDetails: true,
            //     //         user: ZellowUser(
            //     //             uid: fbauthInstance.currentUser!.uid,
            //     //             email: fbauthInstance.currentUser!.email!,
            //     //             name: fbauthInstance.currentUser!.displayName!,
            //     //             msgToken: msgToken),
            //     //       ),
            //     //       context: context,
            //     //       replacement: true);
            //     // } else {
            //     //   CustomWidgets()
            //     //       .snackBarWidget(content: res, context: context);
            //     // }
            //   },
            //   icon: SizedBox(
            //     height: height * 0.035,
            //     width: height * 0.035,
            //     child: Image.asset('assets/images/g.png'),
            //   ),
            //   label: Text(
            //     'Continue with Google',
            //     overflow: TextOverflow.ellipsis,
            //     maxLines: 1,
            //     style: TextStyle(
            //         fontSize: 17, color: ColorPalette().secondaryTextColor),
            //   ),
            // ),

            SizedBox(
              height: height * 0.04,
            ),

// The  go to sign in text
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
                  // Go to sign in page with an alert dialog pop  up
                  onTap: () {},
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
