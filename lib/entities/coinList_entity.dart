import 'package:equatable/equatable.dart';

class CoinListEntity extends Equatable {
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

  CoinListEntity(
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

  @override
  List<Object> get props => [
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
      ];

  Map<String, Object> toJson() {
    return {
      'color1': color1,
      'color2': color2,
      'percent_change24h': percent_change24h,
      'last_updated': last_updated,
      'logo': logo,
      'price_btc': price_btc,
      'price': price,
      'price_usd': price_usd,
      'volume24h_usd': volume24h_usd,
      'open24_usd': open24_usd,
      'available_supply': available_supply,
      'low24_usd': low24_usd,
      'high24_usd': high24_usd,
      'market_cap_usd': market_cap_usd,
      'id': id,
      'volume24h_usd_to': volume24h_usd_to,
      'symbol': symbol,
      'name': name,
      'market_id': market_id,
      'change': change,
    };
  }

  static CoinListEntity fromJson(Map<String, Object> json) {
    return CoinListEntity(
      json['color1'] as String,
      json['color2'] as String,
      json['percent_change24h'] as dynamic,
      json['last_updated'] as String,
      json['logo'] as String,
      json['price_btc'] as dynamic,
      json['price'] as dynamic,
      json['price_usd'] as dynamic,
      json['volume24h_usd'] as dynamic,
      json['open24_usd'] as dynamic,
      json['available_supply'] as int,
      json['low24_usd'] as dynamic,
      json['high24_usd'] as dynamic,
      json['market_cap_usd'] as int,
      json['id'] as int,
      json['volume24h_usd_to'] as int,
      json['symbol'] as String,
      json['name'] as String,
      json['market_id'] as int,
      json['change'] as String,
    );
  }
}
