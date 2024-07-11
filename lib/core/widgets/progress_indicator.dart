
import 'package:flutter/material.dart';
import 'package:kidbank/core/colors.dart' as ProjectColors;
class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({super.key,this.value});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      backgroundColor: ProjectColors.Colors.purple200,
      color: ProjectColors.Colors.purple600,
    );
  }
}
