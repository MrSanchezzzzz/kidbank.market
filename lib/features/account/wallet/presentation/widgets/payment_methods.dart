import 'package:flutter/cupertino.dart';
import 'package:kidbank/features/account/wallet/presentation/widgets/payment_methods_list_tile.dart';

import '../../../../../core/colors.dart';

class WalletPaymentMethods extends StatelessWidget {
  const WalletPaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PAYMENT METHODS',
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 13, color: Colors.grey300),
        ),
        const SizedBox(
          height: 8,
        ),
        CupertinoListSection.insetGrouped(
          hasLeading: false,
          margin: EdgeInsets.zero,
          children: [
            const PaymentMethodsListTile(title: 'Visa', cardNumber: '**** 0000'),
            CupertinoListTile(
              title: Text(
                'Add payment method',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: Colors.purple600),
              ),
              trailing: const CupertinoListTileChevron(),
              onTap: (){},
            ),
          ],
        )
      ],
    );
  }
}
