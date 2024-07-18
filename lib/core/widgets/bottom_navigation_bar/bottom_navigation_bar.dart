import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/widgets/bottom_navigation_bar/add_button.dart';
import 'package:kidbank/core/widgets/bottom_navigation_bar/riverpod/bottom_navbar_riverpod.dart';

import '../../colors.dart';
import 'navigation_bar_button.dart';

class BottomNavigationBar extends ConsumerWidget {
  const BottomNavigationBar({super.key,this.onPageSelected});

  final Function(int)? onPageSelected;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Color color=CupertinoTheme.of(context).barBackgroundColor;
    final mySystemTheme= SystemUiOverlayStyle.light
        .copyWith(systemNavigationBarColor: color);
    int index=ref.watch(selectedPageProvider);
    return AnnotatedRegion(
      value: mySystemTheme,
      child: Container(
        color: color,
        padding: const EdgeInsets.only(top: 8),
        child:Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    NavigationBarButton.catalogue(selected: index==0,onTap: (){ref.read(selectedPageProvider.notifier).setPage(0);},),
                    NavigationBarButton.favorites(selected: index==1,onTap: (){ref.read(selectedPageProvider.notifier).setPage(1);}),
                  ],
                ),
                Row(
                  children: [
                    NavigationBarButton.chats(selected: index==3,onTap: (){ref.read(selectedPageProvider.notifier).setPage(3);}),
                    NavigationBarButton.account(selected: index==4,onTap: (){ref.read(selectedPageProvider.notifier).setPage(4);}),
                  ],
                ),
              ],
            ),
            AddButton(onTap: (){ref.read(selectedPageProvider.notifier).setPage(2);})
          ],
        ),
      ),
    );
  }
}

