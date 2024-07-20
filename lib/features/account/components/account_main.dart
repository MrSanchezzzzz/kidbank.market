import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/images.dart';

class AccountMain extends StatelessWidget {
  const AccountMain({super.key});

  void _onTap() {
    print('Card tapped!');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: _onTap,
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        child: Container(
          height: 56,
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.white100,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ClipOval(
                    child: Container(
                      width: 44,
                      height: 44,
                      child: account_photo,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Veronika Shvets',
                        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          color: Colors.grey500,
                        ),
                      ),
                      SizedBox(height: 2,),
                      Row(
                        children: [
                          Text(
                            'Rating: ',
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              fontSize: 15,
                              color: Colors.grey300,
                            ),
                          ),
                          SizedBox(width: 4),
                          Container(child: full_star, width: 16, height: 16),
                          Container(child: full_star, width: 16, height: 16),
                          Container(child: full_star, width: 16, height: 16),
                          Container(child: full_star, width: 16, height: 16),
                          Container(child: star, width: 16, height: 16),
                        ],
                      ),
                    ],
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
      ),
    );
  }
}