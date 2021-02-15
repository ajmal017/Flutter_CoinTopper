import 'package:cointopper/entities/top_viewed_coin%20list_data_entity.dart';
import 'package:meta/meta.dart';

@immutable
class TopViewedCoinListResponseModel {
  final String logo;
  final dynamic priceBTC;
  final dynamic price;
  final int open24USD;
  final dynamic low24USD;
  final dynamic high24USD;
  final dynamic priceUSD;
  final dynamic marketCapUSD;
  final int id;
  final String symbol;
  final String name;
  final dynamic percentChange24h;
  final int volume24hUSD;
  final int volume24hUSDTo;
  final String availableSupply;
  final String color1;
  final String color2;
  final String lastUpdated;
  final String change;
  final int marketId;

  TopViewedCoinListResponseModel(
    this.logo,
    this.priceBTC,
    this.price,
    this.open24USD,
    this.low24USD,
    this.high24USD,
    this.priceUSD,
    this.marketCapUSD,
    this.id,
    this.symbol,
    this.name,
    this.percentChange24h,
    this.volume24hUSD,
    this.volume24hUSDTo,
    this.availableSupply,
    this.color1,
    this.color2,
    this.lastUpdated,
    this.change,
    this.marketId,
  );

  TopViewedCoinListEntity toEntity() {
    return TopViewedCoinListEntity(
      logo,
      priceBTC,
      price,
      open24USD,
      low24USD,
      high24USD,
      priceUSD,
      marketCapUSD,
      id,
      symbol,
      name,
      percentChange24h,
      volume24hUSD,
      volume24hUSDTo,
      availableSupply,
      color1,
      color2,
      lastUpdated,
      change,
      marketId,
    );
  }

  static TopViewedCoinListResponseModel fromEntity(
      TopViewedCoinListEntity entity) {
    return TopViewedCoinListResponseModel(
      entity.logo,
      entity.priceBTC,
      entity.price,
      entity.open24USD,
      entity.low24USD,
      entity.high24USD,
      entity.priceUSD,
      entity.marketCapUSD,
      entity.id,
      entity.symbol,
      entity.name,
      entity.percentChange24h,
      entity.volume24hUSD,
      entity.volume24hUSDTo,
      entity.availableSupply,
      entity.color1,
      entity.color2,
      entity.lastUpdated,
      entity.change,
      entity.marketId,
    );
  }
}
