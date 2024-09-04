  import 'package:flutter/cupertino.dart';
  import '../../../core/colors.dart';

  class Statistics extends StatelessWidget {
    const Statistics({super.key});

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 16, right: 8),
              child: Container(
                padding: const EdgeInsets.only(left: 8),
                height: 26,
                child: Text(
                  'Statistics',
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    color: Colors.grey300,
                    fontSize: 13,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            Row(
                children: [
                  Expanded(child: _buildStatisticContainer(context, '\$400', 'Money on \naccount')),
                  const SizedBox(width: 8),
                  Expanded(child: _buildStatisticContainer(context, '\$400', 'Money \nspent')),
                  const SizedBox(width: 8),
                  Expanded(child: _buildStatisticContainer(context, '\$400', 'Money \nearned')),
                ],
              ),
          ],
        ),
      );
    }

    Widget _buildStatisticContainer(BuildContext context, String price, String description) {
      return Container(
        height: 88,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.orange200,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              price,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: Colors.grey500,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: Colors.grey500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    }
  }