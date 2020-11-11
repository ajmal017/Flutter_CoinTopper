import 'dart:convert';

import 'package:cointopper/entities/currencyList_entity.dart';
import 'package:cointopper/entities/globalDataCoin_data_entity.dart';
import 'package:cointopper/entities/topViewedCoinList_data_entity.dart';
import 'package:cointopper/models/currencyList_response_model.dart';
import 'package:cointopper/models/globalDataCoin_response_model.dart';
import 'package:cointopper/models/topViewedCoinList_response_Model.dart';
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
    print('Result GlobalDataCoin ==>> $dummy');

    yield data
        .map((dynamic item) => GlobalDataCoinResponseModel.fromEntity(
            GlobalDataCoinDataEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

//   Dropdown List of Currency.
  Stream<List<CurrencyListResponseModel>> fetchCurrencyList() async* {
    print('fetchCurrencyList ==>>');
    final response = await httpClient.get(
      Uri.encodeFull('${this.baseUrl + "currency"}'),
      headers: header,
    );

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    print('fetchCurrencyList result ==>> $results');

    yield results
        .map((dynamic item) => CurrencyListResponseModel.fromEntity(
            CurrencyListEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  // TopViewed Coin List API or TopSearched API.
  Stream<List<TopViewedCoinListResponseModel>> fetchTopViewedCoinList() async* {
    print('TopViewedCoinList ==>>');
    final response = await httpClient.get(
      Uri.encodeFull('${this.baseUrl + "topsearched"}'),
      headers: header,
    );

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    print('Result TopViewedCoinList ==>> $results');

    yield results
        .map((dynamic item) => TopViewedCoinListResponseModel.fromEntity(
            TopViewedCoinListEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }
}
