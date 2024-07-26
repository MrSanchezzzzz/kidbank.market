
import 'package:flutter/material.dart';
import 'package:kidbank/core/colors.dart' as project_colors;
class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({super.key,this.value});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      backgroundColor: project_colors.Colors.purple200,
      color: project_colors.Colors.purple600,
    );
  }
}
