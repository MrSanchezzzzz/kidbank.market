import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/add_toy/presentation/widgets/categories_grid_view.dart';
import 'package:kidbank/features/add_toy_category/presentation/widgets/categories_grid_view.dart';

import '../../../../core/colors.dart';

class SelectToyCategory extends ConsumerWidget {
  const SelectToyCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        navigationBar: const CupertinoNavigationBar(
          border: Border(bottom: BorderSide.none),
          leading: MainBackButton(
            label: 'Back',
          ),
          middle: Text('Add category'),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What kind of toy is it?',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(color: Colors.grey500, fontSize: 24),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Pick up 1 category, or choose 'I'm not sure' if you don't know where your toy belongs",
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(color: Colors.grey400),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 18,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.grey100, width: 0.5))),
                  margin: const EdgeInsets.only(bottom: 16),
                ),
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CategoriesGrid(),
                ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      return MainButton(text: 'Continue', onTap: () {});
                    },
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
