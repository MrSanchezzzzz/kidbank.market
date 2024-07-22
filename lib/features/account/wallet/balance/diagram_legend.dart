import 'package:flutter/cupertino.dart';
import 'package:kidbank/features/account/wallet/balance/diagram_legend_item.dart';

import '../../../../core/colors.dart';

class DiagramLegend extends StatelessWidget {
  const DiagramLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DiagramLegendItem(color: Colors.purple400, label: 'Spent on buying'),
        DiagramLegendItem(color: Colors.orange300, label: 'Spent on selling'),
      ],
    );
  }
}
