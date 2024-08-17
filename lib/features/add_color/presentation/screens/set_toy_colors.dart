import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/features/add_color/presentation/widgets/row.dart';

class SetToyColors extends StatefulWidget {
  const SetToyColors({super.key});

  @override
  State<SetToyColors> createState() => _SetToyColorsState();
}

class _SetToyColorsState extends State<SetToyColors> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainBackButton(label: 'Back'),
          ],
        ),
        border: Border(bottom: BorderSide.none),
        backgroundColor: Color(0xfff3edff),
        middle: Text('Select color'),
      ),
      backgroundColor: Colors.white100,
      child: Column(
        children: [
          CustomRow(
            title: 'What color is your toy?',
            fSize: 24,
            clr: Colors.grey500,
            fontWeight: FontWeight.w700,
          ),
          CustomRow(
            title: 'Pick color ',
            fSize: 17,
            clr: Colors.grey500,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.height,
            color: Colors.grey100,
          ),
        ],
      ),
    );
  }
}
