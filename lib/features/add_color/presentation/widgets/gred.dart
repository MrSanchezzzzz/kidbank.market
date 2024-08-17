import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';

class Gred extends StatefulWidget {
  const Gred(
      {super.key,
      required this.selected,
      this.color,
      this.gradient,
      required this.size,
      required this.displayBorder,
      this.onSelected});
  final bool selected;
  final Color? color;
  final LinearGradient? gradient;
  final double size;
  final bool displayBorder;
  final Function()? onSelected;

  @override
  State<Gred> createState() => _GredState();
}

class _GredState extends State<Gred> {
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.white100, // White
      Colors.grey500, // Black
      Colors.green100, // Green
      Colors.grey100, // Grey
      Colors.purple100, // Pink
      Colors.purple200, // Purple
      Colors.orange100, // Yellow
      const Color(0xFF6200EE), // Colorful (example color)
      Colors.purple700, // Blue
      Colors.red200, // Red
    ];
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
           
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.selected ? Colors.grey200 : Colors.grey100,
                    width: widget.selected
                        ? 3
                        : widget.displayBorder
                            ? 1
                            : 0),
                shape: BoxShape.circle),
            padding: EdgeInsets.all(widget.selected ? 3 : 0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.color,
                  gradient: widget.gradient),
            ),
          ),
        );
      },
    );
  }
}
