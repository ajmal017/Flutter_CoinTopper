//import 'package:charts_flutter/flutter.dart' as charts;
//import 'package:flutter/material.dart';
//
//class GraphWidget extends StatefulWidget {
//  @override
//  _GraphWidgetState createState() => _GraphWidgetState();
//}
//
//class _GraphWidgetState extends State<GraphWidget> {
//    bool graphShowsWeekAndAll;
//  bool show = false;
//  List<charts.Series<Sales, int>> _seriesLineData;
//
//  _generateData() {
//    var linesalesdata = [
//      new Sales(0, 45),
//      new Sales(1, 56),
//      new Sales(2, 55),
//      new Sales(3, 30),
//      new Sales(4, 61),
//      new Sales(5, 40),
//    ];
//
//    _seriesLineData.add(
//      charts.Series(
//        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.blue),
//        id: 'Air Pollution',
//        data: linesalesdata,
//        domainFn: (Sales sales, _) => sales.yearval,
//        measureFn: (Sales sales, _) => sales.salesval,
//      ),
//    );
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _seriesLineData = List<charts.Series<Sales, int>>();
//    _generateData();
//    graphShowsWeekAndAll = false;
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.white,
//      padding: EdgeInsets.only(top: 8.0),
//      child: Column(
//        children: [
//          Container(
//            width: 120,
//            decoration: BoxDecoration(
//              boxShadow: <BoxShadow>[
//                BoxShadow(
//                    color: Colors.black54,
//                    blurRadius: 15.0,
//                    offset: Offset(0.0, 0.75))
//              ],
//              color: Colors.white10,
//            ),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: [
//                Container(
//                  height: 40.0,
//                  width: 60.0,
//                  child: FlatButton(
//                    onPressed: () {
//                      setState(() {
//                        graphShowsWeekAndAll= true;
//                      show = true;
//                      });
//                      print('Graph 7D ==>> $graphShowsWeekAndAll');
//                      print('Graph 7D ==>> $show');
//                    },
//                    hoverColor: Colors.white10,
//                    child: Text('7D'),
//                    color: show == true
//                        ? Colors.white10
//                        : Colors.white,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(30.0),
//                    ),
//                  ),
//                ),
//                Container(
//                  height: 40.0,
//                  width: 60.0,
//                  child: FlatButton(
//                    onPressed: () {
//                      setState(() {
//                        graphShowsWeekAndAll= false;
//                        show= false;
//                      });
//                      print('Graph All ==>> $graphShowsWeekAndAll');
//                      print('Graph All ==>> $show');
//                    },
//                    hoverColor: Colors.white10,
//                    child: Text('All'),
//                    color: show == false
//                        ? Colors.white10
//                        : Colors.white,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(30.0),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            height: MediaQuery.of(context).size.height * 0.4,
//            padding: EdgeInsets.all(8.0),
//            child: Center(
//              child: charts.LineChart(
//                _seriesLineData,
//                defaultRenderer: new charts.LineRendererConfig(
//                  includeArea: true,
//                  stacked: true,
//                ),
//                animate: true,
//                animationDuration: Duration(seconds: 2),
//                behaviors: [
//                  new charts.ChartTitle(
//                    '',
//                    behaviorPosition: charts.BehaviorPosition.bottom,
//                    titleOutsideJustification:
//                        charts.OutsideJustification.middleDrawArea,
//                  ),
//                ],
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//
import 'package:cointopper/bloc/allHistoryBloc/allHistory_bloc.dart';
import 'package:cointopper/bloc/allHistoryBloc/allHistory_event.dart';
import 'package:cointopper/bloc/allHistoryBloc/allHistory_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class GraphWidget extends StatefulWidget {
  final int marketId;
  final String color1;
  final String color2;

  GraphWidget(
    this.marketId,
    this.color1,
    this.color2,
  );

  @override
  _GraphWidgetState createState() => _GraphWidgetState(
        this.marketId,
        this.color1,
        this.color2,
      );
}

