import 'package:flutter/cupertino.dart';
import '../../../core/colors.dart';
import '../../../core/images.dart';

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
                _buildDetailsItem(context, 'My children'),
                _buildDetailsItem(context, 'My wallet'),
                _buildDetailsItem(context, 'My deals'),
                _buildDetailsItem(context, 'Rating'),
                _buildDetailsItem(context, 'Settings'),
              ],
            ),
          ),
        ],
    );
  }

  Widget _buildDetailsItem(BuildContext context, String title) {
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
        onTap: () {
          print('$title pressed');
        },
      ),
    );
  }
}