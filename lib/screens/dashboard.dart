import 'package:cointopper/bloc/currencyListBloc/currencyList_bloc.dart';
import 'package:cointopper/bloc/currencyListBloc/currencyList_state.dart';
import 'package:cointopper/bloc/dashboardBloc/dashboard_bloc.dart';
import 'package:cointopper/bloc/dashboardBloc/dashboard_state.dart';
import 'package:cointopper/screens/searchCoinList.screen.dart';
import 'package:cointopper/widget/coinCard.widget.dart';
import 'package:cointopper/widget/coinList.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 32, left: 4, right: 4),
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF003399),
                      const Color(0xFF0073e6),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to CoinTopper',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Cryptocurrencies',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.08,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'CRYPTOM.CAP',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                                color: Colors.white,
                              ),
                            ),
                            BlocBuilder<DashboardBloc, DashboardState>(
                              builder: (context, state) {
                                if (state is DashboardLoadSuccess) {
                                  var _formattedMarketCap =
                                      NumberFormat.compactCurrency(
                                    decimalDigits: 2,
                                    symbol: '\$',
                                  ).format(state.globalDataCoin[0]
                                          .total_market_cap);
                                  return Text(
                                    _formattedMarketCap,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    '--',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                  ;
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Color(0xFF2e5cb8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: FlatButton(
                              onPressed: () => {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => SearchScreen(),
                                  ),
                                ),
                              },
                              child: Text(
                                'Search',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          DropDownCurrencyList(),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2e5cb8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.star_border,
                                color: Colors.white60,
                                size: 21,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2e5cb8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active,
                                color: Colors.white60,
                                size: 21,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CoinCardWidget(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Colors.blue[800],
                  thickness: 2,
                ),
              ),
              Expanded(
                child: CoinListWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DropDownCurrencyList extends StatefulWidget {
  @override
  _DropDownCurrencyListState createState() => _DropDownCurrencyListState();
}

class _DropDownCurrencyListState extends State<DropDownCurrencyList> {
  String dropdownValue = 'USD';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyListBloc, CurrencyListState>(
      builder: (context, state) {
        if (state is CurrencyListLoadSuccess) {
          return Container(
            height: 40,
            padding: EdgeInsets.all(2),
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Color(0xFF00e00),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButton(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.white60,
              ),
//                                    iconSize: MediaQuery.of(context).size.width * 0.06,
              underline: Container(color: Colors.transparent),
              style: TextStyle(color: Colors.black),
              items: state.currencyList.map((value) {
                return DropdownMenuItem(
                  value: value.symbol,
                  child: Text(' ${value.symbol}',
                      style: TextStyle(color: Colors.black)),
                );
              }).toList(),
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
