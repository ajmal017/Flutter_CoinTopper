import 'package:cointopper/bloc/coinDetailBloc/coinDetail_bloc.dart';
import 'package:cointopper/bloc/coinDetailBloc/coinDetail_event.dart';
import 'package:cointopper/bloc/coinListBloc/coinList_bloc.dart';
import 'package:cointopper/bloc/coinListBloc/coinList_event.dart';
import 'package:cointopper/bloc/currencyListBloc/currencyList_bloc.dart';
import 'package:cointopper/bloc/currencyListBloc/currencyList_event.dart';
import 'package:cointopper/bloc/dashboardBloc/dashboard_bloc.dart';
import 'package:cointopper/bloc/dashboardBloc/dashboard_event.dart';
import 'package:cointopper/bloc/searchCoinBloc/searchCoinList_bloc.dart';
import 'package:cointopper/bloc/searchCoinBloc/searchCoinList_event.dart';
import 'package:cointopper/bloc/topViewCoinListBloc/topViewedCoinList_bloc.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:cointopper/screens/bottomTabNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/topViewCoinListBloc/topViewedCoinList_event.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<DashboardBloc>(
        create: (context) {
          return DashboardBloc(
            coinTopperRepository: CoinTopperRepository(),
          )..add(LoadGlobalDataCoin());
        },
      ),
      BlocProvider<CurrencyListBloc>(
        create: (BuildContext context) => CurrencyListBloc(
          coinTopperRepository: CoinTopperRepository(),
        )..add(LoadCurrencyList()),
      ),
      BlocProvider<TopViewedCoinListBloc>(
        create: (BuildContext context) => TopViewedCoinListBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadTopViewedCoinList()),
      ),
      BlocProvider<CoinListBloc>(
        create: (BuildContext context) => CoinListBloc(
          coinTopperRepository: CoinTopperRepository(),
        )..add(LoadCoinList()),
      ),
      BlocProvider<SearchCoinListBloc>(
        create: (BuildContext context) => SearchCoinListBloc(
          coinTopperRepository: CoinTopperRepository(),
        )..add(LoadSearchCoinList()),
      ),
      BlocProvider<CoinDetailBloc>(
        create: (BuildContext context) => CoinDetailBloc(
          coinTopperRepository: CoinTopperRepository(),
        )..add(LoadCoinDetail("")),
      ),
    ],
    child: MyApp(),
  ));
//  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: Home(),
      home: BottomTabNavigationPage(),
    );
  }
}
