import 'package:flutter/material.dart';

import '../../../../../constants/sizes.dart';
import '../../../models/model_on_boarding.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(hPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.45,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }
}
