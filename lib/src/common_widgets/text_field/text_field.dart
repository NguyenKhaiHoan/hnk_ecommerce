import 'package:ecommerce_flutter/src/constants/colors.dart';
import 'package:ecommerce_flutter/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.isSecret = false,
    this.initialValue,
    this.isReadOnly = false,
    this.validator,
    this.controller,
    this.textInputType,
    this.onSaved,
  }) : super(key: key);

  final String labelText;

  final bool isSecret;
  final String? initialValue;
  final bool isReadOnly;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // * Obscure text while typing
  bool _isObscure = false;

  @override
  void initState() {
    _isObscure = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: hPadding / 4,
        ),
        TextFormField(
          style: Theme.of(context).textTheme.bodyLarge,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          readOnly: widget.isReadOnly,
          initialValue: widget.initialValue,
          obscureText: _isObscure,
          validator: widget.validator,
          onSaved: widget.onSaved,
          decoration: InputDecoration(
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: hSecondaryColor,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: hSecondaryColor,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: hSecondaryColor,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            suffixIcon: widget.isSecret
                ? InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setState(
                        () {
                          _isObscure = !_isObscure;
                        },
                      );
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(
                          12,
                        ),
                        child: Icon(
                            _isObscure ? IconlyLight.hide : IconlyLight.show)),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
