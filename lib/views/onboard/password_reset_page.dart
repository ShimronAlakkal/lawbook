import 'package:flutter/material.dart';
import 'package:lawbook/constants/color_palette.dart';
import 'package:lawbook/services/password_reset_service.dart';
import 'package:lawbook/utils/tools.dart';
import 'package:lawbook/widgets/custom_widgets.dart';

// ignore: must_be_immutable
class PasswordResetPage extends StatefulWidget {
  String email;
  PasswordResetPage({Key? key, required this.email}) : super(key: key);

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    setState(() {
      emailController.text = widget.email;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // receive email text
              Text(
                'Receive an email to reset your password',
                style: TextStyle(
                    fontSize: 20,
                    color: ColorPalette().secondaryTextColor,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              // the email enterinf field
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Email'),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              // The main button that triggers the enail password reset function
              ElevatedButton.icon(
                onPressed: () {
                  PassWordResetService()
                      .sendResetEmail(emailController.text.trim(), context);
                },
                icon: const Icon(Icons.email_rounded),
                label: const Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 17),
                ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
