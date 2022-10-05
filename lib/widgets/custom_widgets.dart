import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawbook/constants/color_palette.dart';

class CustomWidget {
  CustomWidget();

  // the custom appbar
  Widget customAppBar({String? customText}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: ColorPalette().primaryGreen,
        borderRadius: BorderRadius.circular(8),
      ),

      // child here
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // open nav drawer button
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.menu_rounded),
            onPressed: () {},
          ),

          // center text
          Text(
            customText ?? "LawBook",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),

          // search icon
          IconButton(
            color: Colors.white,
            icon: const Icon(CupertinoIcons.search),
            onPressed: () {
              // open search delegate here
            },
          ),
        ],
      ),
    );
  }

  // the custom drawer
  Widget customDrawer() {
    return Drawer(
      child: ListView(),
    );
  }

  // BackArrowAppBar
  Widget backArrowAppBar({required BuildContext context}) {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            customSnackBarWithText(
                content: 'Cannot pop off screen', context: context);
          }
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.grey,
        ),
      ),
    );
  }

  // custom snack bar
  customSnackBarWithText(
      {required String content, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          content,
        ),
      ),
    );
  }

  // the page navigation function
  void moveToPage(
      {required Widget page,
      required BuildContext context,
      required bool replacement}) {
    if (replacement) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return page;
      }));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return page;
      }));
    }
  }
}

// The text fields used in the auth based pages.
class TopLabelTextField {
  TextEditingController controller;
  String label;
  double? borderRadius;
  String hintText;
  bool obscureText;
  int? maxLines;
  int? maxLength;
  bool requiredField;
  TextInputType keyboardType;
  Color? borderColor;

  TopLabelTextField(
      {required this.controller,
      required this.label,
      required this.hintText,
      required this.keyboardType,
      required this.obscureText,
      required this.requiredField,
      this.borderColor,
      this.maxLines,
      this.maxLength,
      this.borderRadius});

  topLabelTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            // the label above top
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: ColorPalette().secondaryGreen,
              ),
            ),
            requiredField
                ? const Text(
                    '*',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  )
                : const SizedBox(
                    width: 0,
                  ),
          ],
        ),
        const SizedBox(height: 6),
        TextField(
          maxLength: maxLength,
          maxLines: maxLines != null ? maxLines! : 1,
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorColor: ColorPalette().mainTitleColor,
          autocorrect: true,
          autofocus: false,
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: borderColor != null
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor!))
                : null,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            border: borderRadius == null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: ColorPalette().primaryGreen))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius!),
                    borderSide: BorderSide(color: ColorPalette().primaryGreen)),
          ),
        ),
      ],
    );
  }
}
