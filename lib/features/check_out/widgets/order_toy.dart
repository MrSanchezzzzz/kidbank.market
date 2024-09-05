import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';

import '../../../core/widgets/custom_stepper.dart';
class OrderToy extends StatelessWidget {
  const OrderToy(
      {super.key,
        required this.toyImage,
        required this.title,
        required this.price,
        this.containerHeight,
        this.containerWidth,
        this.containerBorderRadius});
  final String toyImage;
  final String title;
  final int price;
  final double? containerHeight;
  final double? containerWidth;
  final double? containerBorderRadius;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(containerBorderRadius!),
            image: DecorationImage(
              image: AssetImage(toyImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50.0,left: 10),
              child: Text(
                title,
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '$price\$',
                style: CupertinoTheme.of(context)
                    .textTheme
                    .textStyle
                    .copyWith(fontSize: 15, color: Colors.grey400),
              ),
            ),
          ],
        ),
        const CustomStepper()
      ],
    );
  }
}