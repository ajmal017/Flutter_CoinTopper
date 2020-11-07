import 'dart:convert';

import 'package:cointopper/entities/globalDataCoin_data_entity.dart';
import 'package:cointopper/entities/topViewedCoinList_data_entity.dart';
import 'package:cointopper/models/globalDataCoin_response_model.dart';
import 'package:cointopper/models/topViewedCoinList_response_Model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  String baseUrl;
  final http.Client httpClient;

  ApiClient({
    http.Client httpClient,
    this.baseUrl,
  }) : this.httpClient = httpClient ?? http.Client();

  Stream<List<GlobalDataCoinResponseModel>> fetchGlobalDataCoin() async* {
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "globaldata"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    var datat = [];
    Map<String, dynamic> map = json.decode(response.body);
    var dummy = map['data'];
    datat.add(dummy);
    yield datat
        .map((dynamic item) => GlobalDataCoinResponseModel.fromEntity(
        GlobalDataCoinDataEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  Stream<List<TopViewedCoinListResponseModel>> fetchTopViewedCoinList() async* {
    print('Result TopViewedCoinList ==>>');
    final response =
    await httpClient.get(Uri.encodeFull('${this.baseUrl + "topsearched"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    print('Result TopViewedCoinList ==>> $results');
    yield results
        .map((dynamic item) => TopViewedCoinListResponseModel.fromEntity(
        TopViewedCoinListEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }
}
