import 'package:cointopper/entities/week_day_history_api_entity.dart';
import 'package:meta/meta.dart';

@immutable
class WeekDayHistoryApiResponseModel {
  final double marketCap;
  final String btcPrice;
  final double percentChange7d;
  final double price;
  final double percentChange24h;
  final double totalSupply;
  final int maxSupply;
  final double volume_24h;
  final double circulatingSupply;
  final int time;
  final double percentChange1h;

  WeekDayHistoryApiResponseModel(
    this.marketCap,
    this.btcPrice,
    this.percentChange7d,
    this.price,
    this.percentChange24h,
    this.totalSupply,
    this.maxSupply,
    this.volume_24h,
    this.circulatingSupply,
    this.time,
    this.percentChange1h,
  );

  WeekDayHistoryApiEntity toEntity() {
    return WeekDayHistoryApiEntity(
      marketCap,
      btcPrice,
      percentChange7d,
      price,
      percentChange24h,
      totalSupply,
      maxSupply,
      volume_24h,
      circulatingSupply,
      time,
      percentChange1h,
    );
  }

  static WeekDayHistoryApiResponseModel fromEntity(
      WeekDayHistoryApiEntity entity) {
    return WeekDayHistoryApiResponseModel(
      entity.marketCap,
      entity.btcPrice,
      entity.percentChange7d,
      entity.price,
      entity.percentChange24h,
      entity.totalSupply,
      entity.maxSupply,
      entity.volume_24h,
      entity.circulatingSupply,
      entity.time,
      entity.percentChange1h,
    );
  }
}
