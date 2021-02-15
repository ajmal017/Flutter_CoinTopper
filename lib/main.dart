import 'package:cointopper/bloc/all_history_bloc/all_history_bloc.dart';
import 'package:cointopper/bloc/all_history_bloc/all_history_event.dart';
import 'package:cointopper/bloc/coin_detail_bloc/coin_detail_bloc.dart';
import 'package:cointopper/bloc/coin_detail_bloc/coin_detail_event.dart';
import 'package:cointopper/bloc/coin_list_bloc/coin_list_bloc.dart';
import 'package:cointopper/bloc/coin_list_bloc/coin_list_event.dart';
import 'package:cointopper/bloc/currency_list_bloc/currency_list_bloc.dart';
import 'package:cointopper/bloc/currency_list_bloc/currency_list_event.dart';
import 'package:cointopper/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:cointopper/bloc/dashboard_bloc/dashboard_event.dart';
import 'package:cointopper/bloc/featured_news_bloc/featured_news_bloc.dart';
import 'package:cointopper/bloc/featured_news_bloc/featured_news_event.dart';
import 'package:cointopper/bloc/news_details_bloc/news_details_bloc.dart';
import 'package:cointopper/bloc/news_details_bloc/news_details_event.dart';
import 'package:cointopper/bloc/news_list_bloc/news_list_bloc.dart';
import 'package:cointopper/bloc/news_list_bloc/news_list_event.dart';
import 'package:cointopper/bloc/news_search_bloc/news_search_bloc.dart';
import 'package:cointopper/bloc/news_search_bloc/news_search_event.dart';
import 'package:cointopper/bloc/search_coin_bloc/searchCoinList_event.dart';
import 'package:cointopper/bloc/search_coin_bloc/search_coin_list_bloc.dart';
import 'package:cointopper/bloc/top_view_coin_list_bloc/top_viewed_coin_list_bloc.dart';
import 'package:cointopper/bloc/top_view_coin_list_bloc/top_viewed_coin_list_event.dart';
import 'package:cointopper/bloc/week_day_history_bloc/week_day_history_bloc.dart';
import 'package:cointopper/bloc/week_day_history_bloc/week_day_history_event.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:cointopper/screens/bottom_tab_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
