import 'package:flutter/cupertino.dart';


class ListingListItem extends StatelessWidget {
  const ListingListItem({super.key,required this.title,this.onTap,this.trailingTitle,this.delete=false});
  final String title;
  final Function()? onTap;
  final Widget? trailingTitle;
  final bool delete;
  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(title,
          style:delete?CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            color: CupertinoColors.destructiveRed
          ) :null
      ),
      onTap: onTap,
      trailing: trailingTitle!=null?Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          trailingTitle??Container(),
          //TODO custom chevron
          const CupertinoListTileChevron()
        ],
      ):
      null,
    );
  }
}
