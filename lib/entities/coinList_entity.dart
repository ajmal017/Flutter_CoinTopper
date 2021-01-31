import 'package:equatable/equatable.dart';

class CoinListEntity extends Equatable {
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

  CoinListEntity(
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

  @override
  List<Object> get props => [
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
      ];

  Map<String, Object> toJson() {
    return {
      'color1': color1,
      'color2': color2,
      'percent_change24h': percentChange24h,
      'last_updated': lastUpdated,
      'logo': logo,
      'price_btc': priceBTC,
      'price': price,
      'price_usd': priceUSD,
      'volume24h_usd': volume24hUSD,
      'open24_usd': open24USD,
      'available_supply': availableSupply,
      'low24_usd': low24USD,
      'high24_usd': high24USD,
      'market_cap_usd': marketCapUSD,
      'id': id,
      'volume24h_usd_to': volume24hUSDTo,
      'symbol': symbol,
      'name': name,
      'market_id': marketId,
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
      json['available_supply'] as dynamic,
      json['low24_usd'] as dynamic,
      json['high24_usd'] as dynamic,
      json['market_cap_usd'] as dynamic,
      json['id'] as int,
      json['volume24h_usd_to'] as int,
      json['symbol'] as String,
      json['name'] as String,
      json['market_id'] as int,
      json['change'] as String,
    );
  }
}
