import 'package:flutter/material.dart';
import 'package:kidbank/features/catalogue/data/filter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../core/colors.dart' as project_colors;

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({
    super.key,
    this.min = 0,
    this.max = 100,
    this.textPrefix,
    this.onChanged,
    this.values,
  });

  final double min;
  final double max;
  final String? textPrefix;
  final (double, double)? values;
  final Function(double, double)? onChanged;

  @override
  CustomRangeSliderState createState() => CustomRangeSliderState();
}

class CustomRangeSliderState extends State<CustomRangeSlider> {
  late SfRangeValues _values;

  @override
  void initState() {
    super.initState();
    _values = widget.values != null
        ? SfRangeValues(widget.values!.$1, widget.values!.$2)
        : SfRangeValues(widget.min, widget.max);
  }

  @override
  Widget build(BuildContext context) {
    return SfRangeSliderTheme(
      data: SfRangeSliderThemeData(
        thumbRadius: 8,
        overlayColor: Colors.transparent,
        activeTrackColor: project_colors.Colors.purple600,
        inactiveTrackColor: project_colors.Colors.purple300,
        activeTrackHeight: 8,
        inactiveTrackHeight: 8,
      ),
      child: SfRangeSlider(
        min: widget.min,
        max: widget.max,
        stepSize: 1,
        thumbShape: CustomThumb(
          values: _values,
          textPrefix: widget.textPrefix,
        ),
        values: _values,
        onChanged: (SfRangeValues newValue) {
          if ((newValue.start - newValue.end).abs() < Filter.minPriceDelta) {
            return;
          }
          setState(() {
            _values = newValue;
          });
          widget.onChanged?.call(newValue.start, newValue.end);
        },
      ),
    );
  }
}

class CustomThumb extends SfThumbShape {
  CustomThumb({
    required this.values,
    this.textPrefix,
  }) : _textPainter = TextPainter();

  final SfRangeValues values;
  final String? textPrefix;
  final TextPainter _textPainter;
  final double verticalSpacing = 5.0;

  @override
  Size getPreferredSize(SfSliderThemeData themeData) {
    _updateTextPainter(values.start.toInt().toString());
    return Size(themeData.thumbRadius * 2,
        (themeData.thumbRadius + _textPainter.height + verticalSpacing) * 2);
  }

  void _updateTextPainter(String text) {
    _textPainter
      ..text = TextSpan(text: text)
      ..textDirection = TextDirection.ltr
      ..layout();
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required RenderBox parentBox,
        required RenderBox? child,
        required SfSliderThemeData themeData,
        SfRangeValues? currentValues,
        dynamic currentValue,
        required Paint? paint,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required SfThumb? thumb,
      }) {
    paint ??= Paint()..color = project_colors.Colors.purple600;
    context.canvas.drawCircle(center, themeData.thumbRadius, paint);

    String text = (thumb == SfThumb.start
        ? currentValues!.start
        : currentValues!.end)
        .toInt()
        .toString();
    _updateTextPainter((textPrefix ?? '') + text);

    _textPainter.paint(
      context.canvas,
      Offset(
        center.dx - _textPainter.width / 2,
        center.dy + verticalSpacing + themeData.thumbRadius,
      ),
    );
  }
}
