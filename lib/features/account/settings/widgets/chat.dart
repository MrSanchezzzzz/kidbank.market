import 'package:flutter/cupertino.dart';

import '../../../../core/colors.dart';
import '../../../../core/images.dart';

class Chat extends StatelessWidget {
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
              'CHAT',
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: CupertinoListTile(
              title: const Text('Support'),
              trailing: SizedBox(height: 16, width: 16, child: right_icon),
              onTap: (){},
            ),
          ),
        ),
      ],
    );
  }
}