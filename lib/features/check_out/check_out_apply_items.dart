import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/widgets/custom_check_box.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/check_out/widgets/check_out_nav_bar.dart';
import 'package:kidbank/features/check_out/widgets/order_toy.dart';
import 'package:kidbank/features/check_out/widgets/search_field.dart';

class CheckOutApplyItems extends StatefulWidget {
  const CheckOutApplyItems({super.key});

  @override
  State<CheckOutApplyItems> createState() => _CheckOutApplyItemsState();
}

class _CheckOutApplyItemsState extends State<CheckOutApplyItems> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      navigationBar: const CupertinoNavigationBar(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainBackButton(label: 'Back'),
          ],
        ),
        border: Border(bottom: BorderSide.none),
        backgroundColor: Color(0xfff3edff),
        middle: Text('Check out'),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CheckOutNavbar(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              children: [
                Text(
                  'Order',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(
                      fontSize: 13,
                      color: Colors.grey300,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Row(
            children: [
              CustomCheckBox(
                value: false,
              ),
              OrderToy(
                containerHeight: 78,
                containerWidth: 78,
                containerBorderRadius: 16,
                toyImage: 'assets/images/teddybear.png',
                title: "Toy's title",
                price: 50,
              ),
            ],
          ),
          const Row(
            children: [
              CustomCheckBox(
                value: false,
              ),
              OrderToy(
                containerHeight: 78,
                containerWidth: 78,
                containerBorderRadius: 16,
                toyImage: 'assets/images/teddybear.png',
                title: "Toy's title",
                price: 50,
              ),
            ],
          ),
          const Row(
            children: [
              CustomCheckBox(
                value: false,
              ),
              OrderToy(
                containerHeight: 78,
                containerWidth: 78,
                containerBorderRadius: 16,
                toyImage: 'assets/images/teddybear.png',
                title: "Toy's title",
                price: 50,
              ),
            ],
          ),
          const Row(
            children: [
              CustomCheckBox(
                value: false,
              ),
              OrderToy(
                containerHeight: 78,
                containerWidth: 78,
                containerBorderRadius: 16,
                toyImage: 'assets/images/teddybear.png',
                title: "Toy's title",
                price: 50,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(
                      fontSize: 17,
                      color: Colors.grey500,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$50.00',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(
                      fontSize: 17,
                      color: Colors.grey300,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            width: 358,
            child: MainButton(
              text: 'Apply items',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}