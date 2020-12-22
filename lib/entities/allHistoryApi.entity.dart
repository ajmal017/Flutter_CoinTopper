import 'package:equatable/equatable.dart';

class AllHistoryApiEntity extends Equatable {
  final int market_cap;
  final double btc_price;
  final double price;
  final String total_supply;
  final int max_supply;
  final int volume_24h;
  final String circulating_supply;
  final int time;

  AllHistoryApiEntity(
    this.market_cap,
    this.btc_price,
    this.price,
    this.total_supply,
    this.max_supply,
    this.volume_24h,
    this.circulating_supply,
    this.time,
  );

  @override
  List<Object> get props => [
        market_cap,
        btc_price,
        price,
        total_supply,
        max_supply,
        volume_24h,
        circulating_supply,
        time,
      ];

  Map<String, Object> toJson() {
    return {
      "market_cap": market_cap,
      "btc_price": btc_price,
      "price": price,
      "total_supply": total_supply,
      "max_supply": max_supply,
      "volume_24h": volume_24h,
      "circulating_supply": circulating_supply,
      "time": time,
    };
  }

  static AllHistoryApiEntity fromJson(Map<String, Object> json) {
    return AllHistoryApiEntity(
      json["market_cap"] as int,
      json["btc_price"] as double,
      json["price"] as double,
      json["total_supply"] as String,
      json["max_supply"] as int,
      json["volume_24h"] as int,
      json["circulating_supply"] as String,
      json["time"] as int,
    );
  }
}
