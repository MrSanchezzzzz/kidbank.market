import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/routes.dart';
import 'package:kidbank/features/add_toy/presentation/screens/add_toy_category.dart';
import 'package:kidbank/features/catalogue/presentation/catalogue_screen.dart';

import '../core/colors.dart';
import '../core/widgets/bottom_navigation_bar/add_button.dart';
import '../core/widgets/bottom_navigation_bar/navigation_bar_button.dart';

class MainMenu extends StatefulWidget {
  MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int index=0;
  CupertinoTabController _controller=CupertinoTabController();
  @override
  void initState() {
    _controller.addListener((){
      if(index==2){
        print("SECOND");
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
              builder: (BuildContext context) => AddToyCategoryScreen(),
            ),
            ModalRoute.withName('/'));
      }
      index=_controller.index;
    });
    super.initState();
  }
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
          const BottomNavigationBarItem(icon: AddButton()),
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
              navigatorKey: _tab1NavigatorKey,
              builder: (context) {
                return CatalogueScreen();
              },
            );
          case 2:
            return CupertinoTabView(
              // navigatorKey: _tab2NavigatorKey,
              builder: (context) {
                return AddToyCategoryScreen();
              }
            );
        }
        this.index=index;
        return CupertinoTabView(
          builder: (context) {
            return Placeholder();
          },
        );
      },
    );
  }

  final GlobalKey<NavigatorState> _tab1NavigatorKey = GlobalKey<NavigatorState>();
}
