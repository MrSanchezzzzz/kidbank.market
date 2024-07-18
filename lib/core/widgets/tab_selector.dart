import 'package:flutter/cupertino.dart';

import '../colors.dart';

class TabSelector extends StatefulWidget {
  const TabSelector({super.key,required this.labels,this.callbacks,this.startIndex});
  final List<String> labels;
  final List<Function()>? callbacks;
  final int? startIndex;
  @override
  State<TabSelector> createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector> {

  @override
  void initState() {
    selectedIndex=widget.startIndex??0;
    super.initState();
  }

  late int selectedIndex;
  void selectTab(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  List<Widget> _generateTabs(){
    List<Widget> tabs=[];
    for(int i=0;i<widget.labels.length;i++){
      Widget tab=Expanded(
        child: GestureDetector(
          onTap: (){
            selectTab(i);
            if(widget.callbacks!=null){
              if(i<widget.callbacks!.length){
                widget.callbacks![i]();
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: i==selectedIndex?Colors.orange400:Colors.grey100)
              )
            ),
            child: Center(
              child: Text(widget.labels[i],style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                fontSize: 15
              ),),
            ),
          ),
        ),
      );
      tabs.add(tab);
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _generateTabs(),
    );
  }
}
