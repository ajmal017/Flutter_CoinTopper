import 'package:equatable/equatable.dart';

class WeekDayHistoryApiEntity extends Equatable {
  final double market_cap;
  final String btc_price;
  final double percent_change_7d;
  final double price;
  final double percent_change_24h;
  final double total_supply;
  final int max_supply;
  final double volume_24h;
  final double circulating_supply;
  final int time;
  final double percent_change_1h;

  WeekDayHistoryApiEntity(
    this.market_cap,
    this.btc_price,
    this.percent_change_7d,
    this.price,
    this.percent_change_24h,
    this.total_supply,
    this.max_supply,
    this.volume_24h,
    this.circulating_supply,
    this.time,
    this.percent_change_1h,
  );

  @override
  List<Object> get props => [
        market_cap,
        btc_price,
        percent_change_7d,
        price,
        percent_change_24h,
        total_supply,
        max_supply,
        volume_24h,
        circulating_supply,
        time,
        percent_change_1h,
      ];

  Map<String, Object> toJson() {
    return {
      "market_cap": market_cap,
      "btc_price": btc_price,
      "percent_change_7d": percent_change_7d,
      "price": price,
      "percent_change_24h": percent_change_24h,
      "total_supply": total_supply,
      "max_supply": max_supply,
      "volume_24h": volume_24h,
      "circulating_supply": circulating_supply,
      "time": time,
      "percent_change_1h": percent_change_1h,
    };
  }

  static WeekDayHistoryApiEntity fromJson(Map<String, Object> json) {
    return WeekDayHistoryApiEntity(
      json["market_cap"] as double,
      json["btc_price"] as String,
      json["percent_change_7d"] as double,
      json["price"] as double,
      json["percent_change_24h"] as double,
      json["total_supply"] as double,
      json["max_supply"] as int,
      json["volume_24h"] as double,
      json["circulating_supply"] as double,
      json["time"] as int,
      json["percent_change_1h"] as double,
    );
  }
}
