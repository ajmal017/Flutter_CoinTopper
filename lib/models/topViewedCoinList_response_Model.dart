import 'package:cointopper/entities/topViewedCoinList_data_entity.dart';
import 'package:meta/meta.dart';

@immutable
class TopViewedCoinListResponseModel {
  final String logo;
  final dynamic price_btc;
  final double price;
  final int open24_usd;
  final dynamic low24_usd;
  final double high24_usd;
  final double price_usd;
  final int market_cap_usd;
  final int id;
  final String symbol;
  final String name;
  final double percent_change24h;
  final int volume24h_usd;
  final int volume24h_usd_to;
  final String available_supply;
  final String color1;
  final String color2;
  final String last_updated;
  final String change;
  final int market_id;

  TopViewedCoinListResponseModel(
    this.logo,
    this.price_btc,
    this.price,
    this.open24_usd,
    this.low24_usd,
    this.high24_usd,
    this.price_usd,
    this.market_cap_usd,
    this.id,
    this.symbol,
    this.name,
    this.percent_change24h,
    this.volume24h_usd,
    this.volume24h_usd_to,
    this.available_supply,
    this.color1,
    this.color2,
    this.last_updated,
    this.change,
    this.market_id,
  );

  TopViewedCoinListEntity toEntity() {
    return TopViewedCoinListEntity(
      logo,
      price_btc,
      price,
      open24_usd,
      low24_usd,
      high24_usd,
      price_usd,
      market_cap_usd,
      id,
      symbol,
      name,
      percent_change24h,
      volume24h_usd,
      volume24h_usd_to,
      available_supply,
      color1,
      color2,
      last_updated,
      change,
      market_id,
    );
  }

  static TopViewedCoinListResponseModel fromEntity(
      TopViewedCoinListEntity entity) {
    return TopViewedCoinListResponseModel(
      entity.logo,
      entity.price_btc,
      entity.price,
      entity.open24_usd,
      entity.low24_usd,
      entity.high24_usd,
      entity.price_usd,
      entity.market_cap_usd,
      entity.id,
      entity.symbol,
      entity.name,
      entity.percent_change24h,
      entity.volume24h_usd,
      entity.volume24h_usd_to,
      entity.available_supply,
      entity.color1,
      entity.color2,
      entity.last_updated,
      entity.change,
      entity.market_id,
    );
  }
}
