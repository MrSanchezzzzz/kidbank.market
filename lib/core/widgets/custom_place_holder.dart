import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';

class CustomPlaceHolder extends StatefulWidget {
  const CustomPlaceHolder({
    super.key,
  });

  @override
  State<CustomPlaceHolder> createState() => _CustomPlaceHolderState();
}

class _CustomPlaceHolderState extends State<CustomPlaceHolder> {
  List<String> items = [
    'Post Office 1',
    'Post Office 2',
    'Post Office 3',
    'Post Office 4'
  ];
  String selectedItem = 'Select post office';

  void _showPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 252,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    selectedItem = items[index];
                  });
                },
                children: items.map((String item) {
                  return Center(child: Text(item));
                }).toList(),
              ),
            ),
            CupertinoButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 358,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 358.0),
            child: Text(
              ' *',
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 20,
                  color: const Color(0xFFFF0000),
                  fontWeight: FontWeight.w700),
            ),
          ),
          GestureDetector(
            onTap: () => _showPicker(context),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey300),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedItem,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: selectedItem == 'Select post office'
                          ? Colors.grey300
                          : Colors.grey500,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.chevron_down,
                    color: Colors.grey300,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
