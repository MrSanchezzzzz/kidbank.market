import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/account/wallet/presentation/screens/wallet.dart';
import '../../../core/colors.dart';
import '../../../core/images.dart';
import '../../../core/providers/rating_provider.dart';
import '../rating/components/orange_rating_star.dart';
import '../rating/presentation/no_rating.dart';
import '../rating/presentation/rating_info.dart';
import '../settings/presentation/setings.dart';

class Details extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(height: 16,),
      Padding(
        padding: const EdgeInsets.only(left: 0, top: 16, right: 8, bottom: 0),
        child: Container(
          height: 26,
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'Details',
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: Colors.grey300,
                fontSize: 13,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white100,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              _buildDetailsItem(context, 'My children'),
              //_buildDivider(context),
              _buildDetailsItem(context, 'My wallet'),
              //_buildDivider(context),
              _buildDetailsItem(context, 'My deals'),
              //_buildDivider(context),
              _buildDetailsItem(context, 'Settings'),
            ],
          ),
        ),
        ],
      ),
    );
  }

  void _handleRatingTap(BuildContext context, double rating) {
    if (rating > 0) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const RatingInfo(),
        ),
      );
    } else {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const NoRating(),
        ),
      );
    }
  }

  Widget _buildDetailsItem(BuildContext context, String title, {VoidCallback? onTap, double? rating}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white100,
        border: Border(
          bottom: BorderSide(
            color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
      child: CupertinoListTile(
        title: Row(
          children: [
            Text(
              title,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (rating != null) ...[
              const SizedBox(width: 8),
              OrangeRatingStars(rating: rating),
            ]
          ],
        ),
        trailing: SizedBox(height: 16, width: 16, child: right_icon),
        onTap: onTap,
      ),
    );
  }
}