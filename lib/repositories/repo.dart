import 'package:cointopper/api/api.dart';
import 'package:cointopper/models/globalDataCoin_response_model.dart';

class CoinTopperRepository {
  ApiClient apiClient;

  CoinTopperRepository() {
    this.apiClient = ApiClient(
        baseUrl: "https://api.cointopper.com/api/v3/");
  }

  Stream<List<GlobalDataCoinResponseModel>> loadGlobalDataCoin() async* {
    yield* apiClient.fetchGlobalDataCoin();
  }
}
