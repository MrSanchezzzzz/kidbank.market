import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class TabSelectorTab extends StatelessWidget {
  const TabSelectorTab({super.key,this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text??'',
      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 15),
    );
  }
}
