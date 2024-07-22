import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/add_toy/data/selected_age_riverpod.dart';
import 'package:kidbank/features/add_toy/presentation/screens/add_toy_fill_details.dart';

import '../../../../core/colors.dart';
import '../../../../core/models/ages.dart';
import '../../../../core/widgets/main_back_button.dart';
import '../../../../core/widgets/main_button.dart';
import '../widgets/ages_grid_view.dart';

class AddToyAgeScreen extends StatelessWidget {
  const AddToyAgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white100,
        navigationBar: CupertinoNavigationBar(
          leading: MainBackButton(label: 'Back',onTap: (){Navigator.of(context).pop();},),
          middle: const Text('Age'),
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
                      Text('For what age is this toy?',style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
                      const SizedBox(height: 4,),
                      Consumer(
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          Age? age = ref.watch(selectedAgeProvider);
                          return Text(age!=null?'You\'ve selected a group age ${age.name}':'',
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                                color: Colors.grey400
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
                  child: AgesGridView(),
                ))
              ],

            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    return MainButton(text: 'Continue',onTap: ref.watch(selectedAgeProvider)!=null?(){
                      Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>const AddToyFillDetailsScreen()));
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
