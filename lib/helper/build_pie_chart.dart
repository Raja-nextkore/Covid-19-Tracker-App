import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../constants.dart';

class BuildPieChart extends StatelessWidget {
  final String total;
  final String recovered;
  final String deaths;

  const BuildPieChart({
    Key? key,
    required this.total,
    required this.recovered,
    required this.deaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: {
        'Total': double.parse(total),
        'Recovered': double.parse(recovered),
        'Deaths': double.parse(deaths),
      },
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: kPieChartColors,
      chartType: ChartType.ring,
      animationDuration: const Duration(milliseconds: 1200),
      chartValuesOptions: const ChartValuesOptions(
        showChartValuesInPercentage: true,
      ),
      legendOptions: const LegendOptions(
        legendPosition: LegendPosition.left,
      ),
    );
  }
}
