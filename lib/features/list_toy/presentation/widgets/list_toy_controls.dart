import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/list_toy/data/toy_listing_riverpod.dart';

import '../../../../core/colors.dart';
import 'listing_list_tile.dart';

class ListToyControls extends StatelessWidget {
  const ListToyControls({super.key,this.editMode=false});
  final bool editMode;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(editMode)
          CupertinoListTile(
            title: const Text('Deactivate listing'),
            trailing: CupertinoSwitch(
              value: false,
              onChanged: (bool value) {},
              activeColor: Colors.orange300,
              trackColor: Colors.grey100,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
        const ListingListTileSwitch(),
        const SizedBox(height: 4,),
        if(editMode)
        CupertinoListTile(
          onTap: (){},
            title: Text('Delete listing',
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: CupertinoColors.destructiveRed
              ),
            )
        )
      ],
    );
  }
}
