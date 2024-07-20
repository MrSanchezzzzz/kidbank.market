import 'package:flutter/cupertino.dart';
import '../../../core/colors.dart';
import '../../../core/images.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 16, right: 8, bottom: 0),
            child: Container(
              height: 26,
              padding: EdgeInsets.only(left: 8),
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
              color: Colors.white100,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                _buildDetailsItem(context, 'My children', true, false),
                _buildDivider(context),
                _buildDetailsItem(context, 'My wallet', false, false),
                _buildDivider(context),
                _buildDetailsItem(context, 'My deals', false, false),
                _buildDivider(context),
                _buildDetailsItem(context, 'Settings', false, true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsItem(BuildContext context, String title, bool isFirst, bool isLast) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        print('$title pressed');
      },
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isFirst ? 10 : 0),
            topRight: Radius.circular(isFirst ? 10 : 0),
            bottomLeft: Radius.circular(isLast ? 10 : 0),
            bottomRight: Radius.circular(isLast ? 10 : 0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            Container(
              child: right_icon,
              width: 24,
              height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      height: 1,
      color: CupertinoTheme.of(context).scaffoldBackgroundColor,
      margin: const EdgeInsets.only(left: 16)
    );
  }
}