import 'package:ecommerce_flutter/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem(
      {Key? key,
      required this.text,
      required this.icon,
      this.onPress,
      this.color,
      this.logOut})
      : super(key: key);

  final Color? color;
  final String text;
  final Widget icon;
  final bool? logOut;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(hPadding),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            shadowColor: Colors.black12,
            backgroundColor: Colors.black.withOpacity(0.05)),
        onPressed: onPress,
        child: Row(
          children: [
            icon,
            SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: color == null
                  ? Theme.of(context).textTheme.bodyLarge
                  : Theme.of(context).textTheme.bodySmall,
            )),
            logOut == true ? Center() : Icon(IconlyLight.arrow_right_2),
          ],
        ),
      ),
    );
  }
}
