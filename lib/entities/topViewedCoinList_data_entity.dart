import 'package:equatable/equatable.dart';

class TopViewedCoinListEntity extends Equatable {
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

  TopViewedCoinListEntity(
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

  @override
  List<Object> get props => [
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
      ];

  Map<String, Object> toJson() {
    return {
      'logo': logo,
      'price_btc': price_btc,
      'price': price,
      'open24_usd': open24_usd,
      'low24_usd': low24_usd,
      'high24_usd': high24_usd,
      'price_usd': price_usd,
      'market_cap_usd': market_cap_usd,
      'id': id,
      'symbol': symbol,
      'name': name,
      'percent_change24h': percent_change24h,
      'volume24h_usd': volume24h_usd,
      'volume24h_usd_to': volume24h_usd_to,
      'available_supply': available_supply,
      'color1': color1,
      'color2': color2,
      'last_updated': last_updated,
      'change': change,
      'market_id': market_id,
    };
  }

  static TopViewedCoinListEntity fromJson(Map<String, Object> json) {
    return TopViewedCoinListEntity(
      json['logo'] as String,
      json['price_btc'] as dynamic,
      json['price'] as double,
      json['open24_usd'] as int,
      json['low24_usd'] as dynamic,
      json['high24_usd'] as double,
      json['price_usd'] as double,
      json['market_cap_usd'] as int,
      json['id'] as int,
      json['symbol'] as String,
      json['name'] as String,
      json['percent_change24h'] as double,
      json['volume24h_usd'] as int,
      json['volume24h_usd_to'] as int,
      json['available_supply'] as String,
      json['color1'] as String,
      json['color2'] as String,
      json['last_updated'] as String,
      json['change'] as String,
      json['market_id'] as int,
    );
  }
}
