import 'package:flutter/cupertino.dart';
import '../../../../core/colors.dart';

class NotificationSetting extends StatefulWidget {
  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool _inAppSounds = false;
  bool _inAppVibrate = false;
  bool _emailNotification = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 16, top: 16, right: 8, bottom: 0),
          child: Container(
            height: 26,
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'NOTIFICATION',
              style: CupertinoTheme
                  .of(context)
                  .textTheme
                  .textStyle
                  .copyWith(
                  color: Colors.grey300,
                  fontSize: 13,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: CupertinoListSection.insetGrouped(
            children: [
              _buildNotificationItem(
                  context, 'In-app sounds', _inAppSounds, (value) {
                setState(() {
                  _inAppSounds = value;
                });
              }),
              _buildNotificationItem(
                  context, 'In-app vibrate', _inAppVibrate, (value) {
                setState(() {
                  _inAppVibrate = value;
                });
              }),
              _buildNotificationItem(
                  context, 'Email notification', _emailNotification, (value) {
                setState(() {
                  _emailNotification = value;
                });
              }),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildNotificationItem(BuildContext context, String title,
      bool switchValue, ValueChanged<bool> onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white100,
      ),
      child: CupertinoListTile(
        title: Text(title),
        trailing: CupertinoSwitch(
          value: switchValue,
          onChanged: onChanged,
          activeColor: Colors.orange300,
          trackColor: Colors.grey100,
        ),
      ),
    );
  }
}