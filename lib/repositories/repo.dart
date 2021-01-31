import 'package:cointopper/api/api_client.dart';
import 'package:cointopper/models/allHistoryApi_response_model.dart';
import 'package:cointopper/models/coinList_response_model.dart';
import 'package:cointopper/models/coindetail_response_model.dart';
import 'package:cointopper/models/currencyList_response_model.dart';
import 'package:cointopper/models/featuredNewsList_response_model.dart';
import 'package:cointopper/models/globalDataCoin_response_model.dart';
import 'package:cointopper/models/newsDetails_response_model.dart';
import 'package:cointopper/models/newsList_response_model.dart';
import 'package:cointopper/models/searchCoin_response_model.dart';
import 'package:cointopper/models/searchNews_response_model.dart';
import 'package:cointopper/models/topViewedCoinList_response_Model.dart';
import 'package:cointopper/models/weekDayHistoryApi_response_model.dart';

class CoinTopperRepository {
  ApiClient apiClient;

  CoinTopperRepository() {
    this.apiClient = ApiClient(baseUrl: "https://api.cointopper.com/api/v3/");
  }

  // Global Coin Repo for Market Capacity in header.
  Stream<List<GlobalDataCoinResponseModel>> loadGlobalDataCoin() async* {
    yield* apiClient.fetchGlobalDataCoin();
  }

  // Dropdown List of Currency.
  Stream<List<CurrencyListResponseModel>> loadCurrencyList() async* {
    yield* apiClient.fetchCurrencyList();
  }

  // TopViewed Coin List Repo or TopSearched Repo.
  Stream<List<TopViewedCoinListResponseModel>> loadTopViewedCoinList(
      String currencyCode) async* {
    yield* apiClient.fetchTopViewedCoinList(currencyCode);
  }

  // Coin List Repo.
  Stream<List<CoinListResponseModel>> loadCoinList(String currencyCode, int offset, int limit) async* {
    yield* apiClient.fetchCoinList(currencyCode, offset, limit);
  }

  // Search Coin Repo.
  Stream<List<SearchCoinListResponseModel>> loadSearchCoinsList() async* {
    yield* apiClient.fetchSearchCoinsList();
  }

  // Coin Detail Repo.
  Stream<List<CoinDetailResponseModel>> loadCoinDetailsList(
      String symbol, String currencyCode) async* {
    yield* apiClient.fetchCoinDetails(symbol, currencyCode);
  }

  // Week Day History APi Repo.
  Stream<List<WeekDayHistoryApiResponseModel>> loadWeekDayHistoryApi(
      int marketId) async* {
    yield* apiClient.fetchWeekDayHistoryApi(marketId);
  }

  // All History Api Repo.
  Stream<List<AllHistoryApiResponseModel>> loadAllHistoryApi(
      int marketId) async* {
    yield* apiClient.fetchAllHistoryAPi(marketId);
  }

  //Featured News List.
  Stream<List<FeaturedNewsListResponseModel>> loadFeaturedNewsList() async* {
    yield* apiClient.fetchFeaturedNewsList();
  }

  //News List.
  Stream<List<NewsListResponseModel>> loadNewsList() async* {
    yield* apiClient.fetchNewsList();
  }

  //Search News List
  Stream<List<SearchNewsResponseModel>> loadSearchNewsList(keyword) async* {
    yield* apiClient.fetchSearchNewsList(keyword);
  }

  //News Details.
  Stream<List<NewsDetailsResponseModel>> loadNewsDetails(id) async* {
    yield* apiClient.fetchNewsDetails(id);
  }
}
