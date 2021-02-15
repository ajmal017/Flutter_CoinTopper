import 'package:cointopper/entities/global_data_coin_data_entity.dart';
import 'package:meta/meta.dart';

@immutable
class GlobalDataCoinResponseModel {
  final int totalCoins;
  final int totalVolume;
  final int totalMarketCap;

  GlobalDataCoinResponseModel(
    this.totalCoins,
    this.totalVolume,
    this.totalMarketCap,
  );

  GlobalDataCoinDataEntity toEntity() {
    return GlobalDataCoinDataEntity(
      totalCoins,
      totalVolume,
      totalMarketCap,
    );
  }

  static GlobalDataCoinResponseModel fromEntity(
      GlobalDataCoinDataEntity entity) {
    return GlobalDataCoinResponseModel(
      entity.totalCoins,
      entity.totalVolume,
      entity.totalMarketCap,
    );
  }
}
