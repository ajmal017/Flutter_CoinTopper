import 'package:cointopper/bloc/allHistoryBloc/allHistory_bloc.dart';
import 'package:cointopper/bloc/allHistoryBloc/allHistory_event.dart';
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
import 'package:cointopper/bloc/weekDayHistoryBloc/weekDayHistory_bloc.dart';
import 'package:cointopper/bloc/weekDayHistoryBloc/weekDayHistory_event.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:cointopper/screens/bottomTabNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/featured_news_bloc/featured_news_bloc.dart';
import 'bloc/featured_news_bloc/featured_news_event.dart';
import 'bloc/news_details_bloc/news_details_bloc.dart';
import 'bloc/news_details_bloc/news_details_event.dart';
import 'bloc/news_list_bloc/news_list_bloc.dart';
import 'bloc/news_list_bloc/news_list_event.dart';
import 'bloc/news_search_bloc/news_search_bloc.dart';
import 'bloc/news_search_bloc/news_search_event.dart';
import 'bloc/topViewCoinListBloc/topViewedCoinList_event.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<DashboardBloc>(
        create: (context) => DashboardBloc(
          coinTopperRepository: CoinTopperRepository(),
        )..add(LoadGlobalDataCoin()),
      ),
      BlocProvider<CurrencyListBloc>(
        create: (BuildContext context) => CurrencyListBloc(
          coinTopperRepository: CoinTopperRepository(),
        )..add(LoadCurrencyList()),
      ),
      BlocProvider<TopViewedCoinListBloc>(
        create: (BuildContext context) => TopViewedCoinListBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadTopViewedCoinList('INR')),
      ),
      BlocProvider<CoinListBloc>(
        create: (BuildContext context) => CoinListBloc(
          coinTopperRepository: CoinTopperRepository(),
        )..add(LoadCoinList('INR', 0, 0)),
      ),
      BlocProvider<SearchCoinListBloc>(
        create: (BuildContext context) => SearchCoinListBloc(
          coinTopperRepository: CoinTopperRepository(),
        )..add(LoadSearchCoinList()),
      ),
      BlocProvider<CoinDetailBloc>(
        create: (BuildContext context) => CoinDetailBloc(
          coinTopperRepository: CoinTopperRepository(),
        )..add(LoadCoinDetail("", 'USD')),
      ),
      BlocProvider<AllHistoryBloc>(
        create: (BuildContext context) => AllHistoryBloc(
          coinTopperRepository: CoinTopperRepository(),
        )..add(LoadAllHistory(0)),
      ),
      BlocProvider<WeekDayHistoryBloc>(
        create: (BuildContext context) => WeekDayHistoryBloc(
          coinTopperRepository: CoinTopperRepository(),
        )..add(LoadWeekDayHistory(0)),
      ),
      BlocProvider<FeaturedNewsBloc>(
        create: (BuildContext context) => FeaturedNewsBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadFeaturedNewsList()),
      ),
      BlocProvider<NewsListBloc>(
        create: (BuildContext context) => NewsListBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadNewsList()),
      ),
      BlocProvider<NewsSearchBloc>(
        create: (BuildContext context) => NewsSearchBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadNewsSearch("")),
      ),
      BlocProvider<NewsDetailsBloc>(
        create: (BuildContext context) => NewsDetailsBloc(
          coinRepository: CoinTopperRepository(),
        )..add(LoadNewsDetails(0)),
      ),
    ],
    child: MyApp(),
  ));
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
      home: BottomTabNavigationPage(),
    );
  }
}
