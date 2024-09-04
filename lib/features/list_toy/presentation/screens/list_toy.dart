import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/toy_image.dart';
import 'package:kidbank/features/list_toy/presentation/widgets/list_toy_controls.dart';
import 'package:kidbank/features/list_toy/presentation/widgets/list_toy_info.dart';
import 'package:kidbank/features/list_toy/presentation/widgets/list_toy_properties.dart';

import '../../../../core/colors.dart';
class ListToyScreen extends StatelessWidget {
  const ListToyScreen({super.key,this.editMode=false});
  //TODO final Toy toy;
  final bool editMode;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height, maxWidth: MediaQuery.of(context).size.width),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: CupertinoPageScaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white100,
            navigationBar: CupertinoNavigationBar(
              middle: Text(editMode?'Edit listing':'Toy listing')
            ),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ToyImage(),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8,),
                    const ListToyInfo(),
                    const SizedBox(
                      height: 16,
                    ),
                    const ListToyProperties(),
                    const ListToyControls(),
                    const SizedBox(
                      height: 40,
                    ),
                    MainButton(
                      text: editMode?'Save changes':'List toy',
                      onTap: null,//TODO handle tap for edit/non-edit modes
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
