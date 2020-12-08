import 'package:cointopper/bloc/coinListBloc/coinList_bloc.dart';
import 'package:cointopper/bloc/coinListBloc/coinList_state.dart';
import 'package:cointopper/screens/coinDetail.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class CoinListWidget extends StatefulWidget {
  @override
  _CoinListWidgetState createState() => _CoinListWidgetState();
}

class _CoinListWidgetState extends State<CoinListWidget> {
  bool isSort = true;
  bool isSortChange = true;
  bool isSortPrice = true;
  var _sortColumnIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<CoinListBloc, CoinListState>(
          builder: (context, state) {
            if (state is CoinListLoadSuccess) {
              return DataTable(
                columnSpacing: 8.0,
                horizontalMargin: 4.0,
                showBottomBorder: true,
                dataRowHeight: MediaQuery.of(context).size.height * 0.08,
                headingRowHeight: MediaQuery.of(context).size.height * 0.05,
                sortColumnIndex: _sortColumnIndex,
                sortAscending: isSort,
                columns: [
                  DataColumn(
                    label: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'NAME/  M.CAP',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF005580),
                        ),
                      ),
                    ),
                    onSort: (i, b) {
                      setState(() {
                        if (i == 0) {
                          _sortColumnIndex = i;
                          if (isSort) {
                            state.coinList
                                .sort((a, b) => b.name.compareTo(a.name));
                            isSort = false;
                          } else {
                            state.coinList
                                .sort((a, b) => a.name.compareTo(b.name));
                            isSort = true;
                          }
                        }
                      });
                    },
                    numeric: false,
                    tooltip: "M.CAP",
                  ),
                  DataColumn(
                    label: Text(
                      'CHANGE',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF005580),
                      ),
                    ),
                    onSort: (i, b) {
                      setState(() {
                        if (i == 1) {
                          _sortColumnIndex = i;
                          if (isSortChange) {
                            state.coinList.sort((a, b) => b.percent_change24h
                                .compareTo(a.percent_change24h));
                            isSortChange = false;
                          } else {
                            state.coinList.sort((a, b) => a.percent_change24h
                                .compareTo(b.percent_change24h));
                            isSortChange = true;
                          }
                        }
                      });
                    },
                    numeric: false,
                    tooltip: "CHANGE",
                  ),
                  DataColumn(
                    label: Text(
                      'PRICE',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF005580),
                      ),
                    ),
                    onSort: (i, b) {
                      setState(() {
                        if (i == 2) {
                          _sortColumnIndex = i;
                          if (isSortPrice) {
                            state.coinList
                                .sort((a, b) => b.price.compareTo(a.price));
                            isSortPrice = false;
                          } else {
                            state.coinList
                                .sort((a, b) => a.price.compareTo(b.price));
                            isSortPrice = true;
                          }
                        }
                      });
                    },
                    numeric: false,
                    tooltip: "PRICE",
                  ),
                ],
                rows: state.coinList.length != 0
                    ? state.coinList
                        .map(
                          (coin) => DataRow(
                            cells: [
                              DataCell(
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                CoinDetail(coin.symbol)));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          padding: EdgeInsets.all(4.0),
                                          child: Image(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            image: NetworkImage(coin.logo),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            coin.name,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "${coin.symbol} / ${NumberFormat.compactCurrency(
                                              decimalDigits: 2,
                                              symbol: '\$',
                                            ).format(coin.market_cap_usd)}",
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DataCell(
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image(
                                      width: 15,
                                      height: 15,
                                      image: AssetImage(coin.percent_change24h >
                                              0
                                          ? "assets/images/up_arrow_green.png"
                                          : "assets/images/down_arrow_red.png"),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${double.parse((coin.percent_change24h).toStringAsFixed(2))}%',
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        fontWeight: FontWeight.bold,
                                        color: coin.percent_change24h > 0
                                            ? Colors.green[600]
                                            : HexColor("#a94442"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "\$${double.parse((coin.price).toStringAsFixed(2))}",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.btc,
                                          color: Colors.grey[500],
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                        Text(
                                          "${double.parse((coin.price_btc).toStringAsFixed(8))}",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList()
                    : "Not an arry",
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
