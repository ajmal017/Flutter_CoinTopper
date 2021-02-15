import 'package:cointopper/entities/all_history_api_entity.dart';
import 'package:meta/meta.dart';

@immutable
class AllHistoryApiResponseModel {
  final dynamic marketCap;
  final dynamic btcPrice;
  final dynamic price;
  final dynamic totalSupply;
  final dynamic maxSupply;
  final dynamic volume24h;
  final dynamic circulatingSupply;
  final int time;

  AllHistoryApiResponseModel(
    this.marketCap,
    this.btcPrice,
    this.price,
    this.totalSupply,
    this.maxSupply,
    this.volume24h,
    this.circulatingSupply,
    this.time,
  );

  AllHistoryApiEntity toEntity() {
    return AllHistoryApiEntity(
      marketCap,
      btcPrice,
      price,
      totalSupply,
      maxSupply,
      volume24h,
      circulatingSupply,
      time,
    );
  }

  static AllHistoryApiResponseModel fromEntity(AllHistoryApiEntity entity) {
    return AllHistoryApiResponseModel(
      entity.marketCap,
      entity.btcPrice,
      entity.price,
      entity.totalSupply,
      entity.maxSupply,
      entity.volume24h,
      entity.circulatingSupply,
      entity.time,
    );
  }
}
