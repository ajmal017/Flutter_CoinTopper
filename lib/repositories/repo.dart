import 'package:cointopper/api/api_client.dart';
import 'package:cointopper/models/coinList_response_model.dart';
import 'package:cointopper/models/coindetail_response_model.dart';
import 'package:cointopper/models/currencyList_response_model.dart';
import 'package:cointopper/models/globalDataCoin_response_model.dart';
import 'package:cointopper/models/searchCoin_response_model.dart';
import 'package:cointopper/models/topViewedCoinList_response_Model.dart';

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
  Stream<List<TopViewedCoinListResponseModel>> loadTopViewedCoinList() async* {
    yield* apiClient.fetchTopViewedCoinList();
  }

  // Coin List Repo.
  Stream<List<CoinListResponseModel>> loadCoinList() async* {
    yield* apiClient.fetchCoinList();
  }

  // Search Coin Repo.
  Stream<List<SearchCoinListResponseModel>> loadSearchCoinsList() async* {
    yield* apiClient.fetchSearchCoinsList();
  }

  // Coin Detail Repo.
  Stream<List<CoinDetailResponseModel>> loadCoinDetailsList(symbol) async* {
    yield* apiClient.fetchCoinDetails(symbol);
  }
}
