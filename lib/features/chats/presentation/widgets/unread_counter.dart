import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/chats/data/unread_count_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/colors.dart';
import '../../../../core/widgets/badge.dart';

class UnreadCounter extends ConsumerWidget {
  const UnreadCounter({super.key});

  Text getFormattedText(BuildContext context,String value)=>Text(value,style:CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 12));
  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final asyncValue = ref.watch(unreadCountProvider);
    return Skeletonizer(
      enabled: asyncValue.isLoading,
      child: Skeleton.replace(
          replacement: Container(width: 24,height: 16,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.orange100)),
        child: Badge(
          child: asyncValue.when(
              data: (count)=>getFormattedText(context, 55.toString()),
              error: (_,__)=>getFormattedText(context, '-'),
              loading: ()=>getFormattedText(context, '-')),
        ),
      ),
    );
  }
}
