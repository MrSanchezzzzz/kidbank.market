import 'package:flutter/cupertino.dart';

import '../../../core/colors.dart';
import '../../../core/widgets/main_button.dart';

class ToyDetailsActions extends StatelessWidget {
  const ToyDetailsActions({super.key,this.isMyToy=false});
  final bool isMyToy;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainButton(
          color: Colors.white100,
          text: isMyToy?'Delete toy':'Exchange toy',
          textColor: isMyToy?CupertinoColors.destructiveRed:null,
          icon:isMyToy? Image.asset('assets/images/trash.png',width: 24,height: 24,color: CupertinoColors.destructiveRed):
          Image.asset('assets/images/refresh.png',width: 20,height: 20,color: Colors.orange500),
          onTap: (){},
        ),
        const SizedBox(height: 16,),
        MainButton(
          text: isMyToy?'Edit toy':'Buy toy',
          icon: Image.asset(isMyToy?'assets/images/edit.png':'assets/images/bag.png',width: 20,height: 20,color: Colors.orange500,),
          onTap: (){},
        ),
      ],
    );
  }
}