class _GraphWidgetState extends State<GraphWidget> {
  final int marketId;
  final String color1;
  final String color2;

  _GraphWidgetState(
    this.marketId,
    this.color1,
    this.color2,
  );

  final int _leftLabelsCount = 7;

  List<FlSpot> _values = const [];

  double _minX = 0;
  double _maxX = 0;
  double _minY = 0;
  double _maxY = 0;
  double _leftTitlesInterval = 0;
  final data = [];

  double minY = double.maxFinite;
  double maxY = double.minPositive;

  LineChartData _mainData() {
    return LineChartData(
      gridData: _gridData(),
      titlesData: FlTitlesData(
        bottomTitles: _bottomTitles(),
        leftTitles: _leftTitles(),
      ),
      borderData: FlBorderData(
        border: Border.all(color: Colors.white12, width: 1),
      ),
      minX: _minX,
      maxX: _maxX,
      minY: _minY,
      maxY: _maxY,
      lineBarsData: [_lineBarData()],
    );
  }

  LineChartBarData _lineBarData() {
    List<Color> _gradientColors = [
      HexColor(color1),
      HexColor(color1),
      HexColor(color2),
    ];
    return LineChartBarData(
      spots: _values,
      colors: _gradientColors,
      colorStops: const [0.25, 0.5, 0.75],
      gradientFrom: const Offset(0.5, 0),
      gradientTo: const Offset(0.5, 1),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        colors: _gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        gradientColorStops: const [0.25, 0.5, 0.75],
        gradientFrom: const Offset(0.5, 0),
        gradientTo: const Offset(0.5, 1),
      ),
    );
  }

  SideTitles _leftTitles() {
    return SideTitles(
      showTitles: true,
      getTitles: (value) =>
          NumberFormat.compactCurrency(symbol: '\$').format(value),
      reservedSize: 28,
      margin: 12,
      interval: _leftTitlesInterval,
    );
  }

  SideTitles _bottomTitles() {
    return SideTitles(
      showTitles: true,
      getTitles: (value) {
        final DateTime date =
            DateTime.fromMillisecondsSinceEpoch(value.toInt());
        return DateFormat.MMM().format(date);
      },
      margin: 8,
      interval: (_maxX - _minX) / 6,
    );
  }

  FlGridData _gridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: false,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.white12,
          strokeWidth: 1,
        );
      },
      checkToShowHorizontalLine: (value) {
        return (value - _minY) % _leftTitlesInterval == 0;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
//    BlocProvider.of<WeekDayHistoryBloc>(context)
//        .add(LoadWeekDayHistory(marketId));
    BlocProvider.of<AllHistoryBloc>(context)
        .add(LoadAllHistory(widget.marketId));
    return BlocBuilder<AllHistoryBloc, AllHistoryState>(
      builder: (context, state) {
//        print("Graph data bloc==>>$state");
        if (state is AllHistoryLoadSuccess) {
//          print("Graph data state ==>>$state");
          var data = state.allHistory;
//          print("Graph data jjj ==>$data");
          _values = data.map((datum) {
//            print('price ==>> ');
//            print(datum.price);
//            print(datum.time);
            if (minY > datum.price) minY = datum.price;
            if (maxY < datum.price) maxY = datum.price;
            return FlSpot(
              datum.time.toDouble(),
              datum.price,
            );
          }).toList();

          _minX = _values.first.x;
          _maxX = _values.last.x;
          _minY = minY.floorToDouble();
          _maxY = maxY.ceilToDouble();
          _leftTitlesInterval =
              ((_maxY - _minY) / (_leftLabelsCount - 1)).floorToDouble();
          return AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18.0,
                left: 12.0,
                top: 24,
                bottom: 12,
              ),
              child: _values.isEmpty ? Placeholder() : LineChart(_mainData()),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
