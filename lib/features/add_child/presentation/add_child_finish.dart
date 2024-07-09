import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/mascot_info.dart';

import '../../../core/widgets/main_back_button.dart';

class AddChildFinishScreen extends StatelessWidget {
  const AddChildFinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MainBackButton(
              label: 'Back',
            )
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                MascotInfo(
                  text: 'We\'ve finished setting up!',
                )
              ],
            ),
           MainButton(text: 'Finish!',onTap: (){/*TODO*/},)
          ],
        ),
      ),
    );
  }
}
