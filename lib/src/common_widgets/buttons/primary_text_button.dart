import 'package:flutter/material.dart';

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton({
    Key? key,
    this.onPressed,
    required this.buttonContent,
    this.defaultTextStyle = true,
    this.style,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String buttonContent;
  final bool defaultTextStyle;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    if (defaultTextStyle) {
      return TextButton(
        onPressed: onPressed,
        child: Text(
          buttonContent,
          style: style ?? Theme.of(context).textTheme.bodyLarge,
        ),
      );
    } else {
      return TextButton(
        onPressed: onPressed,
        child: Text(
          buttonContent,
          style: style,
        ),
      );
    }
  }
}
