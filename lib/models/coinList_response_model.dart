import 'package:cointopper/entities/coinList_entity.dart';
import 'package:meta/meta.dart';

@immutable
class CoinListResponseModel {
  final String color1;
  final String color2;
  final dynamic percent_change24h;
  final String last_updated;
  final String logo;
  final dynamic price_btc;
  final dynamic price;
  final dynamic price_usd;
  final dynamic volume24h_usd;
  final dynamic open24_usd;
  final int available_supply;
  final dynamic low24_usd;
  final dynamic high24_usd;
  final int market_cap_usd;
  final int id;
  final int volume24h_usd_to;
  final String symbol;
  final String name;
  final int market_id;
  final String change;

  CoinListResponseModel(
    this.color1,
    this.color2,
    this.percent_change24h,
    this.last_updated,
    this.logo,
    this.price_btc,
    this.price,
    this.price_usd,
    this.volume24h_usd,
    this.open24_usd,
    this.available_supply,
    this.low24_usd,
    this.high24_usd,
    this.market_cap_usd,
    this.id,
    this.volume24h_usd_to,
    this.symbol,
    this.name,
    this.market_id,
    this.change,
  );

  CoinListEntity toEntity() {
    return CoinListEntity(
      color1,
      color2,
      percent_change24h,
      last_updated,
      logo,
      price_btc,
      price,
      price_usd,
      volume24h_usd,
      open24_usd,
      available_supply,
      low24_usd,
      high24_usd,
      market_cap_usd,
      id,
      volume24h_usd_to,
      symbol,
      name,
      market_id,
      change,
    );
  }

  static CoinListResponseModel fromEntity(CoinListEntity entity) {
    return CoinListResponseModel(
      entity.color1,
      entity.color2,
      entity.percent_change24h,
      entity.last_updated,
      entity.logo,
      entity.price_btc,
      entity.price,
      entity.price_usd,
      entity.volume24h_usd,
      entity.open24_usd,
      entity.available_supply,
      entity.low24_usd,
      entity.high24_usd,
      entity.market_cap_usd,
      entity.id,
      entity.volume24h_usd_to,
      entity.symbol,
      entity.name,
      entity.market_id,
      entity.change,
    );
  }
}
