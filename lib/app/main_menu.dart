import 'package:flutter/cupertino.dart';
import 'package:kidbank/features/account/presentation/screens/my_account.dart';
import 'package:kidbank/features/account/wallet/presentation/screens/wallet.dart';
import 'package:kidbank/features/account/wallet/top_up/top_up.dart';
import 'package:kidbank/features/catalogue/presentation/catalogue_screen.dart';
import 'package:kidbank/features/chats/presentation/screens/chat_list_screen.dart';
import 'package:kidbank/features/list_toy/presentation/screens/list_toy.dart';

import '../core/colors.dart';
import '../core/widgets/bottom_navigation_bar/add_button.dart';
import '../core/widgets/bottom_navigation_bar/navigation_bar_button.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: NavigationBarButton.catalogue(),
            activeIcon: NavigationBarButton.catalogue(selected: true),
          ),
          BottomNavigationBarItem(
            icon: NavigationBarButton.favorites(),
            activeIcon: NavigationBarButton.favorites(selected: true),
          ),
          const BottomNavigationBarItem(
              icon: AddButton()
          ),
          BottomNavigationBarItem(
            icon: NavigationBarButton.chats(),
            activeIcon: NavigationBarButton.chats(selected: true),
          ),
          BottomNavigationBarItem(
            icon: NavigationBarButton.account(),
            activeIcon: NavigationBarButton.account(selected: true),
          ),
        ],
        activeColor: Colors.purple600,
        inactiveColor: Colors.purple50,
        height: MediaQuery.of(context).size.height * .08,
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return const CatalogueScreen();
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return const ListToyScreen();
              }
            );
          case 3:
            return CupertinoTabView(
              builder: (context){
                return const ChatListScreen();
              },
            );
          case 4:
            return CupertinoTabView(
              routes: {
                '/account/wallet':(context)=>const AccountWalletScreen(),
                '/account/wallet/top_up':(context)=>const TopUpScreen(),
              },
                builder: (context) {
                  return const MyAccount();
                }
            );
        }
        return CupertinoTabView(
          builder: (context) {
            return const Placeholder();
          },
        );
      },
    );
  }

}
