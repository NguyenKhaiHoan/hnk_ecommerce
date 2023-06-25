// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecommerce_flutter/src/constants/sizes.dart';

import '../../constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.buttonContent,
    this.labelColor,
    this.buttonHeight,
    this.buttonColor,
    this.buttonWidth,
    this.widget,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String buttonContent;
  final Color? buttonColor, labelColor;
  final double? buttonWidth, buttonHeight;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: buttonWidth ?? size.width - hPadding * 2,
      height: buttonHeight ?? 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(2),
          backgroundColor: buttonColor ?? hPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: widget != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget!,
                  SizedBox(
                    width: hPadding / 2,
                  ),
                  Text(
                    buttonContent,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              )
            : Text(
                buttonContent,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
      ),
    );
  }
}
