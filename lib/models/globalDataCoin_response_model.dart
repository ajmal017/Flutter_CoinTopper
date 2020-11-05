import 'package:cointopper/entities/globalDataCoin_data_entity.dart';
import 'package:meta/meta.dart';

@immutable
class GlobalDataCoinResponseModel {
  final int total_coins;
  final int total_volume;
  final int total_market_cap;

  GlobalDataCoinResponseModel(
      this.total_coins, this.total_volume, this.total_market_cap);

  GlobalDataCoinDataEntity toEntity() {
    return GlobalDataCoinDataEntity(
        total_coins, total_volume, total_market_cap);
  }

  static GlobalDataCoinResponseModel fromEntity(
      GlobalDataCoinDataEntity entity) {
    return GlobalDataCoinResponseModel(
        entity.total_coins, entity.total_volume, entity.total_market_cap);
  }
}
