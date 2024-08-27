import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/hive_reply.dart';

class NotifyReply extends StatefulWidget {
  const NotifyReply({super.key});

  @override
  _NotifyReplyState createState() => _NotifyReplyState();
}

class _NotifyReplyState extends State<NotifyReply> {
  bool _isSwitchedOn = false;

  @override
  void initState() {
    super.initState();
    _isSwitchedOn = HiveReply.getNotify('notifyReply', defaultValue: false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: CupertinoListTile(
              title: const Text('Notify about replies'),
              trailing: CupertinoSwitch(
                value: _isSwitchedOn,
                onChanged: (bool value) async {
                  setState(() {
                    _isSwitchedOn = value;
                  });
                  await HiveReply.putNotify('notifyaboutReply', value);
                },
                activeColor: Colors.orange300,
                trackColor: Colors.grey100,
              ),
            ),
          ),
        );
  }
}