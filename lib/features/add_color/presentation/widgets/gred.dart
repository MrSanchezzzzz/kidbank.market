import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';

class Gred extends StatefulWidget {
  const Gred({super.key});

  @override
  State<Gred> createState() => _GredState();
}

class _GredState extends State<Gred> {
  List<Color> colors = [
    Colors.white100,
    Colors.green200,
    Colors.green100,
    Colors.grey200,
    Colors.grey400,
    Colors.orange300,
    Colors.orange300,
    Colors.orange300,
    Colors.orange300,
    Colors.orange300,
    Colors.orange300,
    Colors.orange300,
    Colors.orange300,
    Colors.orange300,
    Colors.orange300,
  ];

  List<int> selectedIndices = [];

  void onCircleTapped(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else if (selectedIndices.length < 2) {
        selectedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          buildRow(0, 1, 2, 3),
          buildRow2(4, 5, 6, 7),
          buildRow3(8, 9, 10, 11),
          buildRow4(12, 13),
        ],
      ),
    );
  }

  Widget buildRow(int index1, int index2, int index3, int index4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildCircle(index1),
        buildCircle(index2),
        buildCircle(index3),
        buildCircle(index4),
      ],
    );
  }

  Widget buildRow2(int index1, int index2, int index3, int index4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildCircle(index1),
        buildCircle(index2),
        buildCircle(index3),
        buildCircle(index4),
      ],
    );
  }

  Widget buildRow3(int index1, int index2, int index3, int index4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildCircle(index1),
        buildCircle(index2),
        buildCircle(index3),
        buildCircle(index4),
      ],
    );
  }

  Widget buildRow4(int index1, int index2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildCircle(index1),
          buildCircle(index2),
        ],
      ),
    );
  }

  Widget buildCircle(int index) {
    bool isSelected = selectedIndices.contains(index);
    return GestureDetector(
      onTap: () => onCircleTapped(index),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: colors[index],
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.grey200 : Colors.grey100,
            width: isSelected ? 3.0 : 1.0,
          ),
        ),
      ),
    );
  }
}
