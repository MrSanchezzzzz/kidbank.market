import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/sort_button.dart';

class RatingSort extends StatelessWidget {
  const RatingSort({super.key });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 12,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SortButton(
            sortBy: 'from the newest',
            onTap: () {
            },
          ),
        ),
      ],
    );
  }
}