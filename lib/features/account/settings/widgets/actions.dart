import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/images.dart';
import '../../../../core/setting_hive.dart';
import '../presentation/change_password.dart';

class ActionsSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 16, top: 16, right: 8, bottom: 0),
          child: Container(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'ACTIONS',
              style: CupertinoTheme
                  .of(context)
                  .textTheme
                  .textStyle
                  .copyWith(
                color: Colors.grey300,
                fontSize: 13,
                fontWeight: FontWeight.w600,
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
              _buildActionsItem(context, 'Change password'),
              _buildActionsItem(context, 'Log out'),
              _buildActionsItem(context, 'Delete account'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionsItem(BuildContext context, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white100,
        border: Border(
          bottom: BorderSide(
            color: CupertinoTheme
                .of(context)
                .scaffoldBackgroundColor,
          ),
        ),
      ),
      child: CupertinoListTile(
        title: Text(
          title,
          style: CupertinoTheme
              .of(context)
              .textTheme
              .textStyle
              .copyWith(
            color: title == 'Delete account' ? Colors.red200 : Colors.purple600,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: title == 'Change password'
            ? SizedBox(height: 16, width: 16, child: right_icon)
            : null,
        onTap: () async {
          if (title == 'Change password') {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const ChangePassword(),
              ),
            );
          } else if (title == 'Log out' || title == 'Delete account') {
            showOkCancelAlertDialog(
              context: context,
              title: title,
              message: title == 'Log out'
                  ? 'Do you really want to log out?'
                  : 'Do you really want to delete your account?',
              okLabel: 'Approve',
              cancelLabel: 'Reject',
              isDestructiveAction: title == 'Delete account',
            );
          }
        },
      ),
    );
  }
}