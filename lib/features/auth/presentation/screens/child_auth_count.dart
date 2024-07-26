import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/custom_radio_button.dart';

import '../../../../core/widgets/main_back_button.dart';
import '../../../../core/widgets/main_button.dart';

class ChildAuthCountScreen extends StatefulWidget {
  const ChildAuthCountScreen({super.key});
  @override
  State<ChildAuthCountScreen> createState() => _ChildAuthCountScreenState();
}

class _ChildAuthCountScreenState extends State<ChildAuthCountScreen> {
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    const double radioHorizontalGap=20;
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How many children you want to add?',
                    style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Choose 1 option',
                    style: CupertinoTheme.of(context).textTheme.textStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  //TODO move radio to separate file
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedValue = 1;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Row(
                                  children: [
                                    CustomRadioButton<int?>(value: 1, groupValue: _selectedValue),
                                    const SizedBox(width: radioHorizontalGap), // Adjust spacing as needed
                                    const Text('1'),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _selectedValue = 2;
                                  });
                                },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Row(
                                  children: [
                                    CustomRadioButton<int?>(value: 2, groupValue: _selectedValue),
                                    const SizedBox(width: radioHorizontalGap), // Adjust spacing as needed
                                    const Text('2'),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedValue = 3;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Row(
                                  children: [
                                    CustomRadioButton<int?>(value: 3, groupValue: _selectedValue),
                                    const SizedBox(width: radioHorizontalGap), // Adjust spacing as needed
                                    const Text('3'),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedValue = 4;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Row(
                                  children: [
                                    CustomRadioButton<int?>(value: 4, groupValue: _selectedValue),
                                    const SizedBox(width: radioHorizontalGap), // Adjust spacing as needed
                                    const Text('4'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                ],
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: MainButton(text: 'Skip',onTap: (){context.go('/add_child/finish');},color: const Color(0xFFFFF1E4),)),
              const SizedBox(width: 16,),
              Expanded(child: MainButton(text:'Continue',onTap: (){context.push('/add_child/code',extra: {'count':_selectedValue});},))
            ],
          ),
          ]
        )
        ));
  }
}
