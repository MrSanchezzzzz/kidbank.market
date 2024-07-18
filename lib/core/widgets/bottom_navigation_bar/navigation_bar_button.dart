import 'package:flutter/cupertino.dart';

import '../../colors.dart';

class NavigationBarButton extends StatelessWidget{
  const NavigationBarButton({super.key,required this.image,required this.label,this.selected=false,this.onTap});
  final Image image;
  final bool selected;
  final String label;
  final Function()? onTap;

  factory NavigationBarButton.catalogue({bool selected = false, Function()? onTap}) {
    String path = 'assets/images/catalogue${selected ? '_bold' : ''}.png';
    return NavigationBarButton(
      image: Image.asset(
        path,
        width: 24,
        height: 24,
        color: selected ? Colors.purple600 : Colors.purple500,
      ),
      label: 'Catalogue',
      selected: selected,
      onTap: onTap,
    );
  }

  factory NavigationBarButton.favorites({bool selected = false, Function()? onTap}) {
    String path = 'assets/images/hearth${selected ? '_bold' : ''}.png';
    return NavigationBarButton(
      image: Image.asset(
        path,
        width: 24,
        height: 24,
        color: selected ? Colors.purple600 : Colors.purple500,
      ),
      label: 'Favorites',
      selected: selected,
      onTap: onTap,
    );
  }

  factory NavigationBarButton.chats({bool selected = false, Function()? onTap}) {
    String path = 'assets/images/chats${selected ? '_bold' : ''}.png';
    return NavigationBarButton(
      image: Image.asset(
        path,
        width: 24,
        height: 24,
        color: selected ? Colors.purple600 : Colors.purple500,
      ),
      label: 'Chats',
      selected: selected,
      onTap: onTap,
    );
  }

  factory NavigationBarButton.account({bool selected = false, Function()? onTap}) {
    String path = 'assets/images/user${selected ? '_bold' : ''}.png';
    return NavigationBarButton(
      image: Image.asset(
        path,
        width: 24,
        height: 24,
        color: selected ? Colors.purple600 : Colors.purple500,
      ),
      label: 'Account',
      selected: selected,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            image,
            SizedBox(height: 2,),
            Text(label,style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: selected?Colors.purple600:Colors.purple500
            ),)
          ],
        ),
      ),
    );
  }

}