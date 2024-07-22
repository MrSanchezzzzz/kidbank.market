import 'package:flutter/cupertino.dart';

import '../../../../../core/colors.dart';

class DetailsListTile extends StatelessWidget {
  const DetailsListTile({super.key,required this.title,required this.value,this.onTap});
  final String title;
  final String value;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(title,),
      trailing: Text(
        value,
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: Colors.grey300),
      ),
      onTap: (){},
    );
  }
}
