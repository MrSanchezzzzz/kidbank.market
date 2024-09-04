import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/images.dart';

import '../../../../core/widgets/main_back_button.dart';

class NoRating extends StatelessWidget {
  const NoRating({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: const MainBackButton(label: 'Back'),
        middle: Text(
          'Rating',
          style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
            color: CupertinoColors.black,
          ),
        ),
        backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
        border: const Border(bottom: BorderSide.none),
      ),
        child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 16),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  no_rating_star,
                  Text('No rating', style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 40),),
                  Text('No one has yet rated a purchase from you', style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 17),)
                ],
                      ),
            ))
    );
  }
}
