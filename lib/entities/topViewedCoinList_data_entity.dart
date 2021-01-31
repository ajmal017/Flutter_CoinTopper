import 'package:equatable/equatable.dart';

class TopViewedCoinListEntity extends Equatable {
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

  TopViewedCoinListEntity(
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

  @override
  List<Object> get props => [
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
      ];

  Map<String, Object> toJson() {
    return {
      'logo': logo,
      'price_btc': priceBTC,
      'price': price,
      'open24_usd': open24USD,
      'low24_usd': low24USD,
      'high24_usd': high24USD,
      'price_usd': priceUSD,
      'market_cap_usd': marketCapUSD,
      'id': id,
      'symbol': symbol,
      'name': name,
      'percent_change24h': percentChange24h,
      'volume24h_usd': volume24hUSD,
      'volume24h_usd_to': volume24hUSDTo,
      'available_supply': availableSupply,
      'color1': color1,
      'color2': color2,
      'last_updated': lastUpdated,
      'change': change,
      'market_id': marketId,
    };
  }

  static TopViewedCoinListEntity fromJson(Map<String, Object> json) {
    return TopViewedCoinListEntity(
      json['logo'] as String,
      json['price_btc'] as dynamic,
      json['price'] as dynamic,
      json['open24_usd'] as int,
      json['low24_usd'] as dynamic,
      json['high24_usd'] as dynamic,
      json['price_usd'] as dynamic,
      json['market_cap_usd'] as dynamic,
      json['id'] as int,
      json['symbol'] as String,
      json['name'] as String,
      json['percent_change24h'] as dynamic,
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
