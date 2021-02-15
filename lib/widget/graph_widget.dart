import 'package:cointopper/bloc/all_history_bloc/all_history_bloc.dart';
import 'package:cointopper/bloc/all_history_bloc/all_history_event.dart';
import 'package:cointopper/bloc/all_history_bloc/all_history_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class GraphWidget extends StatefulWidget {
  final int marketId;
  final String color1;
  final String color2;
  final bool leftSizeShowTitles;
  final bool bottomSideShowTitles;

  GraphWidget(
    this.marketId,
    this.color1,
    this.color2,
    this.leftSizeShowTitles,
    this.bottomSideShowTitles,
  );

  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
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
      HexColor(widget.color1),
      HexColor(widget.color1),
      HexColor(widget.color2),
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
      showTitles: widget.leftSizeShowTitles,
      getTitles: (value) =>
          NumberFormat.compactCurrency(symbol: '\$').format(value),
      reservedSize: 28,
      margin: 12,
      interval: _leftTitlesInterval,
    );
  }

  SideTitles _bottomTitles() {
    return SideTitles(
      showTitles: widget.bottomSideShowTitles,
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
        if (state is AllHistoryLoadSuccess) {
          var data = state.allHistory;
          _values = data.map((datum) {
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
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: _values.isEmpty ? Placeholder() : LineChart(_mainData()),
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
