import 'package:equatable/equatable.dart';

class TopViewedCoinListEntity extends Equatable {
  final double percent_change24h;
  final String logo;
  final double price_btc;
  final double price;
  final String symbol;
  final String name;
  final String color1;
  final String color2;

  TopViewedCoinListEntity(this.percent_change24h, this.logo, this.price_btc, this.price,
      this.symbol, this.name, this.color1, this.color2);

  @override
  List<Object> get props =>
      [percent_change24h, logo, price_btc, price, symbol, name, color1, color2];

  Map<String, Object> toJson() {
    return {
      'percent_change24h': percent_change24h,
      'logo': logo,
      'price_btc': price_btc,
      'price': price,
      'symbol': symbol,
      'name': name,
      'color1': color1,
      'color2': color2,
    };
  }

  static TopViewedCoinListEntity fromJson(Map<String, Object> json) {
    return TopViewedCoinListEntity(
      json['percent_change24h'] as double,
      json['logo'] as String,
      json['price_btc'] as double,
      json['price'] as double,
      json['symbol'] as String,
      json['name'] as String,
      json['color1'] as String,
      json['color2'] as String,
    );
  }
}
