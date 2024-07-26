import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../core/colors.dart';

class BalanceDiagram extends StatelessWidget {
  const BalanceDiagram({super.key,required this.income, required this.outcome,this.padding=8});
  final double income;
  final double outcome;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white100
          ),
          padding: EdgeInsets.all(padding),
          child: PieChart(
              dataMap: {'1':1,'Spent on selling':income,'2':2,'Spent on buying':outcome,'3':1},
              chartType: ChartType.ring,
            legendOptions: const LegendOptions(
              legendPosition: LegendPosition.bottom,
              showLegendsInRow: true,
              showLegends: false
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValues: false
            ),
            degreeOptions: const DegreeOptions(
              initialAngle: 270
            ),
            colorList: [
              Colors.white100,
              Colors.orange300,
              Colors.white100,
              Colors.purple400,
              Colors.white100,
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: EdgeInsets.all(4*padding),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CupertinoTheme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
