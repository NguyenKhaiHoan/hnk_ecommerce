import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: text != null
          ? [
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  text!,
                  style: Get.textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade100,
                ),
              ),
            ]
          : [
              Expanded(
                child: Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
            ],
    );
  }
}
