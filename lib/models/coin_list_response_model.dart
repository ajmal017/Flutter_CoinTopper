import 'package:cointopper/entities/coin_list_entity.dart';
import 'package:meta/meta.dart';

@immutable
class CoinListResponseModel {
  final String color1;
  final String color2;
  final dynamic percentChange24h;
  final String lastUpdated;
  final String logo;
  final dynamic priceBTC;
  final dynamic price;
  final dynamic priceUSD;
  final dynamic volume24hUSD;
  final dynamic open24USD;
  final dynamic availableSupply;
  final dynamic low24USD;
  final dynamic high24USD;
  final dynamic marketCapUSD;
  final int id;
  final int volume24hUSDTo;
  final String symbol;
  final String name;
  final int marketId;
  final String change;

  CoinListResponseModel(
    this.color1,
    this.color2,
    this.percentChange24h,
    this.lastUpdated,
    this.logo,
    this.priceBTC,
    this.price,
    this.priceUSD,
    this.volume24hUSD,
    this.open24USD,
    this.availableSupply,
    this.low24USD,
    this.high24USD,
    this.marketCapUSD,
    this.id,
    this.volume24hUSDTo,
    this.symbol,
    this.name,
    this.marketId,
    this.change,
  );

  CoinListEntity toEntity() {
    return CoinListEntity(
      color1,
      color2,
      percentChange24h,
      lastUpdated,
      logo,
      priceBTC,
      price,
      priceUSD,
      volume24hUSD,
      open24USD,
      availableSupply,
      low24USD,
      high24USD,
      marketCapUSD,
      id,
      volume24hUSDTo,
      symbol,
      name,
      marketId,
      change,
    );
  }

  static CoinListResponseModel fromEntity(CoinListEntity entity) {
    return CoinListResponseModel(
      entity.color1,
      entity.color2,
      entity.percentChange24h,
      entity.lastUpdated,
      entity.logo,
      entity.priceBTC,
      entity.price,
      entity.priceUSD,
      entity.volume24hUSD,
      entity.open24USD,
      entity.availableSupply,
      entity.low24USD,
      entity.high24USD,
      entity.marketCapUSD,
      entity.id,
      entity.volume24hUSDTo,
      entity.symbol,
      entity.name,
      entity.marketId,
      entity.change,
    );
  }
}
