import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/widgets/custom_place_holder.dart';
import 'package:kidbank/core/widgets/custom_radio_button.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/check_out/widgets/check_out_nav_bar.dart';
import 'package:kidbank/features/check_out/widgets/checkout_underline_text.dart';
import 'package:kidbank/features/check_out/widgets/order_toy.dart';
import 'package:kidbank/features/check_out/widgets/row_button.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final String imgPath = 'assets/images/toy_image.jpeg';

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
        children: [
          const CheckOutNavbar(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              children: [
                Text(
                  'Contact info',
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
          const RowButton(
            title: 'Name',
            rightIcon: CupertinoIcons.arrow_right_circle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              children: [
                Text(
                  'Delivery',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(
                          fontSize: 13,
                          color: Colors.grey300,
                          fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                CustomRadioButton(
                  value: 1,
                  groupValue: 1,
                ),
                Text('Nova post')
              ],
            ),
          ),
          const CustomPlaceHolder(),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              children: [
                CustomRadioButton(
                  value: 2,
                  groupValue: null,
                ),
                Text('Other options'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 15,
            ),
            child: Row(
              children: [
                Text(
                  'Order',
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontSize: 13,
                            color: Colors.grey300,
                          ),
                ),
              ],
            ),
          ),
          OrderToy(
            containerHeight: 78,
            containerWidth: 78,
            containerBorderRadius: 16,
            toyImage: imgPath,
            title: "Toy's title",
            price: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Row(
              children: [
                Text(
                  'Price',
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontSize: 13,
                            color: Colors.grey300,
                          ),
                ),
              ],
            ),
          ),
          const CheckoutUnderlineText(
            title: 'Price',
            price: 5.99,
            linevisible: true,
          ),
          const CheckoutUnderlineText(
            title: 'Delivery',
            price: 5.00,
            linevisible: true,
          ),
          const CheckoutUnderlineText(
            title: 'Price',
            price: 10.99,
            linevisible: false,
          ),
          SizedBox(
            width: 358,
            child: MainButton(
              text: 'Confirm the order',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
