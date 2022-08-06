import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vvt_demo/Model/population.dart';
import 'package:vvt_demo/ViewModel/analyticsVM.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart' as intl;

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AnalyticsVM>(
        create: (BuildContext context) => AnalyticsVM(context),
        child: Consumer<AnalyticsVM>(builder: (context, vm, _) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("Analytics"),
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                  child: Column(children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          blurRadius: 20.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            5.0, // Move to right 10  horizontally
                            5.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: SimpleLineChart(vm.analyticsData)),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          blurRadius: 20.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            5.0, // Move to right 10  horizontally
                            5.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: SimpleBarChart(vm.analyticsData)),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          blurRadius: 20.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            5.0, // Move to right 10  horizontally
                            5.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: SimpleScatterPlotChart(vm.analyticsData)),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          blurRadius: 20.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            5.0, // Move to right 10  horizontally
                            5.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: RTLBarChart(vm.analyticsData)),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          blurRadius: 20.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            5.0, // Move to right 10  horizontally
                            5.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: SegmentsLineChart(vm.analyticsData))
              ])));
        }));
  }
}

class SimpleLineChart extends StatelessWidget {
  final List<Population> data;

  SimpleLineChart(this.data);

  @override
  Widget build(BuildContext context) {
    final valueFormatter =
        charts.BasicNumericTickFormatterSpec.fromNumberFormat(
            intl.NumberFormat('000'));
    List<charts.Series<Population, num>> series = [
      new charts.Series<Population, num>(
        id: 'Population',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (Population population, _) => population.year,
        measureFn: (Population population, _) => population.population,
        data: data,
      )
    ];
    return new charts.LineChart(series,
        animate: true,
        defaultRenderer: new charts.LineRendererConfig(includePoints: true),
        behaviors: [
          new charts.ChartTitle('Line Chart',
              subTitle: 'United States Population Year-wise',
              behaviorPosition: charts.BehaviorPosition.top,
              titleOutsideJustification: charts.OutsideJustification.middle,
              innerPadding: 50),
        ],
        domainAxis: charts.NumericAxisSpec(
          tickFormatterSpec: valueFormatter,
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(zeroBound: false),
          viewport: charts.NumericExtents(2013, 2019),
        ),
        primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.StaticNumericTickProviderSpec(
            <charts.TickSpec<num>>[
              charts.TickSpec<num>(316000000),
              charts.TickSpec<num>(320000000),
              charts.TickSpec<num>(324000000),
              charts.TickSpec<num>(328000000),
            ],
          ),
        ),
        secondaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.StaticNumericTickProviderSpec(
            <charts.TickSpec<num>>[
              charts.TickSpec<num>(316000000),
              charts.TickSpec<num>(320000000),
              charts.TickSpec<num>(324000000),
              charts.TickSpec<num>(328000000),
            ],
          ),
        ));
  }
}

class SimpleBarChart extends StatelessWidget {
  final List<Population> data;

  SimpleBarChart(this.data);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Population, String>> series = [
      new charts.Series<Population, String>(
        id: 'Population',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (Population population, _) => population.year.toString(),
        measureFn: (Population population, _) => population.population,
        data: data,
      )
    ];
    return new charts.BarChart(
      series,
      animate: true,
      behaviors: [
        new charts.ChartTitle('Bar Chart',
            subTitle: 'United States Population Year-wise',
            behaviorPosition: charts.BehaviorPosition.top,
            titleOutsideJustification: charts.OutsideJustification.middle,
            innerPadding: 50),
      ],
      defaultRenderer: new charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(30)),
    );
  }
}

class SimpleScatterPlotChart extends StatelessWidget {
  final List<Population> data;

  SimpleScatterPlotChart(this.data);

  @override
  Widget build(BuildContext context) {
    final valueFormatter =
        charts.BasicNumericTickFormatterSpec.fromNumberFormat(
            intl.NumberFormat('000'));
    List<charts.Series<Population, num>> series = [
      new charts.Series<Population, num>(
        id: 'Population',
        colorFn: (_, __) => charts.MaterialPalette.pink.shadeDefault,
        domainFn: (Population population, _) => population.year,
        measureFn: (Population population, _) => population.population,
        data: data,
      )
    ];
    return new charts.ScatterPlotChart(series,
        animate: true,
        behaviors: [
          new charts.ChartTitle('Scatter Plot Chart',
              subTitle: 'United States Population Year-wise',
              behaviorPosition: charts.BehaviorPosition.top,
              titleOutsideJustification: charts.OutsideJustification.middle,
              innerPadding: 50),
        ],
        domainAxis: charts.NumericAxisSpec(
          tickFormatterSpec: valueFormatter,
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(zeroBound: false),
        ),
        primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.StaticNumericTickProviderSpec(
            <charts.TickSpec<num>>[
              charts.TickSpec<num>(316000000),
              charts.TickSpec<num>(320000000),
              charts.TickSpec<num>(324000000),
              charts.TickSpec<num>(328000000),
            ],
          ),
        ));
  }
}

class RTLBarChart extends StatelessWidget {
  final List<Population> data;

  RTLBarChart(this.data);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Population, String>> series = [
      new charts.Series<Population, String>(
        id: 'Population',
        colorFn: (_, __) => charts.MaterialPalette.lime.shadeDefault,
        domainFn: (Population population, _) => population.year.toString(),
        measureFn: (Population population, _) => population.population,
        data: data,
      )
    ];
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new charts.BarChart(
          series,
          animate: true,
          vertical: false,
          behaviors: [
            new charts.ChartTitle('RTL Bar Chart',
                subTitle: 'United States Population Year-wise',
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification: charts.OutsideJustification.middle,
                innerPadding: 50),
          ],
          defaultRenderer: new charts.BarRendererConfig(
              cornerStrategy: const charts.ConstCornerStrategy(30)),
          //       primaryMeasureAxis: new charts.NumericAxisSpec(
          //   tickProviderSpec: new charts.StaticNumericTickProviderSpec(
          //     <charts.TickSpec<num>>[
          //       charts.TickSpec<num>(316000000),
          //       charts.TickSpec<num>(322000000),
          //       charts.TickSpec<num>(328000000),
          //     ],
          //   ),
          // )
        ));
  }
}

class SegmentsLineChart extends StatelessWidget {
  final List<Population> data;

  SegmentsLineChart(this.data);

  @override
  Widget build(BuildContext context) {
    final valueFormatter =
        charts.BasicNumericTickFormatterSpec.fromNumberFormat(
            intl.NumberFormat('000'));
    List<charts.Series<Population, num>> series = [
      new charts.Series<Population, num>(
        id: 'Population',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (Population population, _) => population.year,
        measureFn: (Population population, _) => population.population,
        data: data,
      )
    ];
    return new charts.LineChart(series,
        defaultRenderer:
            new charts.LineRendererConfig(includeArea: true, stacked: true),
        animate: true,
        behaviors: [
          new charts.ChartTitle('Segments Line Chart',
              subTitle: 'United States Population Year-wise',
              behaviorPosition: charts.BehaviorPosition.top,
              titleOutsideJustification: charts.OutsideJustification.middle,
              innerPadding: 50),
        ],
        domainAxis: charts.NumericAxisSpec(
          tickFormatterSpec: valueFormatter,
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(zeroBound: false),
        ),
        primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.StaticNumericTickProviderSpec(
            <charts.TickSpec<num>>[
              charts.TickSpec<num>(316000000),
              charts.TickSpec<num>(320000000),
              charts.TickSpec<num>(324000000),
              charts.TickSpec<num>(328000000),
            ],
          ),
        ));
  }
}
