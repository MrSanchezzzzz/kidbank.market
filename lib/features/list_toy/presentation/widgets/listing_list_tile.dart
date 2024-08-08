import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/colors.dart';
import '../../../../core/models/toy_property.dart';
import '../../data/toy_listing_riverpod.dart';

class ListingListTile<T> extends ConsumerWidget {
  const ListingListTile({super.key,required this.title,this.onTap,this.provider});
  final String title;
  final Function()? onTap;
  final StateNotifierProvider<ToyListingNotifier<ToyProperty?>, ToyProperty?>? provider;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ToyProperty? property;
    if(provider!=null) {
      property = ref.watch(provider!);
    }
    return CupertinoListTile(
      title: Text(title),
      onTap: onTap,
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(property!=null?property.name:'None'),
          const CupertinoListTileChevron()
        ],
      ),
    );
  }
}

class ListingListTileSwitch extends StatefulWidget {
  const ListingListTileSwitch({super.key});

  @override
  State<ListingListTileSwitch> createState() => _ListingListTileSwitchState();
}

class _ListingListTileSwitchState extends State<ListingListTileSwitch> {

  void setExchangePermission(WidgetRef ref,bool value){
    ref.read(selectedAllowedExchangeProvider.notifier).setValue(value);
  }
  bool enabled=false;
  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: const Text('Allow item exchange'),
      trailing: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return CupertinoSwitch(
            value: enabled,
            onChanged: (bool value) {
              setState(() {
                enabled=value;
              });
              setExchangePermission(ref, enabled);
            },
            activeColor: Colors.orange300,
            trackColor: Colors.grey100,
          );
        },
      ),
    );
  }
}

