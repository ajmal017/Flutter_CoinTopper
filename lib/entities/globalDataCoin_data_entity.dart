import 'package:equatable/equatable.dart';

class GlobalDataCoinDataEntity extends Equatable {
  final int total_coins;
  final int total_volume;
  final int total_market_cap;

  GlobalDataCoinDataEntity(this.total_coins, this.total_volume,
      this.total_market_cap);

  @override
  List<Object> get props => [total_coins, total_volume, total_market_cap];

  Map<String, Object> toJson() {
    return {
      'total_coins': total_coins,
      'total_volume': total_volume,
      'total_market_cap': total_market_cap,
    };
  }

  static GlobalDataCoinDataEntity fromJson(Map<String, Object> json) {
    return GlobalDataCoinDataEntity(
        json['total_coins'] as int,
        json['total_volume'] as int,
        json['total_market_cap'] as int);
    }
}
