import 'package:cointopper/api/api.dart';
import 'package:cointopper/models/globalDataCoin_response_model.dart';
import 'package:cointopper/models/topViewedCoinList_response_Model.dart';

class CoinTopperRepository {
  ApiClient apiClient;

  CoinTopperRepository() {
    this.apiClient = ApiClient(
        baseUrl: "https://api.cointopper.com/api/v3/");
  }

  Stream<List<GlobalDataCoinResponseModel>> loadGlobalDataCoin() async* {
    yield* apiClient.fetchGlobalDataCoin();
  }

  Stream<List<TopViewedCoinListResponseModel>> loadTopViewedCoinList() async* {
    yield* apiClient.fetchTopViewedCoinList();
  }
}
