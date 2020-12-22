import 'package:cointopper/entities/allHistoryApi.entity.dart';
import 'package:meta/meta.dart';

@immutable
class AllHistoryApiResponseModel {
  final int market_cap;
  final double btc_price;
  final double price;
  final String total_supply;
  final int max_supply;
  final int volume_24h;
  final String circulating_supply;
  final int time;

  AllHistoryApiResponseModel(
    this.market_cap,
    this.btc_price,
    this.price,
    this.total_supply,
    this.max_supply,
    this.volume_24h,
    this.circulating_supply,
    this.time,
  );

  AllHistoryApiEntity toEntity() {
    return AllHistoryApiEntity(
      market_cap,
      btc_price,
      price,
      total_supply,
      max_supply,
      volume_24h,
      circulating_supply,
      time,
    );
  }

  static AllHistoryApiResponseModel fromEntity(AllHistoryApiEntity entity) {
    return AllHistoryApiResponseModel(
      entity.market_cap,
      entity.btc_price,
      entity.price,
      entity.total_supply,
      entity.max_supply,
      entity.volume_24h,
      entity.circulating_supply,
      entity.time,
    );
  }
}
