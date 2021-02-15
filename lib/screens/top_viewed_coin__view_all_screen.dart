import 'package:cointopper/bloc/top_view_coin_list_bloc/top_viewed_coin_list_bloc.dart';
import 'package:cointopper/bloc/top_view_coin_list_bloc/top_viewed_coin_list_event.dart';
import 'package:cointopper/bloc/top_view_coin_list_bloc/top_viewed_coin_list_state.dart';
import 'package:cointopper/screens/coin_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class TopViewedCoinViewAllScreen extends StatefulWidget {
  final String currencyCode;
  final dynamic currencySymbol;

  TopViewedCoinViewAllScreen(
    this.currencyCode,
    this.currencySymbol,
  );

  @override
  _TopViewedCoinViewAllScreenState createState() =>
      _TopViewedCoinViewAllScreenState();
}

class _TopViewedCoinViewAllScreenState
    extends State<TopViewedCoinViewAllScreen> {
  bool isSort = true;
  bool isSortChange = true;
  bool isSortPrice = true;
  var _sortColumnIndex;
  var loadData = 20;

  void initState() {
    super.initState();
    BlocProvider.of<TopViewedCoinListBloc>(context)
        .add(LoadTopViewedCoinList(widget.currencyCode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.17,
//            height: 160,
            padding: EdgeInsets.only(top: 32, left: 8, right: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFE70814), Color(0xFFDE4546)],
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to Cointopper",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white30,
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Top Viewed Coins",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child:
                    BlocBuilder<TopViewedCoinListBloc, TopViewedCoinListState>(
                  builder: (context, state) {
                    if (state is TopViewedCoinListLoadSuccess) {
                      return DataTable(
                        columnSpacing: 8.0,
                        horizontalMargin: 4.0,
                        showBottomBorder: true,
                        dataRowHeight:
                            MediaQuery.of(context).size.height * 0.08,
                        headingRowHeight:
                            MediaQuery.of(context).size.height * 0.05,
                        sortColumnIndex: _sortColumnIndex,
                        sortAscending: isSort,
                        columns: [
                          DataColumn(
                            label: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'NAME/  M.CAP',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
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
                                    state.topViewedCoinsList.sort(
                                        (a, b) => b.name.compareTo(a.name));
                                    isSort = false;
                                  } else {
                                    state.topViewedCoinsList.sort(
                                        (a, b) => a.name.compareTo(b.name));
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
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF005580),
                              ),
                            ),
                            onSort: (i, b) {
                              setState(() {
                                if (i == 1) {
                                  _sortColumnIndex = i;
                                  if (isSortChange) {
                                    state.topViewedCoinsList.sort((a, b) => b
                                        .percentChange24h
                                        .compareTo(a.percentChange24h));
                                    isSortChange = false;
                                  } else {
                                    state.topViewedCoinsList.sort((a, b) => a
                                        .percentChange24h
                                        .compareTo(b.percentChange24h));
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
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF005580),
                              ),
                            ),
                            onSort: (i, b) {
                              setState(() {
                                if (i == 2) {
                                  _sortColumnIndex = i;
                                  if (isSortPrice) {
                                    state.topViewedCoinsList.sort(
                                        (a, b) => b.price.compareTo(a.price));
                                    isSortPrice = false;
                                  } else {
                                    state.topViewedCoinsList.sort(
                                        (a, b) => a.price.compareTo(b.price));
                                    isSortPrice = true;
                                  }
                                }
                              });
                            },
                            numeric: false,
                            tooltip: "PRICE",
                          ),
                        ],
                        rows: state.topViewedCoinsList.length != 0
                            ? state.topViewedCoinsList
                                .map(
                                  (coin) => DataRow(
                                    cells: [
                                      DataCell(
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                    builder: (_) => CoinDetail(
                                                          coin.symbol,
                                                          widget.currencyCode,
                                                          widget.currencySymbol,
                                                        )));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Container(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Image(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                    image:
                                                        NetworkImage(coin.logo),
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
                                                      fontSize:
                                                          MediaQuery.of(context)
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
                                                      symbol:
                                                          '${widget.currencySymbol}',
                                                    ).format(coin.marketCapUSD)}",
                                                    style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image(
                                              width: 15,
                                              height: 15,
                                              image: AssetImage(coin
                                                          .percentChange24h >
                                                      0
                                                  ? "assets/images/up_arrow_green.png"
                                                  : "assets/images/down_arrow_red.png"),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '${double.parse((coin.percentChange24h).toStringAsFixed(2))}%',
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.03,
                                                fontWeight: FontWeight.bold,
                                                color: coin.percentChange24h > 0
                                                    ? Colors.green[600]
                                                    : HexColor("#a94442"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DataCell(
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${coin.price > 99999 ? NumberFormat.compactCurrency(
                                                  decimalDigits: 2,
                                                  symbol:
                                                      '${widget.currencySymbol}',
                                                ).format(coin.price) : '${widget.currencySymbol}' + coin.price.toStringAsFixed(2)}",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
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
                                                  "${double.parse((coin.priceBTC).toStringAsFixed(8))}",
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
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
            ),
          ),
        ],
      ),
    );
  }
}
