import 'dart:convert';

import 'package:cointopper/entities/all_history_api_entity.dart';
import 'package:cointopper/entities/coin_detail_entity.dart';
import 'package:cointopper/entities/coin_list_entity.dart';
import 'package:cointopper/entities/currency_list_entity.dart';
import 'package:cointopper/entities/featured_news_list_entity.dart';
import 'package:cointopper/entities/global_data_coin_data_entity.dart';
import 'package:cointopper/entities/news_details_entity.dart';
import 'package:cointopper/entities/news_list_entity.dart';
import 'package:cointopper/entities/search_coin_entity.dart';
import 'package:cointopper/entities/search_news_entity.dart';
import 'package:cointopper/entities/top_viewed_coin%20list_data_entity.dart';
import 'package:cointopper/entities/week_day_history_api_entity.dart';
import 'package:cointopper/models/all_history_api_response_model.dart';
import 'package:cointopper/models/coin_detail_response_model.dart';
import 'package:cointopper/models/coin_list_response_model.dart';
import 'package:cointopper/models/currency_list_response_model.dart';
import 'package:cointopper/models/featured_news_list_response_model.dart';
import 'package:cointopper/models/global_data_coin_response_model.dart';
import 'package:cointopper/models/news_details_response_model.dart';
import 'package:cointopper/models/news_list_response_model.dart';
import 'package:cointopper/models/search_coin_response_model.dart';
import 'package:cointopper/models/search_news_response_model.dart';
import 'package:cointopper/models/top_viewed_coin_list_response_Model.dart';
import 'package:cointopper/models/week_day_history_api_response_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  String baseUrl;
  final http.Client httpClient;
  String token;
  static const header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  ApiClient({
    http.Client httpClient,
    this.baseUrl,
  }) : this.httpClient = httpClient ?? http.Client();

  // Global Coin API for Market Capacity in header.
  Stream<List<GlobalDataCoinResponseModel>> fetchGlobalDataCoin() async* {
    final response = await httpClient.get(
      Uri.encodeFull('${this.baseUrl + "globaldata"}'),
      headers: header,
    );
    var data = [];
    Map<String, dynamic> map = json.decode(response.body);

    var dummy = map['data'];
    data.add(dummy);

    yield data
        .map((dynamic item) => GlobalDataCoinResponseModel.fromEntity(
            GlobalDataCoinDataEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

//   Dropdown List of Currency.
  Stream<List<CurrencyListResponseModel>> fetchCurrencyList() async* {
    final response = await httpClient.get(
      Uri.encodeFull('${this.baseUrl + "currency"}'),
      headers: header,
    );

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];

    yield results
        .map((dynamic item) => CurrencyListResponseModel.fromEntity(
            CurrencyListEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  // TopViewed Coin List API or TopSearched API.
  Stream<List<TopViewedCoinListResponseModel>> fetchTopViewedCoinList(
      String currencyCode) async* {
    final response = await httpClient.get(
      Uri.encodeFull('${this.baseUrl + "topsearched?currency=$currencyCode"}'),
      headers: header,
    );

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    yield results
        .map((dynamic item) => TopViewedCoinListResponseModel.fromEntity(
            TopViewedCoinListEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  // Coin List API.
  Stream<List<CoinListResponseModel>> fetchCoinList(
      String currencyCode, int offset, int limit) async* {
    final response = await httpClient.get(
      Uri.encodeFull(
          '${this.baseUrl + "ticker?offset=$offset&limit=$limit&currency=$currencyCode"}'),
      headers: header,
    );

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];

    yield results
        .map((dynamic item) => CoinListResponseModel.fromEntity(
            CoinListEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  // Search Coin API.
  Stream<List<SearchCoinListResponseModel>> fetchSearchCoinsList() async* {
    final response = await httpClient.get(
      Uri.encodeFull('${this.baseUrl + "search"}'),
      headers: header,
    );

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];

    yield results
        .map((dynamic item) => SearchCoinListResponseModel.fromEntity(
            SearchCoinListEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  // Coin Detail API.
  Stream<List<CoinDetailResponseModel>> fetchCoinDetails(
      String symbol, String currencyCode) async* {
    final response = await httpClient.get(
      Uri.encodeFull(
          '${this.baseUrl + "ticker/$symbol?currency=$currencyCode"}'),
      headers: header,
    );
    var convertInArray = [];
    Map<String, dynamic> map = json.decode(response.body);
    var results = map['data'];

    convertInArray.add(results);
    yield convertInArray
        .map((dynamic item) => CoinDetailResponseModel.fromEntity(
            CoinDetailEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  // Week Day History API.
  Stream<List<WeekDayHistoryApiResponseModel>> fetchWeekDayHistoryApi(
      int marketId) async* {
    final response = await httpClient.get(
      Uri.encodeFull("https://graph.cointopper.com/historyweekhours/$marketId"),
      headers: header,
    );
//    List<dynamic> convertInArray = [];
    Map<String, dynamic> map = json.decode(response.body);
    var result = map['data'];
//    convertInArray.add(result);
//    yield convertInArray
    yield result
        .map<WeekDayHistoryApiResponseModel>((item) =>
            WeekDayHistoryApiResponseModel.fromEntity(
                WeekDayHistoryApiEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  // All History API.
  Stream<List<AllHistoryApiResponseModel>> fetchAllHistoryAPi(
      int marketId) async* {
    final response = await httpClient.get(
      Uri.encodeFull("https://graph.cointopper.com/history/$marketId"),
      headers: header,
    );
//    var convertInArray = [];
    Map<String, dynamic> map = json.decode(response.body);
    var result = map['data'];
//    convertInArray.add(result);
//    yield convertInArray
    yield result
        .map<AllHistoryApiResponseModel>((dynamic item) =>
            AllHistoryApiResponseModel.fromEntity(
                AllHistoryApiEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  //Featured News List.
  Stream<List<FeaturedNewsListResponseModel>> fetchFeaturedNewsList() async* {
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "featured"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    yield results
        .map((dynamic item) => FeaturedNewsListResponseModel.fromEntity(
            FeaturedNewsListEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  //News List.
  Stream<List<NewsListResponseModel>> fetchNewsList() async* {
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "news"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    yield results
        .map((dynamic item) => NewsListResponseModel.fromEntity(
            NewsListEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  //Search News List
  Stream<List<SearchNewsResponseModel>> fetchSearchNewsList(
      String keyword) async* {
    final response = await httpClient.get(
        Uri.encodeFull('${this.baseUrl + "search/news?keyword=" + "$keyword"}'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    yield results
        .map((dynamic item) => SearchNewsResponseModel.fromEntity(
            SearchNewsEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  //News Details.
  Stream<List<NewsDetailsResponseModel>> fetchNewsDetails(int id) async* {
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "news/" + "$id"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    var convertInArray = [];
    Map<String, dynamic> map = json.decode(response.body);
    var results = map["data"];
    convertInArray.add(results);
    yield convertInArray
        .map<NewsDetailsResponseModel>((dynamic item) =>
            NewsDetailsResponseModel.fromEntity(
                NewsDetailsEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }
}
