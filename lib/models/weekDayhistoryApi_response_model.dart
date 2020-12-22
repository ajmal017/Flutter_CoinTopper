import 'package:cointopper/entities/weekDayHistoryApi.entity.dart';
import 'package:meta/meta.dart';

@immutable
class WeekDayHistoryApiResponseModel {
  final double market_cap;
  final String btc_price;
  final double percent_change_7d;
  final double price;
  final double percent_change_24h;
  final double total_supply;
  final int max_supply;
  final double volume_24h;
  final double circulating_supply;
  final int time;
  final double percent_change_1h;

  WeekDayHistoryApiResponseModel(
    this.market_cap,
    this.btc_price,
    this.percent_change_7d,
    this.price,
    this.percent_change_24h,
    this.total_supply,
    this.max_supply,
    this.volume_24h,
    this.circulating_supply,
    this.time,
    this.percent_change_1h,
  );

  WeekDayHistoryApiEntity toEntity() {
    return WeekDayHistoryApiEntity(
      market_cap,
      btc_price,
      percent_change_7d,
      price,
      percent_change_24h,
      total_supply,
      max_supply,
      volume_24h,
      circulating_supply,
      time,
      percent_change_1h,
    );
  }

  static WeekDayHistoryApiResponseModel fromEntity(
      WeekDayHistoryApiEntity entity) {
    return WeekDayHistoryApiResponseModel(
      entity.market_cap,
      entity.btc_price,
      entity.percent_change_7d,
      entity.price,
      entity.percent_change_24h,
      entity.total_supply,
      entity.max_supply,
      entity.volume_24h,
      entity.circulating_supply,
      entity.time,
      entity.percent_change_1h,
    );
  }
}
