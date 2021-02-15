import 'package:equatable/equatable.dart';

class GlobalDataCoinDataEntity extends Equatable {
  final int totalCoins;
  final int totalVolume;
  final int totalMarketCap;

  GlobalDataCoinDataEntity(
    this.totalCoins,
    this.totalVolume,
    this.totalMarketCap,
  );

  @override
  List<Object> get props => [
        totalCoins,
        totalVolume,
        totalMarketCap,
      ];

  Map<String, Object> toJson() {
    return {
      'total_coins': totalCoins,
      'total_volume': totalVolume,
      'total_market_cap': totalMarketCap,
    };
  }

  static GlobalDataCoinDataEntity fromJson(Map<String, Object> json) {
    return GlobalDataCoinDataEntity(json['total_coins'] as int,
        json['total_volume'] as int, json['total_market_cap'] as int);
  }
}
