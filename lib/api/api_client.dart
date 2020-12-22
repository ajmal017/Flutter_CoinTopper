import 'dart:convert';

import 'package:cointopper/entities/allHistoryApi.entity.dart';
import 'package:cointopper/entities/coinDetail_entity.dart';
import 'package:cointopper/entities/coinList_entity.dart';
import 'package:cointopper/entities/currencyList_entity.dart';
import 'package:cointopper/entities/globalDataCoin_data_entity.dart';
import 'package:cointopper/entities/searchCoin_entity.dart';
import 'package:cointopper/entities/topViewedCoinList_data_entity.dart';
import 'package:cointopper/entities/weekDayHistoryApi.entity.dart';
import 'package:cointopper/models/allHistoryApi_response_model.dart';
import 'package:cointopper/models/coinList_response_model.dart';
import 'package:cointopper/models/coindetail_response_model.dart';
import 'package:cointopper/models/currencyList_response_model.dart';
import 'package:cointopper/models/globalDataCoin_response_model.dart';
import 'package:cointopper/models/searchCoin_response_model.dart';
import 'package:cointopper/models/topViewedCoinList_response_Model.dart';
import 'package:cointopper/models/weekDayhistoryApi_response_model.dart';
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
  Stream<List<TopViewedCoinListResponseModel>> fetchTopViewedCoinList() async* {
    final response = await httpClient.get(
      Uri.encodeFull('${this.baseUrl + "topsearched"}'),
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
  Stream<List<CoinListResponseModel>> fetchCoinList() async* {
    final response = await httpClient.get(
      Uri.encodeFull('${this.baseUrl + "ticker?offset=0&limit=20"}'),
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
  Stream<List<CoinDetailResponseModel>> fetchCoinDetails(String symbol) async* {
    final response = await httpClient.get(
      Uri.encodeFull('${this.baseUrl + "ticker/" + "$symbol"}'),
      headers: header,
    );
    var convertInArray = [];
    Map<String, dynamic> map = json.decode(response.body);
    var result = map['data'];
    convertInArray.add(result);
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
    var convertInArray = [];
    Map<String, dynamic> map = json.decode(response.body);
    var result = map['data'];
    convertInArray.add(result);
    yield convertInArray
        .map((dynamic item) => WeekDayHistoryApiResponseModel.fromEntity(
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
    var convertInArray = [];
    Map<String, dynamic> map = json.decode(response.body);
    var result = map['data'];
    convertInArray.add(result);
    yield convertInArray
        .map((dynamic item) => AllHistoryApiResponseModel.fromEntity(
            AllHistoryApiEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }
}
