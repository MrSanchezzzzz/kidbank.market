import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/widgets/ui_card.dart';

import '../../../../core/models/ages.dart';
import '../../data/selected_age_riverpod.dart';

class AgesGridView extends ConsumerWidget {
  const AgesGridView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Age? selectedAge=ref.watch(selectedAgeProvider);
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 18,
      childAspectRatio: 2,
      children: List<Widget>.generate(Ages.values.length, (index){
        Age age=Ages.values[index];
        return Center(
          child: UiCard(
            label: age.name,
            image: age.image,
            checked: selectedAge == Ages.values[index],
            onChanged: () {
              ref.watch(selectedAgeProvider.notifier).setAge(Ages.values[index]);
            },
          ),
        );
      }),
    );
  }
}
