import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/catalogue/data/display_mode_riverpod.dart';

class ViewTypeButton extends ConsumerStatefulWidget {
  const ViewTypeButton({super.key,this.onTap});
  final Function(bool isGrid)? onTap;
  @override
  ConsumerState<ViewTypeButton> createState() => _ViewTypeButtonState();
}

class _ViewTypeButtonState extends ConsumerState<ViewTypeButton> {
  bool isGrid=true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isGrid=!isGrid;
        });
        if(widget.onTap!=null){
          ref.read(displayModeProvider.notifier).toggleDisplayMode();
          widget.onTap!(isGrid);
        }
      },
      child:Image.asset(isGrid?'assets/images/list.png':'assets/images/grid.png',width: 16,height: 16,),
    );
  }
}
