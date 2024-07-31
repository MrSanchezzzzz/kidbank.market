import 'package:flutter/cupertino.dart';
import 'package:kidbank/features/account/wallet/presentation/screens/wallet.dart';
import '../../../core/colors.dart';
import '../../../core/images.dart';
import '../settings/presentation/setings.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 8, bottom: 0),
          child: Container(
            height: 26,
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'DETAILS',
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: Colors.grey300,
                  fontSize: 13,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: CupertinoListSection.insetGrouped(
            children: [
              _buildDetailsItem(context, 'My children', () {
                print('My children pressed');
              }),
              _buildDetailsItem(context, 'My wallet', () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const AccountWalletScreen(),
                  ),
                );
              }),
              _buildDetailsItem(context, 'My deals', () {
                print('My deals pressed');
              }),
              _buildDetailsItem(context, 'Rating', () {
                print('Rating pressed');
              }),
              _buildDetailsItem(context, 'Settings', () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsItem(BuildContext context, String title, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white100,
        border: Border(
          bottom: BorderSide(
            color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
      child: CupertinoListTile(
        title: Text(
          title,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: SizedBox(height: 16, width: 16, child: right_icon),
        onTap: onTap,
      ),
    );
  }
}