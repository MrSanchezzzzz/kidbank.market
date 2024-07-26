import 'package:flutter/cupertino.dart';
import 'package:kidbank/features/account/wallet/presentation/widgets/details_list_tile.dart';

import '../../../../core/colors.dart';
import '../../../../core/widgets/main_back_button.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key});

  //TODO final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
            leading: MainBackButton(
              label: 'Back',
            ),
            middle: Text('Transaction details')),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                '\$10.09',
                style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(fontSize: 34),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '09/05/2024, 13:27',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: Colors.grey300, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'MAIN INFORMATION',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 13, color: Colors.grey300),
              ),
              const SizedBox(
                height: 8,
              ),
              CupertinoListSection.insetGrouped(
                hasLeading: false,
                margin: EdgeInsets.zero,
                children: const [
                  DetailsListTile(title: 'Status', value: 'Approved'),
                  DetailsListTile(title: 'Type', value: 'Sale'),
                  DetailsListTile(title: 'Total', value: '\$10.09'),
                  DetailsListTile(title: 'Balance', value: '\$30.01'),
                ],
              )
            ],
          ),
        ));
  }
}
