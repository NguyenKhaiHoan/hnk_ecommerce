import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    Key? key,
    required this.title,
    required this.subTitle,
    this.textAlign,
  }) : super(key: key);

  //Variables -- Declared in Constructor
  final String title, subTitle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.displayLarge),
        Text(subTitle,
            textAlign: textAlign, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
