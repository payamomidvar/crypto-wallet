import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/chart_data.dart';
import '../../../utils/constants.dart';

class CoinChart extends StatefulWidget {
  final String name;

  const CoinChart({required this.name, super.key});

  @override
  State<CoinChart> createState() => _CoinChartState();
}

class _CoinChartState extends State<CoinChart> {
  int activeIndex = 5;
  late List<ChartData> _chartData;
  late TrackballBehavior _trackballBehavior;
  late CrosshairBehavior _crossHairBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );
    _crossHairBehavior = CrosshairBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );

    super.initState();
  }

  final List<String> chartTimes = ["1H", "2H", "8H", "1D", "1W", "1M", "1Y"];

  List<ChartData> getChartData() {
    List<ChartData> data = [];

    int month = 1;
    int day = 0;
    for (int index = 0; index <= 60; index++) {
      if (day == 30) {
        month++;
        day = 1;
      } else {
        day += 2;
      }

      int min = (80 + index * 0.1).toInt();
      int max = 100;

      int open = min + Random().nextInt((max + 1) - min);
      double low = open - (Random().nextDouble() + 1);
      int close = open + Random().nextInt(10);
      double height = close + (Random().nextDouble() + 1);
      ChartData temp = ChartData(
        open: open.toDouble(),
        close: close.toDouble(),
        low: low,
        height: height,
        dateTime: DateTime(DateTime.now().year, month, day),
      );
      data.add(temp);
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kLargePadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: chartTimes.map((e) {
              int currentIndex = chartTimes.indexOf(e);
              return InkWell(
                onTap: () {
                  setState(() {
                    activeIndex = currentIndex;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: currentIndex == activeIndex
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(kSmallRadius),
                    ),
                  ),
                  padding: const EdgeInsets.all(kSmallPadding),
                  child: Text(e, style: Theme.of(context).textTheme.bodySmall),
                ),
              );
            }).toList(),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: kSmallPadding),
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width,
          child: SfCartesianChart(
            plotAreaBorderColor: Colors.transparent,
            trackballBehavior: _trackballBehavior,
            crosshairBehavior: _crossHairBehavior,
            title: ChartTitle(
              text: '${widget.name} 2023',
              textStyle: const TextStyle(color: kTextColor),
            ),
            series: <CandleSeries>[
              CandleSeries<ChartData, DateTime>(
                dataSource: _chartData,
                xValueMapper: (ChartData sales, _) => sales.dateTime,
                openValueMapper: (ChartData sales, _) => sales.open,
                closeValueMapper: (ChartData sales, _) => sales.close,
                highValueMapper: (ChartData sales, _) => sales.height,
                lowValueMapper: (ChartData sales, _) => sales.low,
              )
            ],
            primaryXAxis: DateTimeAxis(
                dateFormat: DateFormat.MMM(),
                majorGridLines: const MajorGridLines(width: 0)),
            primaryYAxis: NumericAxis(
                minimum: 70,
                maximum: 130,
                interval: 10,
                numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
          ),
        ),
      ],
    );
  }
}
