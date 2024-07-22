import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/models/categories.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/add_toy/data/selected_category_riverpod.dart';
import 'package:kidbank/features/add_toy/presentation/screens/add_toy_age.dart';
import 'package:kidbank/features/add_toy/presentation/widgets/categories_grid_view.dart';

import '../../../../core/colors.dart';

class AddToyCategoryScreen extends ConsumerWidget {
  const AddToyCategoryScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white100,
        navigationBar: CupertinoNavigationBar(
          leading: context.canPop()?MainBackButton(label: 'Back',):null,
          middle: Text('Category'),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('What kind of toy is it?',style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
                    const SizedBox(height: 4,),
                    Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        Category? category = ref.watch(selectedCategoryProvider);
                        return Text(category!=null?'You\'ve selected a category ${category.name}':'',
                          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              color: Colors.purple700
                          ),);
                      },
                    ),
                  ],
                ),
                ),

                Container(height: 18,
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey100,width: 0.5))),
                  margin: const EdgeInsets.only(bottom: 16),
                ),
                const Expanded(child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CategoriesGridView(),
                ))
              ],

            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    return MainButton(text: 'Continue',onTap: ref.watch(selectedCategoryProvider)!=null?(){
                      Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>const AddToyAgeScreen()));
                    }:null,);
                  },),
                ),
              ],
            )
          ],
        )
    );
  }
}
