import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';

import '../../../../core/setting_hive.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  bool _isSwitchedOn = false;

  @override
  void initState() {
    super.initState();
    _isSwitchedOn = HiveService.getSetting('twoStepVerification', defaultValue: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 8, bottom: 0),
          child: Container(
            height: 26,
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'PRIVACY POLICY',
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: Colors.grey300,
                  fontSize: 13,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: CupertinoListTile(
              title: const Text('Two-step verification'),
              trailing: CupertinoSwitch(
                value: _isSwitchedOn,
                onChanged: (bool value) async {
                  setState(() {
                    _isSwitchedOn = value;
                  });
                  await HiveService.putSetting('twoStepVerification', value);
                },
                activeColor: Colors.orange300,
                trackColor: Colors.grey100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}