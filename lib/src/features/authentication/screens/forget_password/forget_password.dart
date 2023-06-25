import 'package:ecommerce_flutter/src/common_widgets/buttons/primary_button.dart';
import 'package:ecommerce_flutter/src/constants/colors.dart';
import 'package:ecommerce_flutter/src/constants/sizes.dart';
import 'package:ecommerce_flutter/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String otp = '';
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(hPadding),
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    IconlyLight.arrow_left,
                    color: Colors.grey.shade600,
                  )),
              top: 30,
              left: -15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 200,
                  width: 200,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade200),
                  child: Transform.rotate(
                      angle: 38,
                      child: Image.asset('assets/images/otp/email.png'))),
              const SizedBox(height: 40.0),
              const Text(hOtpMessage, textAlign: TextAlign.center),
              const SizedBox(height: 20.0),
              OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  numberOfFields: 6,
                  focusedBorderColor: hPrimaryColor,
                  onSubmit: (code) {
                    otp = code;
                    // OTPController.instance.verifyOTP(otp);
                  }),
              SizedBox(
                height: 20.0,
              ),
              Text.rich(
                TextSpan(
                  text: 'Không nhận được mã? ',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: 'Gửi lại',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              PrimaryButton(
                buttonContent: "Tiếp tục",
                onPressed: () {
                  // OTPController.instance.verifyOTP(otp);
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}
